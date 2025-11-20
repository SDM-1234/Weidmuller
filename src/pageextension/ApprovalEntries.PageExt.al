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
                ToolTip = 'Specifies the value of the Entry No. field.';
            }
            field("Approval Code"; Rec."Approval Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Approval Code field.';
            }
            field("Record ID to Approve"; Rec."Record ID to Approve")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Record ID to Approve field.';
            }
            field("Number of Approved Requests"; Rec."Number of Approved Requests")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Number of Approved Requests field.';
            }
            field("Number of Rejected Requests"; Rec."Number of Rejected Requests")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Number of Rejected Requests field.';
            }
            field("Related to Change"; Rec."Related to Change")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Related to Change field.';
            }
        }
    }
}

