namespace WM.WeidmullerDEV;

using Microsoft.Purchases.Document;

pageextension 50061 PurchaseOrder extends "Purchase Order"
{

    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("Receiving No."; Rec."Receiving No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Receiving No. field.';
            }

            field("Receiving No. Series"; Rec."Receiving No. Series")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Receiving No. Series field.';
            }
        }
    }
}

