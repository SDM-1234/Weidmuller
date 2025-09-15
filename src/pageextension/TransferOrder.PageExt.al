pageextension 50022 TransferOrder extends "Transfer Order"
{
    layout
    {
        addafter(Status)
        {
            field("Approval Status"; Rec."Approval Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
            }
        }
        addlast(General)
        {
            field("Quality Inspection No."; Rec."Quality Inspection No.")
            {
                ApplicationArea = All;
            }
        }
        addlast(factboxes)
        {
            part("Attached Documents List"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
                UpdatePropagation = Both;
                SubPageLink = "Table ID" = const(Database::"Transfer Header"),
                              "No." = field("No.");
            }
        }
    }

    actions
    {
        addafter("Re&lease")
        {
            action("Send for Approval")
            {
                ApplicationArea = All;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send for Approval action.';

                trigger OnAction()
                var
                    TransferAppMgt: Codeunit "Transfer Approval Mgmt";
                begin
                    TransferAppMgt.OnSendRequestforApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Approval Request';
                Image = CancelApprovalRequest;
                ToolTip = 'Cancel sending the transfer order for approval.';
                trigger OnAction()
                var
                    TransferAppMgt: Codeunit "Transfer Approval Mgmt";
                begin
                    TransferAppMgt.OnCancelRequestForApproval(Rec);
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Reopen';
                Image = ReOpen;
                ToolTip = 'Reopen';

                trigger OnAction()
                begin
                    Rec.Validate("Status", Rec."Status"::Open);
                    Rec.Validate("Approval Status", Rec."Approval Status"::Open);
                    Rec.Modify(true);
                    CurrPage.Update();
                end;
            }
        }
        addlast(Promoted)
        {
            group("Category_Request Approval")
            {
                Caption = 'Request Approval';
                actionref(SendApprovalRequest_Promoted; "Send for Approval")
                {
                }
                actionref(CancelApprovalRequest_Promoted; "Cancel Approval Request")
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
        }
    }
}
