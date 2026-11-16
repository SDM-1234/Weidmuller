namespace WM.WeidmullerDEV;

using Microsoft.Purchases.History;

pageextension 50173 GetReceiptLines extends "Get Receipt Lines"
{
    layout
    {
        addafter(Description)
        {
            field("Vendor Shipment No."; Rec."Vendor Ship No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the vendor shipment number stored on the posted purchase receipt.';
            }
            field("Bill of Entry No."; Rec."Bill of Entry No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Bill of Entry number for the posted purchase receipt.';
            }
            field("Bill of Entry Date"; Rec."Bill of Entry Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Bill of Entry date for the posted purchase receipt.';
            }
        }
    }
}
