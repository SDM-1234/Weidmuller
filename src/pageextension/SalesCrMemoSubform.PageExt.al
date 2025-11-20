namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
pageextension 50118 SalesCrMemoSubform extends "Sales Cr. Memo Subform"
{
    layout
    {
        addfirst(Control1)
        {
            field("Line No."; Rec."Line No.")
            {
                Editable = false;
                ToolTip = 'Specifies the line number.';
                ApplicationArea = All;
            }
        }
    }
}

