namespace WM.WeidmullerDEV;

using Microsoft.Warehouse.Document;
    
pageextension 50085 WhseReceiptSubform extends "Whse. Receipt Subform"
{
    layout
    {
        addafter("Item No.")
        {
            field("EAN No."; Rec."EAN No.")
            {
                ApplicationArea = All;
            }
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = all;
            }
            field("Total No of Boxes"; Rec."Total No of Boxes")
            {
                ApplicationArea = all;
            }
        }
    }

    procedure UpdateByEAN(var WarehouseReceiptHeader1: Record "Warehouse Receipt Header")
    begin
        IF WarehouseReceiptHeader1."EAN No." <> '' THEN
            Rec.SETFILTER("EAN No.", '%1', WarehouseReceiptHeader1."EAN No.")
        ELSE
            Rec.SETRANGE("EAN No.");
        CurrPage.UPDATE();
    end;
}

