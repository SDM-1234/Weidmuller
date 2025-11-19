namespace WM.WeidmullerDEV;

using Microsoft.Manufacturing.ProductionBOM;
using System.Automation;
    
codeunit 50156 "ProdBOM Approval Mgmt"
{

    [IntegrationEvent(false, false)]
    PROCEDURE OnSendRequestforApproval(VAR ProdBOMHeader: Record "Production BOM Header");
    begin
    end;


    [IntegrationEvent(false, false)]
    procedure OnCancelRequestForApproval(VAR ProdBOMHeader: Record "Production BOM Header")
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::"Production BOM Header", OnBeforeModifyEvent, '', false, false)]
    local procedure ProdBomHeader_OnBeforeModifyEvent(var Rec: Record "Production BOM Header"; var xRec: Record "Production BOM Header"; RunTrigger: Boolean)
    var
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        RecordRestriction.CheckRecordHasUsageRestrictions(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Production BOM Line", OnBeforeModifyEvent, '', false, false)]
    local procedure ProdBomLine_OnBeforeModifyEvent(var Rec: Record "Production BOM Line"; var xRec: Record "Production BOM Line"; RunTrigger: Boolean)
    var
        ProdBOMHeader: Record "Production BOM Header";
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        ProdBOMHeader.Get(Rec."Production BOM No.");
        RecordRestriction.CheckRecordHasUsageRestrictions(ProdBOMHeader);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Production BOM Header", OnBeforeDeleteEvent, '', false, false)]
    local procedure ProdBomHeader_OnBeforeDeleteEvent(RunTrigger: Boolean; var Rec: Record "Production BOM Header")
    var
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        RecordRestriction.CheckRecordHasUsageRestrictions(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Production BOM Line", OnBeforeDeleteEvent, '', false, false)]
    local procedure ProdBomLine_OnBeforeDeleteEvent(RunTrigger: Boolean; var Rec: Record "Production BOM Line")
    var
        ProdBOMHeader: Record "Production BOM Header";
        RecordRestriction: Codeunit "Record Restriction Mgt.";
    begin
        ProdBOMHeader.Get(Rec."Production BOM No.");
        RecordRestriction.CheckRecordHasUsageRestrictions(ProdBOMHeader);
    end;
}
