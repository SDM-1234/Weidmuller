codeunit 50020 "PhysInvt Workflow Evt Handling"

{
    trigger OnRun()
    begin

    end;

    procedure RunWorkflowOnSendPhysInvtForApprovalCode(): code[128]
    begin
        exit('RUNWORKFLOWONSENDPHYSCINVTFORAPPROVAL')
    end;

    procedure RunWorkflowOnCancelPhysInvtForApprovalCode(): code[128]
    begin
        exit('RUNWORKFLOWONCANCELPHYSCINVTFORAPPROVAL')
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        workflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPhysInvtForApprovalCode(), DATABASE::"Item Journal Line", PhysInvtSendApprovalLbl, 0, false);
        workflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPhysInvtForApprovalCode(), DATABASE::"Item Journal Line", PhysInvtCancelApprovalLbl, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Phy Invt Approval Mgmt", 'OnSendRequestForApproval', '', false, false)]
    local procedure OnSendRequestForApproval(var ItemJnlLine: Record "Item Journal Line")
    begin
        if ItemJnlLine.FindSet() then
            repeat
                workflowMgt.HandleEvent(RunWorkflowOnSendPhysInvtForApprovalCode(), ItemJnlLine);
            until ItemJnlLine.Next() = 0;
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Phy Invt Approval Mgmt", 'OnCancelRequestForApproval', '', false, false)]
    local procedure OnCancelRequestForApproval(var ItemJnlLine: Record "Item Journal Line")
    begin
        if ItemJnlLine.FindSet() then
            repeat
                workflowMgt.HandleEvent(RunWorkflowOnCancelPhysInvtForApprovalCode(), ItemJnlLine);
            until ItemJnlLine.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelPhysInvtForApprovalCode():
                workflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelPhysInvtForApprovalCode(), RunWorkflowOnSendPhysInvtForApprovalCode());
            workflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                workflowEventHandling.AddEventPredecessor(workflowEventHandling.RunWorkflowOnRejectApprovalRequestCode(), RunWorkflowOnSendPhysInvtForApprovalCode())
        end;
    end;

    procedure isPhysInvtpprovalWorkflowEnabled(Var ItemJnlLine: Record "Item Journal Line"): Boolean
    begin
        exit(workflowMgt.CanExecuteWorkflow(ItemJnlLine, RunWorkflowOnSendPhysInvtForApprovalCode()))
    end;


    procedure IsPhysInvtPendingApproval(Var ItemJnlLine: Record "Item Journal Line"): Boolean
    begin
        exit(isPhysInvtpprovalWorkflowEnabled(ItemJnlLine));
    end;



    procedure CheckInvcomingApprovalWorkFlowEnabled(Var ItemJnlLine: Record "Item Journal Line"): Boolean
    begin
        if not IsPhysInvtPendingApproval(ItemJnlLine) then
            error(PhysInvtApprovalExistErr);
        exit(true);
    end;

    var
        workflowMgt: Codeunit "Workflow Management";
        workflowEventHandling: Codeunit "Workflow Event Handling";
        PhysInvtSendApprovalLbl: Label 'Physical Inventory Approval Requested';
        PhysInvtCancelApprovalLbl: Label 'Physical Inventory Approval Cancelled';
        PhysInvtApprovalExistErr: Label 'No Approval Workflow For This Line';
}