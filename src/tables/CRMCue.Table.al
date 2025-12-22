namespace WM.WeidmullerDEV;

using Microsoft.CRM.Contact;
using Microsoft.CRM.Interaction;
using Microsoft.CRM.Opportunity;
using Microsoft.CRM.Task;
using Microsoft.CRM.Team;
using Microsoft.Foundation.Task;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;
using Microsoft.Sales.Receivables;
using System.Automation;
using System.Security.User;
    
table 50001 "CRM Cue"
{

    fields
    {
        field(2; Contacts; Integer)
        {
            CalcFormula = Count(Contact WHERE("Salesperson Code" = FIELD(FILTER("Salesperson Filter"))));
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Open Opportunities"; Integer)
        {
            CalcFormula = Count(Opportunity WHERE("Salesperson Code" = FIELD(FILTER("Salesperson Filter")),
                                                   Status = FILTER("Not Started" | "In Progress")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Closed Opportunities"; Integer)
        {
            CalcFormula = Count(Opportunity WHERE("Salesperson Code" = FIELD(FILTER("Salesperson Filter")),
                                                   Status = FILTER(Lost | Won)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Overdue To-Dos"; Integer)
        {
            CalcFormula = Count("To-do" WHERE("Salesperson Code" = FIELD(FILTER("Salesperson Filter")),
                                             Closed = CONST(false),
                                             Date = FIELD("Date Filter"),
                                             "System To-do Type" = CONST("Contact Attendee")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Upcoming To-Dos"; Integer)
        {
            CalcFormula = Count("To-do" WHERE("Salesperson Code" = FIELD(FILTER("Salesperson Filter")),
                                             Closed = CONST(false),
                                             Date = FIELD("Date Filter2"),
                                             "System To-do Type" = CONST("Contact Attendee")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Interactions This Month"; Integer)
        {
            CalcFormula = Count("Interaction Log Entry" WHERE("Salesperson Code" = FIELD(FILTER("Salesperson Filter")),
                                                               Date = FIELD("Date Filter3")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Open Quotes"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Quote),
                                                      "Salesperson Code" = FIELD(FILTER("Salesperson Filter"))));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Overdue Orders for Delivery"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Order),
                                                      "Salesperson Code" = FIELD(FILTER("Salesperson Filter")),
                                                      "Requested Delivery Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Upcoming Orders for Delivery"; Integer)
        {
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Order),
                                                      "Salesperson Code" = FIELD(FILTER("Salesperson Filter")),
                                                      "Requested Delivery Date" = FIELD("Date Filter2")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Outstanding Invoices"; Integer)
        {
            CalcFormula = Count("Cust. Ledger Entry" WHERE("Document Type" = CONST(Invoice),
                                                            "Salesperson Code" = FIELD(FILTER("Salesperson Filter")),
                                                            Open = CONST(true),
                                                            Amount = FILTER(<> 0)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; Customers; Integer)
        {
            CalcFormula = Count(Customer WHERE("Salesperson Code" = FIELD(FILTER("Salesperson Filter"))));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "UT Assigned By Me - Completed"; Integer)
        {
            CalcFormula = Count("User Task" WHERE("Created By User Name" = FIELD(FILTER("User ID Filter")),
                                                   "Percent Complete" = CONST(100)));
            Caption = 'User Task Assigned By Me - Completed';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "UT Assigned By Me - Pending"; Integer)
        {
            CalcFormula = Count("User Task" WHERE("Created By User Name" = FIELD(FILTER("User ID Filter")),
                                                   "Percent Complete" = FILTER(< 100)));
            Caption = 'User Task Assigned By Me - Pending';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "UT Assigned To Me - Completed"; Integer)
        {
            CalcFormula = Count("User Task" WHERE("Assigned To User Name" = FIELD(FILTER("User ID Filter")),
                                                   "Percent Complete" = CONST(100)));
            Caption = 'User Task Assigned To Me - Completed';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "UT Assigned To Me - Pending"; Integer)
        {
            CalcFormula = Count("User Task" WHERE("Assigned To User Name" = FIELD(FILTER("User ID Filter")),
                                                   "Percent Complete" = FILTER(< 100)));
            Caption = 'User Task Assigned To Me - Pending';
            Editable = false;
            FieldClass = FlowField;
        }
        field(101; "Team Code"; Code[10])
        {
            Caption = 'Team Code';
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = Team;
        }
        field(102; "Salesperson Filter"; Text[250])
        {
            Caption = 'Salesperson Code';
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = "Salesperson/Purchaser";
        }
        field(103; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(104; "Date Filter2"; Date)
        {
            Caption = 'Date Filter 2';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(105; "Date Filter3"; Date)
        {
            Caption = 'Date Filter 2';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(106; "User ID Filter"; Code[50])
        {
            FieldClass = FlowFilter;
        }
        field(107; "Requests to Approve"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Team Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
    procedure GetTeamCode(): Code[10]
    var
        User: Record "User Setup";
    begin
        User.GET(UserId);
        IF User."Team Code" = '' THEN
            EXIT;
        SETRANGE("Team Code", User."Team Code");
        IF NOT FINDFIRST() THEN BEGIN
            INIT();
            "Team Code" := User."Team Code";
            "Salesperson Filter" := GetSalesPersonFilter("Team Code");
            INSERT();
        END ELSE BEGIN
            "Salesperson Filter" := GetSalesPersonFilter("Team Code");
            MODIFY();
        END;

        EXIT("Team Code");
    end;

    procedure GetSalesPersonFilter(pTeamCode: Code[10]) rReturn: Text[250]
    var
        TeamSalesperson: Record "Team Salesperson";
    begin
        TeamSalesperson.SETRANGE("Team Code", pTeamCode);
        IF TeamSalesperson.FINDSET(false) THEN
            repeat
                IF rReturn = '' THEN
                    rReturn += TeamSalesperson."Salesperson Code"
                ELSE
                    rReturn += '|' + TeamSalesperson."Salesperson Code";
            until TeamSalesperson.NEXT() = 0;
    end;
}

