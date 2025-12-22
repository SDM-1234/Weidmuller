namespace WM.WeidmullerDEV;

using Microsoft.Purchases.History;
    
pageextension 50009 PostedPurchaseRcptSubform extends "Posted Purchase Rcpt. Subform"
{

    //Unsupported feature: Property Modification (Visible) on ""Posted Purchase Rcpt. Subform"(Page 137)".

    layout
    {
        addafter("Variant Code")
        {
            field("Vendor Ship No."; Rec."Vendor Ship No.")
            {
                ToolTip = 'Specifies the value of the Vendor Ship No. field.';
                Caption = 'Vendor Ship No.';
                ApplicationArea = All;

            }
        }
    }
}

