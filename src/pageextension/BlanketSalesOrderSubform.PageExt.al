namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
pageextension 50065 BlanketSalesOrderSubform extends "Blanket Sales Order Subform"
{
    layout
    {
        addafter(Control49)
        {
            field("Line No."; Rec."Line No.")
            {
                ToolTip = 'Specifies the line number.';
                ApplicationArea = All;
            }
        }
    }
}

