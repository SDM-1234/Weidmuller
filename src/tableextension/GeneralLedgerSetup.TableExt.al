namespace WM.WeidmullerDEV;

using Microsoft.Finance.GeneralLedger.Setup;
    
tableextension 50013 GeneralLedgerSetup extends "General Ledger Setup"
{
    fields
    {
        field(50000; "Dunning Letter Date"; Date)
        {
            Caption = 'Dunning Letter Date';
            DataClassification = CustomerContent;
        }
    }
}
