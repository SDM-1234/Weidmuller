namespace WM.WeidmullerDEV;

using Microsoft.Purchases.History;
    
pageextension 50016 PostedPurchaseCreditMemos extends "Posted Purchase Credit Memos"
{
    layout
    {
        addafter("Currency Code")
        {
            field("Currency Factor"; Rec."Currency Factor")
            {
                ApplicationArea = All;
            }
        }
    }
}

