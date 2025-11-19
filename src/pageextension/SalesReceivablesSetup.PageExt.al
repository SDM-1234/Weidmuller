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
                }

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}