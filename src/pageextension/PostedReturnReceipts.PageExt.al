namespace WM.WeidmullerDEV;

using Microsoft.Sales.History;
    
pageextension 50092 PostedReturnReceipts extends "Posted Return Receipts"
{
    layout
    {
        addafter("No.")
        {
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = All;
            }
        }
    }
}

