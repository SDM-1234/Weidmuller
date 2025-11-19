namespace WM.WeidmullerDEV;

using Microsoft.Purchases.Vendor;

pageextension 50039 VendorList extends "Vendor List"
{
    layout
    {
        addafter("Gen. Bus. Posting Group")
        {
            field("P.A.N. No."; Rec."P.A.N. No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Permanent Account No. of Party';
            }

        }
    }
}


