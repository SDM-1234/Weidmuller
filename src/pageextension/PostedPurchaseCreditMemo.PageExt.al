namespace WM.WeidmullerDEV;

using Microsoft.Purchases.History;
    
pageextension 50102 PostedPurchaseCreditMemo extends "Posted Purchase Credit Memo"
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
                    Editable = false;
                    BlankZero = true;
                }
                field("Box Dimension"; Rec."Box Dimension")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Proforma Contact Name"; Rec."Proforma Contact Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}