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
                field("Starting Line No."; Rec."Starting Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Starting Line No. field.', Comment = '%';
                }
                field("Ending Line No."; Rec."Ending Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ending Line No. field.', Comment = '%';
                }

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}