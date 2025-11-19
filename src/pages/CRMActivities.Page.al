namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
using System.Automation;
using Microsoft.Foundation.Task;

page 50021 "CRM Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "CRM Cue";

    layout
    {
        area(content)
        {
            cuegroup("For CRM")
            {
                Caption = 'For CRM';
                field(Contacts; Rec.Contacts)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of contacts.';
                }
                field("Open Opportunities"; Rec."Open Opportunities")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of open opportunities.';
                }
                field("Closed Opportunities"; Rec."Closed Opportunities")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of closed opportunities.';
                }
                field("Overdue To-Dos"; Rec."Overdue To-Dos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of overdue to-dos.';
                }
                field("Upcoming To-Dos"; Rec."Upcoming To-Dos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of upcoming to-dos.';
                }
                field("Interactions This Month"; Rec."Interactions This Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of interactions this month.';
                }
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of requests to approve.';
                    DrillDownPageId = "Requests to Approve";
                    LookupPageId = "Requests to Approve";
                }
            }
            cuegroup("For Quotations and Order Processing")
            {
                Caption = 'For Quotations and Order Processing';
                field("Open Quotes"; Rec."Open Quotes")
                {
                    DrillDownPageID = "Sales Quotes";
                    LookupPageID = "Sales Quotes";
                    ToolTip = 'Specifies the number of open quotes.';
                    ApplicationArea = All;
                }
                field("Overdue Orders for Delivery"; Rec."Overdue Orders for Delivery")
                {
                    DrillDownPageID = "Sales Order List";
                    LookupPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of overdue orders for delivery.';
                    ApplicationArea = All;
                }
                field("Upcoming Orders for Delivery"; Rec."Upcoming Orders for Delivery")
                {
                    DrillDownPageID = "Sales Order List";
                    LookupPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of upcoming orders for delivery.';
                    ApplicationArea = All;
                }
                field("Outstanding Invoices"; Rec."Outstanding Invoices")
                {
                    ToolTip = 'Specifies the number of outstanding invoices.';
                    ApplicationArea = All;
                }
                field(Customers; Rec.Customers)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of customers.';
                }
            }
            cuegroup("For User Task")
            {
                Caption = 'For User Task';
                field("UT Assigned By Me - Completed"; Rec."UT Assigned By Me - Completed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of user tasks assigned by me that are completed.';
                    DrillDownPageID = "User Task List";
                    LookupPageID = "User Task List";
                }
                field("UT Assigned By Me - Pending"; Rec."UT Assigned By Me - Pending")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of user tasks assigned by me that are pending.';
                    DrillDownPageID = "User Task List";
                    LookupPageID = "User Task List";

                }
                field("UT Assigned To Me - Completed"; Rec."UT Assigned To Me - Completed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of user tasks assigned to me that are completed.';
                    DrillDownPageID = "User Task List";
                    LookupPageID = "User Task List";

                }
                field("UT Assigned To Me - Pending"; Rec."UT Assigned To Me - Pending")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of user tasks assigned to me that are pending.';
                    DrillDownPageID = "User Task List";
                    LookupPageID = "User Task List";

                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.RESET();

        Rec.FILTERGROUP(2);
        Rec.SETRANGE("Team Code", Rec.GetTeamCode());
        Rec.SETRANGE("Date Filter", 0D, WORKDATE() - 1);
        Rec.SETFILTER("Date Filter2", '>=%1', WORKDATE());
        Rec.SETRANGE("Date Filter3", CALCDATE('<CM-1M+1D>', WORKDATE()), WORKDATE());
        Rec.SETFILTER("User ID Filter", USERID);
        Rec.FILTERGROUP(0);
    end;
}

