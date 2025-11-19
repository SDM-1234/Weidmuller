namespace WM.WeidmullerDEV;

using Microsoft.Warehouse.Document;

pageextension 50097 WhseReceiptLines extends "Whse. Receipt Lines"
{
    layout
    {
        addafter("Bin Code")
        {
            field("EAN No."; Rec."EAN No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the EAN No. field.';
            }
        }
    }
}

