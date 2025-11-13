codeunit 50160 "Whse Receipt Approval Mgmt"
{

    [IntegrationEvent(false, false)]
    PROCEDURE OnSendRequestforApproval(VAR WhseReceipt: Record "Warehouse Receipt Header");
    begin
    end;


    [IntegrationEvent(false, false)]
    procedure OnCancelRequestForApproval(VAR WhseReceipt: Record "Warehouse Receipt Header")
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Receipt Header", OnBeforeModifyEvent, '', false, false)]
    local procedure WhseReceipt_OnBeforeModifyEvent(var Rec: Record "Warehouse Receipt Header"; var xRec: Record "Warehouse Receipt Header"; RunTrigger: Boolean)
    var
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        RecordRestriction.CheckRecordHasUsageRestrictions(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Receipt Line", OnBeforeModifyEvent, '', false, false)]
    local procedure WhseReceiptLine_OnBeforeModifyEvent(RunTrigger: Boolean; var Rec: Record "Warehouse Receipt Line"; var xRec: Record "Warehouse Receipt Line")
    var
        WhseReceipt: Record "Warehouse Receipt Header";
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        WhseReceipt.GET(Rec."No.");
        RecordRestriction.CheckRecordHasUsageRestrictions(WhseReceipt);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Receipt Header", OnBeforeDeleteEvent, '', false, false)]
    local procedure WhseReceipt_OnBeforeDeleteEvent(RunTrigger: Boolean; var Rec: Record "Warehouse Receipt Header")
    var
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        RecordRestriction.CheckRecordHasUsageRestrictions(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Warehouse Receipt Line", OnBeforeDeleteEvent, '', false, false)]
    local procedure WhseReceiptLine_OnBeforeDeleteEvent(RunTrigger: Boolean; var Rec: Record "Warehouse Receipt Line")
    var
        WhseReceipt: Record "Warehouse Receipt Header";
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        WhseReceipt.GET(Rec."No.");
        RecordRestriction.CheckRecordHasUsageRestrictions(WhseReceipt);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Receipt (Yes/No)", OnBeforeConfirmWhseReceiptPost, '', false, false)]
    local procedure "Whse.-Post Receipt (Yes/No)_OnBeforeConfirmWhseReceiptPost"(var WhseReceiptLine: Record "Warehouse Receipt Line"; var HideDialog: Boolean; var IsPosted: Boolean)
    var
        WhseReceipt: Record "Warehouse Receipt Header";
        WorkflowManagement: Codeunit "Workflow Management";
        ApprovalMgmt: Codeunit "Approval Mgt. WM";
        WorkflowEventHandling: Codeunit "WhseRecpt WF Evt Handling";
        ApprovalStatusName: Text[20];
        CanExecuteWorkflow: Boolean;
    begin
        WhseReceipt.GET(WhseReceiptLine."No.");
        CanExecuteWorkflow := WorkflowManagement.CanExecuteWorkflow(WhseReceipt, WorkflowEventHandling.RunWorkflowOnSendWhseReceiptForApprovalCode());
        if not CanExecuteWorkflow then
            exit;
        ApprovalMgmt.GetApprovalStatus(WhseReceipt, ApprovalStatusName, CanExecuteWorkflow);
        if ApprovalStatusName = '' then
            Error('The Warehouse Receipt must be submitted for approval before it can be posted.');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Receipt", OnPostUpdateWhseDocumentsOnAfterWhseRcptHeaderDelete, '', false, false)]
    local procedure "Whse.-Post Receipt_OnPostUpdateWhseDocumentsOnAfterWhseRcptHeaderDelete"(var WhseReceiptHeader: Record "Warehouse Receipt Header")
    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
    begin
        ApprovalMgt.PostApprovalEntries(WhseReceiptHeader.RecordId, WhseReceiptHeader.RecordId, WhseReceiptHeader."No.");
        ApprovalMgt.DeleteApprovalEntries(WhseReceiptHeader.RecordId);
    end;

    procedure ReOpenWhseReceipt(VAR WhseReceipt: Record "Warehouse Receipt Header")
    var
        RestrictedRecord: Record "Restricted Record";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
    begin
        RestrictedRecord.SetRange("Record ID", WhseReceipt.RecordId);
        RestrictedRecord.deleteAll(true);
        ApprovalMgt.DeleteApprovalEntries(WhseReceipt.RecordId);
    end;

}
