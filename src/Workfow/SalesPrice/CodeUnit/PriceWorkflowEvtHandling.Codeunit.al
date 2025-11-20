namespace WM.WeidmullerDEV;

using Microsoft.Pricing.PriceList;
using System.Automation;
    
codeunit 50150 "Price Workflow Evt Handling"

{
    trigger OnRun()
    begin

    end;

    procedure RunWorkflowOnSendPriceForApprovalCode(): code[128]
    begin
        exit('RUNWORKFLOWONSENDPRICEFORAPPROVAL')
    end;

    procedure RunWorkflowOnCancelPriceForApprovalCode(): code[128]
    begin
        exit('RUNWORKFLOWONCANCELPRICEFORAPPROVAL')
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        workflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPriceForApprovalCode(), DATABASE::"Price List Header", PriceSendApprovalLbl, 0, false);
        workflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPriceForApprovalCode(), DATABASE::"Price List Header", PriceCancelApprovalLbl, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Approval Mgmt", 'OnSendRequestForApproval', '', false, false)]
    local procedure OnSendRequestForApproval(var PriceHeader: Record "Price List Header")
    begin
        workflowMgt.HandleEvent(RunWorkflowOnSendPriceForApprovalCode(), PriceHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Approval Mgmt", 'OnCancelRequestForApproval', '', false, false)]
    local procedure OnCancelRequestForApproval(var PriceHeader: Record "Price List Header")
    begin

        workflowMgt.HandleEvent(RunWorkflowOnCancelPriceForApprovalCode(), PriceHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelPriceForApprovalCode():
                workflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelPriceForApprovalCode(), RunWorkflowOnSendPriceForApprovalCode());
            workflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                workflowEventHandling.AddEventPredecessor(workflowEventHandling.RunWorkflowOnRejectApprovalRequestCode(), RunWorkflowOnSendPriceForApprovalCode())
        end;
    end;

    procedure isPricepprovalWorkflowEnabled(Var PriceHeader: Record "Price List Header"): Boolean
    begin
        exit(workflowMgt.CanExecuteWorkflow(PriceHeader, RunWorkflowOnSendPriceForApprovalCode()))
    end;


    procedure IsPricePendingApproval(Var PriceHeader: Record "Price List Header"): Boolean
    begin
        exit(isPricepprovalWorkflowEnabled(PriceHeader));
    end;



    procedure CheckInvcomingApprovalWorkFlowEnabled(Var PriceHeader: Record "Price List Header"): Boolean
    begin
        if not IsPricePendingApproval(PriceHeader) then
            error(PriceApprovalExistErr);
        exit(true);
    end;

    var
        workflowMgt: Codeunit "Workflow Management";
        workflowEventHandling: Codeunit "Workflow Event Handling";
        PriceSendApprovalLbl: Label ' Price Approval Requested';
        PriceCancelApprovalLbl: Label ' Price Approval Cancelled';
        PriceApprovalExistErr: Label 'No Approval Workflow For This Document';
}