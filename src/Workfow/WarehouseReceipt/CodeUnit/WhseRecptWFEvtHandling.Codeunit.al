codeunit 50162 "WhseRecpt WF Evt Handling"

{
    trigger OnRun()
    begin

    end;

    procedure RunWorkflowOnSendWhseReceiptForApprovalCode(): code[128]
    begin
        exit('RUNWORKFLOWONSENDWHSERECPTFORAPPROVAL')
    end;

    procedure RunWorkflowOnCancelWhseReceiptForApprovalCode(): code[128]
    begin
        exit('RUNWORKFLOWONCANCELWHSERECPTFORAPPROVAL')
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        workflowEventHandling.AddEventToLibrary(RunWorkflowOnSendWhseReceiptForApprovalCode(), DATABASE::"Warehouse Receipt Header", WhseReceiptSendApprovalLbl, 0, false);
        workflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelWhseReceiptForApprovalCode(), DATABASE::"Warehouse Receipt Header", WhseReceiptCancelApprovalLbl, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse Receipt Approval Mgmt", 'OnSendRequestForApproval', '', false, false)]
    local procedure OnSendRequestForApproval(var WhseReceipt: Record "Warehouse Receipt Header")
    begin
        workflowMgt.HandleEvent(RunWorkflowOnSendWhseReceiptForApprovalCode(), WhseReceipt);
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse Receipt Approval Mgmt", 'OnCancelRequestForApproval', '', false, false)]
    local procedure OnCancelRequestForApproval(var WhseReceipt: Record "Warehouse Receipt Header")
    begin
        workflowMgt.HandleEvent(RunWorkflowOnCancelWhseReceiptForApprovalCode(), WhseReceipt);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelWhseReceiptForApprovalCode():
                workflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelWhseReceiptForApprovalCode(), RunWorkflowOnSendWhseReceiptForApprovalCode());
            workflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                workflowEventHandling.AddEventPredecessor(workflowEventHandling.RunWorkflowOnRejectApprovalRequestCode(), RunWorkflowOnSendWhseReceiptForApprovalCode())
        end;
    end;

    procedure isWhseReceiptpprovalWorkflowEnabled(Var WhseReceipt: Record "Warehouse Receipt Header"): Boolean
    begin
        exit(workflowMgt.CanExecuteWorkflow(WhseReceipt, RunWorkflowOnSendWhseReceiptForApprovalCode()))
    end;


    procedure IsWhseReceiptPendingApproval(Var WhseReceipt: Record "Warehouse Receipt Header"): Boolean
    begin
        exit(isWhseReceiptpprovalWorkflowEnabled(WhseReceipt));
    end;

    procedure CheckInvcomingApprovalWorkFlowEnabled(Var WhseReceipt: Record "Warehouse Receipt Header"): Boolean
    begin
        if not IsWhseReceiptPendingApproval(WhseReceipt) then
            error(WhseReceiptApprovalExistErr);
        exit(true);
    end;

    var
        workflowMgt: Codeunit "Workflow Management";
        workflowEventHandling: Codeunit "Workflow Event Handling";
        WhseReceiptSendApprovalLbl: Label 'Warehouse Receipt Approval Requested';
        WhseReceiptCancelApprovalLbl: Label 'Warehouse Receipt Approval Cancelled';
        WhseReceiptApprovalExistErr: Label 'No Approval Workflow For This Document';
}