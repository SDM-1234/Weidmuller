namespace WM.WeidmullerDEV;

using Microsoft.Finance.Analysis;

pageextension 50052 GLBalance extends "G/L Balance"
{
    layout
    {
        addafter("No.")
        {
            field("Account Type"; Rec."Account Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the purpose of the account. Total: Used to total a series of balances on accounts from many different account groupings. To use Total, leave this field blank. Begin-Total: A marker for the beginning of a series of accounts to be totaled that ends with an End-Total account. End-Total: A total of a series of accounts that starts with the preceding Begin-Total account. The total is defined in the Totaling field.';
            }
            field(Totaling; Rec.Totaling)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies an account interval or a list of account numbers. The entries of the account will be totaled to give a total balance. How entries are totaled depends on the value in the Account Type field.';
            }
        }
    }
}

