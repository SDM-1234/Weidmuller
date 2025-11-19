namespace WM.WeidmullerDEV;

using Microsoft.Purchases.Document;
    
pageextension 50101 PurchaseCreditMemo extends "Purchase Credit Memo"
{
    layout
    {
        Addlast(content)
        {
            group(Weidmuller)
            {
                field("No. of Boxes"; Rec."No. of Boxes")
                {
                    ApplicationArea = All;
                    BlankZero = true;
                }
                field("Box Dimension"; Rec."Box Dimension")
                {
                    ApplicationArea = All;
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    ApplicationArea = All;
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ApplicationArea = All;
                }
                field("Proforma Contact Name"; Rec."Proforma Contact Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}