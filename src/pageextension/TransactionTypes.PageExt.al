namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Intrastat;
    
pageextension 50042 TransactionTypes extends "Transaction Types"
{
    layout
    {
        addlast(Control1)
        {
            field("Special Price"; Rec."Special Price")
            {
                ToolTip = 'Specifies the value of the Special Price field.';
                ApplicationArea = All;
            }
        }
    }
}

