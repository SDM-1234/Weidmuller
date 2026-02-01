namespace WM.WeidmullerDEV;

using Microsoft.Sales.Setup;

pageextension 50050 SalesReceivablesSetup extends "Sales & Receivables Setup"
{
    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            group(Weidmuller)
            {
                field("Sales Quote Expiring - Emails"; Rec."Sales Quote Expiring - Emails")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Quote Expiring - Emails field.';
                }
                field("Request Delivery Date Formula"; Rec."Request Delivery Date Formula")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Delivery Date Formula field.';

                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}