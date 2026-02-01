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
        field(50001; "Request Delivery Date Formula"; DateFormula)
        {
            Caption = 'Sales Order Auto Reserve - Request Delivery Date Formula';
            ToolTip = 'Specifies the formula to calculate the Request Delivery Date for sales order lines during the auto-reserve process.';
            DataClassification = ToBeClassified;
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