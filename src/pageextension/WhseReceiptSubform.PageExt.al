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
                ToolTip = 'Specifies the value of the EAN No. field.';
            }
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the line number.';
            }
            field("Total No of Boxes"; Rec."Total No of Boxes")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Total No of Boxes field.';
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

