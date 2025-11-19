namespace WM.WeidmullerDEV;

using Microsoft.Finance.TaxBase;
    
pageextension 50023 JournalVoucher extends "Journal Voucher"
{
    layout
    {
        addafter("Document No.")
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = all;
            }
        }
    }
}

