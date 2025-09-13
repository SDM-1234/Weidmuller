codeunit 50015 "Transfer Approval Mgmt"
{

    [IntegrationEvent(false, false)]
    PROCEDURE OnSendRequestforApproval(VAR TransferHeader: Record "Transfer Header");
    begin
    end;


    [IntegrationEvent(false, false)]
    procedure OnCancelRequestForApproval(Var TransferHeader: Record "Transfer Header")
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Header", OnBeforeModifyEvent, '', false, false)]
    local procedure TransferHeader_OnBeforeModifyEvent(var Rec: Record "Transfer Header"; var xRec: Record "Transfer Header"; RunTrigger: Boolean)
    var
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        RecordRestriction.CheckRecordHasUsageRestrictions(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Header", OnBeforeDeleteEvent, '', false, false)]
    local procedure TransferHeader_OnBeforeDeleteEvent(RunTrigger: Boolean; var Rec: Record "Transfer Header")
    var
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        RecordRestriction.CheckRecordHasUsageRestrictions(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", OnBeforeModifyEvent, '', false, false)]
    local procedure TransferLine_OnBeforeModifyEvent(var Rec: Record "Transfer Line"; var xRec: Record "Transfer Line"; RunTrigger: Boolean)
    var
        TransferHeader: Record "Transfer Header";
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        TransferHeader.Get(Rec."Document No.");
        RecordRestriction.CheckRecordHasUsageRestrictions(TransferHeader);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", OnBeforeDeleteEvent, '', false, false)]
    local procedure TransferLine_OnBeforeDeleteEvent(RunTrigger: Boolean; var Rec: Record "Transfer Line")
    var
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        RecordRestriction.CheckRecordHasUsageRestrictions(Rec);
    end;

}
