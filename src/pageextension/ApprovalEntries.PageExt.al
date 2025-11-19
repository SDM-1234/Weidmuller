namespace WM.WeidmullerDEV;

using System.Automation;
    
pageextension 50090 ApprovalEntries extends "Approval Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field("Entry No."; Rec."Entry No.")
            {
                ApplicationArea = All;
            }
            field("Approval Code"; Rec."Approval Code")
            {
                ApplicationArea = All;
            }
            field("Record ID to Approve"; Rec."Record ID to Approve")
            {
                ApplicationArea = All;
            }
            field("Number of Approved Requests"; Rec."Number of Approved Requests")
            {
                ApplicationArea = All;
            }
            field("Number of Rejected Requests"; Rec."Number of Rejected Requests")
            {
                ApplicationArea = All;
            }
            field("Related to Change"; Rec."Related to Change")
            {
                ApplicationArea = All;
            }
        }
    }
}

