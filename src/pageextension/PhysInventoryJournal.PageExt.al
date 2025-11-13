pageextension 50025 PhysInventoryJournal extends "Phys. Inventory Journal"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field(PhysInvtApprovalStatus; PhysInvtApprovalStatus)
            {
                ApplicationArea = All;
                Caption = 'Approval Status';
                Editable = false;
                Visible = true;
                ToolTip = 'Specifies the approval status for Physical Inventory Journal.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter(Page)
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';
                group(SendApprovalRequest)
                {
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    action(SendApprovalRequestJournalLine)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Selected Journal Lines';
                        Enabled = EnabledPhysInvtWorkflowsExist;
                        Image = SendApprovalRequest;
                        ToolTip = 'Send selected journal lines for approval.';

                        trigger OnAction()
                        var
                            [SecurityFiltering(SecurityFilter::Filtered)]
                            ItemJnlLine: Record "Item Journal Line";
                            ApprovalsMgmt: Codeunit "Phy Invt Approval Mgmt";
                        begin
                            GetCurrentlySelectedLines(ItemJnlLine);
                            ApprovalsMgmt.OnSendRequestforApproval(ItemJnlLine);
                        end;
                    }
                }
                group(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    action(CancelApprovalRequestJournalLine)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Selected Journal Lines';
                        Enabled = EnabledPhysInvtWorkflowsExist;
                        Image = CancelApprovalRequest;
                        ToolTip = 'Cancel sending selected journal lines for approval.';

                        trigger OnAction()
                        var
                            [SecurityFiltering(SecurityFilter::Filtered)]
                            ItemJnlLine: Record "Item Journal Line";
                            ApprovalsMgmt: Codeunit "Phy Invt Approval Mgmt";
                        begin
                            GetCurrentlySelectedLines(ItemJnlLine);
                            ApprovalsMgmt.OnCancelRequestForApproval(ItemJnlLine);
                        end;
                    }
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
            }
        }

        addafter(Category_Category6)
        {
            group("Category_Request Approval")
            {
                Caption = 'Request Approval';

                group("Category_Send Approval Request")
                {
                    Caption = 'Send Approval Request';
                    actionref(SendApprovalRequestJournalLine_Promoted; SendApprovalRequestJournalLine)
                    {
                    }
                }
                group("Category_Cancel Approval Request")
                {
                    Caption = 'Cancel Approval Request';
                    actionref(CancelApprovalRequestJournalLine_Promoted; CancelApprovalRequestJournalLine)
                    {
                    }
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        ApprovalMgmt.GetApprovalStatus(Rec, PhysInvtApprovalStatus, EnabledPhysInvtWorkflowsExist);
    end;

    trigger OnAfterGetCurrRecord()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        ApprovalMgmt.GetApprovalStatus(Rec, PhysInvtApprovalStatus, EnabledPhysInvtWorkflowsExist);
    end;

    trigger OnModifyRecord(): Boolean
    var
        ApprovalStatusName: Text[20];
    begin
        ApprovalMgmt.GetApprovalStatus(Rec, ApprovalStatusName, EnabledPhysInvtWorkflowsExist);
        if ApprovalStatusName = 'Approved' then
            Error('You cannot modify an approved journal line.');
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ApprovalStatusName: Text[20];
    begin
        ApprovalMgmt.GetApprovalStatus(Rec, ApprovalStatusName, EnabledPhysInvtWorkflowsExist);
        if ApprovalStatusName = 'Approved' then
            Error('You cannot delete an approved journal line.');
    end;

    trigger OnOpenPage()
    begin
        EnabledPhysInvtWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::"Item Journal Line", WorkflowEventHandling.RunWorkflowOnSendPhysInvtForApprovalCode());
    end;

    var
        ApprovalMgmt: Codeunit "Approval Mgt. WM";
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "PhysInvt Workflow Evt Handling";
        PhysInvtApprovalStatus: Text[20];
        EnabledPhysInvtWorkflowsExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;

    local procedure GetCurrentlySelectedLines(var ItemJnlLine: Record "Item Journal Line"): Boolean
    begin
        CurrPage.SetSelectionFilter(ItemJnlLine);
        exit(ItemJnlLine.FindSet());
    end;
}