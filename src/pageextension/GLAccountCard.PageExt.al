namespace WM.WeidmullerDEV;

using Microsoft.Finance.GeneralLedger.Account;
    
pageextension 50030 GLAccountCard extends "G/L Account Card"
{
    layout
    {
        addafter("No. 2")
        {
            field("SAP GL No."; Rec."SAP GL No.")
            {
                ApplicationArea = All;
            }
        }
    }
}

