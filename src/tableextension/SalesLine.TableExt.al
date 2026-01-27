namespace WM.WeidmullerDEV;

using Microsoft.Finance.GST.Base;
using Microsoft.Finance.Reports;
using Microsoft.Finance.TaxEngine.TaxTypeHandler;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Ledger;
using Microsoft.Sales.Document;
using Microsoft.Sales.Customer;

tableextension 50030 SalesLine extends "Sales Line"
{
    fields
    {

        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                //SE-E859.s
                UpdateConfirmShipDate();
                //SE-E859.e
            end;
        }

        modify(Quantity)
        {
            trigger OnBeforeValidate()
            var
                Item: Record Item;
            begin
                //SE-E859.s
                IF "Document Type" IN ["Document Type"::Order, "Document Type"::Quote] THEN
                    IF Type = Type::Item THEN BEGIN
                        Item := GetItem();
                        IF (xRec.Quantity <> Quantity) THEN
                            IF (Item."Order Multiple" <> 0) AND (Quantity >= Item."Order Multiple") THEN BEGIN
                                IF (Quantity MOD Item."Order Multiple") <> 0 THEN
                                    FIELDERROR(Quantity, STRSUBSTNO(Text061Lbl, Item."Order Multiple"));
                            END ELSE
                                FIELDERROR(Quantity, STRSUBSTNO(Text061Lbl, Item."Order Multiple"));
                    END;

                //SE-E859.e

            end;
        }


        modify("Unit Price")
        {
            trigger OnBeforeValidate()
            begin
                IF ((Rec."Unit Price" > 0) AND (xRec."Unit Price" <> 0)) AND (Rec.Quantity = xRec.Quantity) THEN
                    SalesPriceManagement.UnitPriceChangeValidation(Rec);

            end;
        }

        field(50000; "Package No."; Code[20])
        {
        }
        field(50001; Weight; Decimal)
        {
        }
        field(50002; "Confirm Shipping Date"; Date)
        {
            Description = 'SE-E859';
        }
        field(50003; Notification; Boolean)
        {
            Description = 'SE-E859';
        }
        field(50004; "PO No."; Code[35])
        {
            Caption = 'External Document No.';
            Description = 'SE-E859';
        }
        field(50005; "Customer Name"; Text[50])
        {
            CalcFormula = Min(Customer.Name WHERE("No." = FIELD("Sell-to Customer No.")));
            FieldClass = FlowField;
        }
        field(50015; "Latest UnitPrice"; Decimal)
        {
            Description = '//SE-E859';
            Editable = false;
        }
        field(50016; "Latest Invoice Date"; Date)
        {
            Description = '//SE-E859';
            Editable = false;
        }
        field(50017; "OC No"; Code[20])
        {
            Description = '//SE-E859';
        }
        field(50080; MOQ; Decimal)
        {
            CalcFormula = Lookup(Item."Minimum Order Quantity" WHERE("No." = FIELD("No.")));
            Description = 'ZE_LIJO';
            FieldClass = FlowField;
            editable = false;
        }
        field(50081; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(50082; "Payment Terms Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(60000; "Shipment Date Updated"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Caption = 'Shipment Date Updated';
            ToolTip = 'Indicates whether the shipment date has been updated.';
        }
    }
    keys
    {
    }



    trigger OnAfterInsert()
    var
        SalesHeader2: Record "Sales Header";
    begin
        IF SalesHeader2.GET("Document Type", "Document No.") THEN;
        Status := SalesHeader2.Status.AsInteger();
        "Payment Terms Code" := SalesHeader2."Payment Terms Code";

        "PO No." := SalesHeader2."External Document No.";

    end;


    var
        Item: Record Item;
        SalesHeader: Record "Sales Header";

    //Need to Update Sales Header variable Where to call or Set
    local procedure UpdateConfirmShipDate()

    begin
        IF "Document Type" = "Document Type"::Quote THEN begin
            IF Type = Type::Item THEN
                IF (SalesHeader."Posting Date" <> 0D) THEN BEGIN
                    GetItem();
                    VALIDATE("Confirm Shipping Date", CALCDATE(Item."Lead Time Calculation", SalesHeader."Posting Date"));
                END ELSE
                    VALIDATE("Confirm Shipping Date", WORKDATE());
        end else
            IF "Document Type" = "Document Type"::Order THEN
                IF Type = Type::Item THEN
                    VALIDATE("Confirm Shipping Date", WORKDATE());
    end;

    procedure UpdateLatestUnitPrice(var SalesHeader: Record "Sales Header")
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        ItemLedgerEntry.RESET();
        ItemLedgerEntry.SETCURRENTKEY("Document Type", "Source Type", "Source No.", "Item No.");
        ItemLedgerEntry.SETRANGE("Document Type", ItemLedgerEntry."Document Type"::"Sales Shipment");
        ItemLedgerEntry.SETRANGE("Source Type", ItemLedgerEntry."Source Type"::Customer);
        ItemLedgerEntry.SETRANGE("Source No.", SalesHeader."Sell-to Customer No.");
        ItemLedgerEntry.SETRANGE("Item No.", "No.");
        IF ItemLedgerEntry.FINDLAST() THEN BEGIN
            ItemLedgerEntry.CALCFIELDS("Sales Amount (Actual)");
            IF ABS(ItemLedgerEntry.Quantity) <> 0 THEN
                "Latest UnitPrice" := (ItemLedgerEntry."Sales Amount (Actual)" / ABS(ItemLedgerEntry.Quantity))
            ELSE
                "Latest UnitPrice" := 0;
            "Latest Invoice Date" := ItemLedgerEntry."Posting Date";
        END;
    end;

    procedure GetGSTAmounts(): Decimal
    var
        GSTSetup: Record "GST Setup";
        TaxTransactionValue: Record "Tax Transaction Value";
        OrderConfReport: Report "Order Confirmation GST";
        SGSTAmt, CGSTAmt, IGSTAmt, CessAmount : Decimal;
    begin
        GSTSetup.Get();
        TaxTransactionValue.Reset();
        TaxTransactionValue.SetRange("Tax Record ID", Rec.RecordId);
        TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        if TaxTransactionValue.FindSet() then
            repeat
                case TaxTransactionValue."Value ID" of
                    6:
                        SGSTAmt += Round(TaxTransactionValue.Amount, OrderConfReport.GetGSTRoundingPrecision(SGSTLbl));
                    2:
                        CGSTAmt += Round(TaxTransactionValue.Amount, OrderConfReport.GetGSTRoundingPrecision(CGSTLbl));
                    3:
                        IGSTAmt += Round(TaxTransactionValue.Amount, OrderConfReport.GetGSTRoundingPrecision(IGSTLbl));
                end;
            until TaxTransactionValue.Next() = 0;

        TaxTransactionValue.SetRange("Tax Type", GSTSetup."Cess Tax Type");
        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
        TaxTransactionValue.SetRange("Value Type");
        if TaxTransactionValue.FindSet() then
            repeat
                CessAmount += Round(TaxTransactionValue.Amount, OrderConfReport.GetGSTRoundingPrecision(SGSTLbl));
            until TaxTransactionValue.Next() = 0;
        exit(SGSTAmt + CGSTAmt + IGSTAmt + CessAmount);
    end;

    var
        SalesPriceManagement: Codeunit "Sales Price Management";
#pragma warning disable
        Text061Lbl: Label 'must be Multiple of %1';
        IGSTLbl: Label 'IGST';
        SGSTLbl: Label 'SGST';
        CGSTLbl: Label 'CGST';
#pragma warning restore
}

