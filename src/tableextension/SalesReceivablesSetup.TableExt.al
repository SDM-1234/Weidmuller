namespace WM.WeidmullerDEV;

using Microsoft.Sales.Setup;
    
tableextension 50020 SalesReceivablesSetup extends "Sales & Receivables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Sales Quote Expiring - Emails"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Caption = 'Sales Quote Expiring - Emails';
            ToolTip = 'Specifies the email body to be sent to customers whose sales quotes are expiring within the next 7 days.';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
}