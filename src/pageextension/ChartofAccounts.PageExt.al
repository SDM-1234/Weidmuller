namespace WM.WeidmullerDEV;

using Microsoft.Finance.GeneralLedger.Account;

pageextension 50018 ChartofAccounts extends "Chart of Accounts"
{
    layout
    {


        addafter("Account Type")
        {
            field("SAP GL No."; Rec."SAP GL No.")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the SAP GL No. field.';
            }

        }
    }
}

