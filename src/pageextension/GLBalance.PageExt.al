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
            }
            field(Totaling; Rec.Totaling)
            {
                ApplicationArea = All;
            }
        }
    }
}

