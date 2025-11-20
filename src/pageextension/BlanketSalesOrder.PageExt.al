namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
pageextension 50062 BlanketSalesOrder extends "Blanket Sales Order"
{
    layout
    {
        modify("External Document No.")
        {
            Caption = 'PO No.';
        }
        addafter(Control21)
        {
            field(Validity; Rec.Validity)
            {
                Editable = false;
                ToolTip = 'Specifies the value of the Validity field.';
                ApplicationArea = All;
            }
            field("Quote No."; Rec."Quote No.")
            {
                ToolTip = 'Specifies the number of the sales quote that the sales order was created from. You can track the number to sales quote documents that you have printed, saved, or emailed.';
                ApplicationArea = All;
            }
        }
    }
}

