codeunit 50155 "ProdBOM Workflow Evt Handling"

{
    trigger OnRun()
    begin

    end;

    procedure RunWorkflowOnSendPRODBOMForApprovalCode(): code[128]
    begin
        exit('RUNWORKFLOWONSENDPRODBOMFORAPPROVAL')
    end;

    procedure RunWorkflowOnCancelPRODBOMForApprovalCode(): code[128]
    begin
        exit('RUNWORKFLOWONCANCELPRODBOMFORAPPROVAL')
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        workflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPRODBOMForApprovalCode(), DATABASE::"Production BOM Header", TransferSendApprovalLbl, 0, false);
        workflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPRODBOMForApprovalCode(), DATABASE::"Production BOM Header", TransferCancelApprovalLbl, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ProdBOM Approval Mgmt", 'OnSendRequestForApproval', '', false, false)]
    local procedure OnSendRequestForApproval(var ProdBOMHeader: Record "Production BOM Header")
    begin
        workflowMgt.HandleEvent(RunWorkflowOnSendPRODBOMForApprovalCode(), ProdBOMHeader);
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ProdBOM Approval Mgmt", 'OnCancelRequestForApproval', '', false, false)]
    local procedure OnCancelRequestForApproval(var ProdBOMHeader: Record "Production BOM Header")
    begin
        workflowMgt.HandleEvent(RunWorkflowOnCancelPRODBOMForApprovalCode(), ProdBOMHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelPRODBOMForApprovalCode():
                workflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelPRODBOMForApprovalCode(), RunWorkflowOnSendPRODBOMForApprovalCode());
            workflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                workflowEventHandling.AddEventPredecessor(workflowEventHandling.RunWorkflowOnRejectApprovalRequestCode(), RunWorkflowOnSendPRODBOMForApprovalCode())
        end;
    end;

    procedure isProdBOMApprovalWorkflowEnabled(Var ProdBOMHeader: Record "Production BOM Header"): Boolean
    begin
        exit(workflowMgt.CanExecuteWorkflow(ProdBOMHeader, RunWorkflowOnSendPRODBOMForApprovalCode()))
    end;


    procedure IsProdBOMPendingApproval(Var ProdBOMHeader: Record "Production BOM Header"): Boolean
    begin
        exit(isProdBOMApprovalWorkflowEnabled(ProdBOMHeader));
    end;



    procedure CheckInvcomingApprovalWorkFlowEnabled(Var ProdBOMHeader: Record "Production BOM Header"): Boolean
    begin
        if not IsProdBOMPendingApproval(ProdBOMHeader) then
            error(ProdBOMApprovalExistErr);
        exit(true);
    end;

    var
        workflowMgt: Codeunit "Workflow Management";
        workflowEventHandling: Codeunit "Workflow Event Handling";
        TransferSendApprovalLbl: Label ' Prod BOM Approval Requested';
        TransferCancelApprovalLbl: Label ' Prod BOM Approval Cancelled';
        ProdBOMApprovalExistErr: Label 'No Approval Workflow For This Document';
}