namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Item;
using Microsoft.Warehouse.Document;
    
tableextension 50045 WarehouseReceiptHeader extends "Warehouse Receipt Header"
{
    fields
    {

        modify("Vendor Shipment No.")
        {
            caption = 'Vendor Invoice No.';
        }
        field(50000; "EAN No."; Code[13])
        {
            Description = 'SE-SE859';

            trigger OnValidate()
            begin

                IF "EAN No." <> '' THEN
                    CheckIsValidEAN("EAN No.");
            end;
        }
    }

    local procedure CheckIsValidEAN(L_EAN_No: Code[13])
    var
        L_Item: Record Item;
    begin
        IF STRLEN(L_EAN_No) > 13 THEN
            ERROR(Text029_Tok);
        IF STRLEN(L_EAN_No) < 13 THEN
            ERROR(Text030_Tok);
        L_Item.RESET();
        L_Item.SETCURRENTKEY("EAN No.");
        L_Item.SETRANGE("EAN No.", L_EAN_No);
        IF NOT L_Item.ISEMPTY THEN
            ERROR(Text031_Tok);
    end;

    procedure ClearBins()
    var
        WarehouseReceiptLine: Record "Warehouse Receipt Line";
    begin
        WarehouseReceiptLine.RESET();
        WarehouseReceiptLine.SETCURRENTKEY("No.", "Bin Code");
        WarehouseReceiptLine.SETRANGE("No.", "No.");
        WarehouseReceiptLine.SETFILTER("Bin Code", '<>%1', '');
        WarehouseReceiptLine.MODIFYALL("Bin Code", '');
    end;

    var
        Text029_Tok: Label 'Your EAN number is not valid. Its is more than 13.';
        Text030_Tok: Label 'Your EAN number is not valid. Its is less than 13.';
        Text031_Tok: Label 'Your EAN number is Already Existing.';
}

