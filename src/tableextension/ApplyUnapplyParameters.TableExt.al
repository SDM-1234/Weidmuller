namespace WM.WeidmullerDEV;

using Microsoft.Finance.ReceivablesPayables;
    
tableextension 50009 "ApplyUnapplyParameters" extends "Apply Unapply Parameters"
{
    fields
    {
        field(50000; UpdateBackBlocked; Boolean)
        {
            Caption = 'UpdateBackBlocked';
            DataClassification = ToBeClassified;
            ToolTip = 'Indicates whether the back-blocked status of the customer should be updated.';
        }
    }
}
