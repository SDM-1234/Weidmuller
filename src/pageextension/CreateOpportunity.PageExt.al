namespace WM.WeidmullerDEV;

using Microsoft.CRM.Opportunity;
    
pageextension 50070 CreateOpportunity extends "Create Opportunity"
{
    layout
    {
        addafter("Sales Cycle Code")
        {
            field("Calendar Week"; rec."Calendar Week")
            {
                ToolTip = 'Specifies the value of the Calendar Week field.';
                ApplicationArea = All;
            }
        }
    }
}

