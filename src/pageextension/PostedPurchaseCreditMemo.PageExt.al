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
                    ToolTip = 'Specifies the value of the No. of Boxes field.';
                }
                field("Box Dimension"; Rec."Box Dimension")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Box Dimension field.';
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Gross Weight field.';
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Net Weight field.';
                }
                field("Proforma Contact Name"; Rec."Proforma Contact Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Proforma Contact Name field.';
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}