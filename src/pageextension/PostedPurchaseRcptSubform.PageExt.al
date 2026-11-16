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
                ToolTip = 'Specifies the vendor invoice number for the posted receipt.';
                ApplicationArea = All;
            }
            field("Bill of Entry No."; Rec."Bill of Entry No.")
            {
                ToolTip = 'Specifies the Bill of Entry number for the posted receipt.';
                ApplicationArea = All;
            }
            field("Bill of Entry Date"; Rec."Bill of Entry Date")
            {
                ToolTip = 'Specifies the Bill of Entry date for the posted receipt.';
                ApplicationArea = All;
            }
        }
    }
}
