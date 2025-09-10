pageextension 50022 TransferOrder extends "Transfer Order"
{
    layout
    {
        addafter(Status)
        {
            // field("Approval Status"; Rec."Approval Status")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
            // }
            field(TransferApprovalStatus; TransferApprovalStatus)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Approval Status';
                Editable = false;
                Visible = EnabledTransferWorkflowsExist;
                ToolTip = 'Specifies the approval status for transfer order.';
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
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
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
        }
    }
    trigger OnAfterGetRecord()
    begin
        ApprovalMgmt.GetApprovalStatus(Rec, TransferApprovalStatus, EnabledTransferWorkflowsExist);
    end;

    trigger OnOpenPage()
    begin
        EnabledTransferWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::"Transfer Header", WorkflowEventHandling.RunWorkflowOnSendTransferForApprovalCode());
    end;

    var
        ApprovalMgmt: Codeunit "Approval Mgt. WM";
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Transfer Workflow Evt Handling";
        TransferApprovalStatus: Text[20];
        EnabledTransferWorkflowsExist: Boolean;
}
