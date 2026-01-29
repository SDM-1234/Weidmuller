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

        field(50001; "Starting Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Starting Line No.';
            ToolTip = 'Specifies the Starting Line No. to be export posted sales invoice in case of more than 100 lines.';
        }
        field(50002; "Ending Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Ending Line No.';
            ToolTip = 'Specifies the Ending Line No. to be export posted sales invoice in case of more than 100 lines.';
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