namespace WM.WeidmullerDEV;

using Microsoft.Finance.GeneralLedger.Account;
    
tableextension 50015 GLAccount extends "G/L Account"
{
    fields
    {
        field(50000; "SAP GL No."; Code[20])
        {
            Description = 'SE-E859';
        }
    }
}

