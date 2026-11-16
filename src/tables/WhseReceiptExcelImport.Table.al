namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Item;
using Microsoft.Inventory.Location;
using Microsoft.Purchases.Document;
using Microsoft.Warehouse.Structure;
using Microsoft.Foundation.UOM;

table 50170 "Whse. Receipt Excel Import"
{
    Caption = 'Whse. Receipt Excel Import';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; BigInteger)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "Purchase Order No."; Code[20])
        {
            Caption = 'Purchase Order No.';
            //TableRelation = "Purchase Header"."No." where("Document Type" = const(Order));

            trigger OnValidate()
            begin
                ResetValidation();
                UpdateLocationCode();
            end;
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            //TableRelation = Item."No.";

            trigger OnValidate()
            begin
                ResetValidation();
            end;
        }
        field(4; "Vendor Invoice No."; Code[35])
        {
            Caption = 'Vendor Invoice No.';

            trigger OnValidate()
            begin
                ResetValidation();
            end;
        }
        field(5; "BOE No."; Code[20])
        {
            Caption = 'BOE No.';

            trigger OnValidate()
            begin
                ResetValidation();
            end;
        }
        field(6; "BOE Date"; Date)
        {
            Caption = 'BOE Date';

            trigger OnValidate()
            begin
                ResetValidation();
            end;
        }
        field(7; "Item Description"; Text[100])
        {
            Caption = 'Item Description';
        }
        field(8; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure';

            trigger OnValidate()
            begin
                ResetValidation();
            end;
        }
        field(9; "Qty. to Receive"; Decimal)
        {
            Caption = 'Qty. to Receive';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                if "Qty. to Receive" <= 0 then
                    Error(QtyMustBePositiveErr);
                ResetValidation();
            end;
        }
        field(10; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';

            trigger OnValidate()
            begin
                ResetValidation();
            end;
        }
        field(11; "Outstanding Quantity"; Decimal)
        {
            Caption = 'Outstanding Quantity';
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(12; Status; Boolean)
        {
            Caption = 'Status';
            Editable = false;
        }
        field(13; Reason; Text[250])
        {
            Caption = 'Reason';
            Editable = false;
        }
        field(14; "Excel Row No."; Integer)
        {
            Caption = 'Excel Row No.';
            Editable = false;
        }
        field(15; "Warehouse Receipt No."; Code[20])
        {
            Caption = 'Warehouse Receipt No.';
            Editable = false;
        }
        field(16; Processed; Boolean)
        {
            Caption = 'Processed';
            Editable = false;
        }
        field(17; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            //TableRelation = Location.Code;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(PurchaseOrderItem; "Purchase Order No.", "Item No.", Processed)
        {
        }
    }

    var
        QtyMustBePositiveErr: Label 'Quantity to receive must be greater than zero.';
        ProcessedLineNotEditableErr: Label 'A processed import line cannot be changed.';

    local procedure ResetValidation()
    begin
        if Processed then
            Error(ProcessedLineNotEditableErr);
        Status := false;
        Clear(Reason);
        "Outstanding Quantity" := 0;
        "Warehouse Receipt No." := '';
    end;

    local procedure UpdateLocationCode()
    var
        PurchaseHeader: Record "Purchase Header";
    begin
        if PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, "Purchase Order No.") then
            "Location Code" := PurchaseHeader."Location Code"
        else
            "Location Code" := '';
    end;
}
