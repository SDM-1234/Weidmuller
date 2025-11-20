namespace WM.WeidmullerDEV;

using Microsoft.CRM.RoleCenters;
    
pageextension 50006 SalesRelationshipMgrRC extends "Sales & Relationship Mgr. RC"
{
    layout
    {
        // Add changes to page layout here
        addfirst(rolecenter)
        {
            part(CrmActivities; "CRM Activities")
            {
                ApplicationArea = RelationshipMgmt;
            }
            part(OpportunityChartWm; "Opportunity Chart WM")
            {
                ApplicationArea = RelationshipMgmt;
            }
        }
        Modify(Control1)
        {
            Visible = false;
        }
        Modify(Control56)
        {
            Visible = false;
        }
        Modify("Job Queue Tasks Activities")
        {
            Visible = false;
        }
        Modify("Emails")
        {
            Visible = false;
        }
        Modify(ApprovalsActivities)
        {
            Visible = false;
        }
        Modify(Control16)
        {
            Visible = false;
        }
        Modify(Control6)
        {
            Visible = false;
        }
        Modify(Control11)
        {
            Visible = false;
        }
        Modify(PowerBIEmbeddedReportPart)
        {
            Visible = false;
        }
        Modify("My Job Queue")
        {
            Visible = false;
        }
        Modify(Control4)
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}
