namespace WM.WeidmullerDEV;

using Microsoft.Purchases.Document;

pageextension 50100 PurchaseReturnOrder extends "Purchase Return Order"
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
                    ToolTip = 'Specifies the value of the No. of Boxes field.';
                }
                field("Box Dimension"; Rec."Box Dimension")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Box Dimension field.';
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gross Weight field.';
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Net Weight field.';
                }
                field("Proforma Contact Name"; Rec."Proforma Contact Name")
                {
                    ApplicationArea = All;
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