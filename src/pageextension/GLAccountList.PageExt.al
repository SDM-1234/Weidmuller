namespace WM.WeidmullerDEV;

using Microsoft.Finance.GeneralLedger.Account;
    
pageextension 50031 GLAccountList extends "G/L Account List"
{
    layout
    {
        addafter("No.")
        {
            field("SAP GL No."; Rec."SAP GL No.")
            {
                ApplicationArea = All;
            }
        }
    }
}

