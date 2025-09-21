codeunit 50014 "Transfer Workflow Response"
{
    trigger OnRun()
    begin

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', false, false)]
    local procedure OnOpenDocument(var Handled: Boolean; RecRef: RecordRef)
    Var
        TransferHeader: record "Transfer Header";
        ReleaseTransferDoc: Codeunit "Release Transfer Document";
    begin
        case
             RecRef.Number of
            DATABASE::"Transfer Header":
                BEGIN
                    RecRef.SetTable(TransferHeader);
                    ReleaseTransferDoc.Reopen(TransferHeader);
                    TransferHeader.Validate("Approval Status", TransferHeader."Approval Status"::Open);
                    TransferHeader.Modify(true);
                    Handled := true;
                END;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', false, false)]
    local procedure OnReleaseDocument(var Handled: Boolean; RecRef: RecordRef)
    Var
        TransferHeader: record "Transfer Header";
    begin
        case
             RecRef.Number of
            DATABASE::"Transfer Header":
                BEGIN
                    RecRef.SetTable(TransferHeader);
                    CODEUNIT.Run(CODEUNIT::"Release Transfer Document", TransferHeader);
                    TransferHeader.Validate("Approval Status", TransferHeader."Approval Status"::Approved);
                    TransferHeader.Modify(true);
                    //Commit();
                    Handled := true;
                END;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', false, false)]
    local procedure OnSetStatusToPendingApproval(var IsHandled: Boolean; var Variant: Variant; RecRef: RecordRef)
    var
        TransferHeader: record "Transfer Header";
    begin
        case
             RecRef.Number of
            DATABASE::"Transfer Header":
                BEGIN
                    RecRef.SetTable(TransferHeader);
                    TransferHeader.Validate("Approval Status", TransferHeader."Approval Status"::"Pending Approval");
                    TransferHeader.Modify(true);
                    IsHandled := true;
                END;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    begin
        case ResponseFunctionName of
            workflowResponseHandling.SetStatusToPendingApprovalCode():
                workflowResponseHandling.AddResponsePredecessor(workflowResponseHandling.SetStatusToPendingApprovalCode(), workflowHandling.RunWorkflowOnSendPriceForApprovalCode());
            workflowResponseHandling.CancelAllApprovalRequestsCode():
                workflowResponseHandling.AddResponsePredecessor(workflowResponseHandling.CancelAllApprovalRequestsCode(), workflowHandling.RunWorkflowOnCancelPriceForApprovalCode());
            workflowResponseHandling.OpenDocumentCode():
                workflowResponseHandling.AddResponsePredecessor(workflowResponseHandling.OpenDocumentCode(), workflowHandling.RunWorkflowOnSendPriceForApprovalCode());
        end

    end;

    var
        workflowResponseHandling: Codeunit "Workflow Response Handling";
        workflowHandling: Codeunit "Price Workflow Evt Handling";
}