namespace WM.WeidmullerDEV;

using Microsoft.Foundation.Attachment;
using Microsoft.Inventory.Journal;
using Microsoft.Inventory.Ledger;
using Microsoft.Inventory.Posting;
using Microsoft.Inventory.Transfer;
using Microsoft.Warehouse.History;
    
codeunit 50011 "Transfer Subscriber"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Attachment Mgmt", OnAfterGetRefTable, '', false, false)]
    local procedure "Document Attachment Mgmt_OnAfterGetRefTable"(var RecRef: RecordRef; DocumentAttachment: Record "Document Attachment")
    var
        TransferHeader: Record "Transfer Header";
    begin
        case DocumentAttachment."Table ID" of
            Database::"Transfer Header":
                begin
                    RecRef.Open(Database::"Transfer Header");
                    if TransferHeader.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(TransferHeader);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Attachment Mgmt", OnAfterTableHasNumberFieldPrimaryKey, '', false, false)]
    local procedure "Document Attachment Mgmt_OnAfterTableHasNumberFieldPrimaryKey"(TableNo: Integer; var Result: Boolean; var FieldNo: Integer)
    begin
        case TableNo of
            Database::"Transfer Header":
                begin
                    FieldNo := 1;
                    Result := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Shipment Header", OnAfterCopyFromTransferHeader, '', false, false)]
    local procedure "Transfer Shipment Header_OnAfterCopyFromTransferHeader"(var TransferShipmentHeader: Record "Transfer Shipment Header"; TransferHeader: Record "Transfer Header")
    begin
        TransferShipmentHeader."Quality Inspection No." := TransferHeader."Quality Inspection No.";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Receipt Header", OnAfterCopyFromTransferHeader, '', false, false)]
    local procedure "Transfer Receipt Header_OnAfterCopyFromTransferHeader"(var TransferReceiptHeader: Record "Transfer Receipt Header"; TransferHeader: Record "Transfer Header")
    begin
        TransferReceiptHeader."Quality Inspection No." := TransferHeader."Quality Inspection No.";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Direct Trans. Line", OnAfterCopyFromTransferLine, '', false, false)]
    local procedure "Direct Trans. Line_OnAfterCopyFromTransferLine"(var DirectTransLine: Record "Direct Trans. Line"; TransferLine: Record "Transfer Line")
    begin
        DirectTransLine."Inspection Reason Code" := TransferLine."Inspection Reason Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Receipt Line", OnAfterCopyFromTransferLine, '', false, false)]
    local procedure "Transfer Receipt Line_OnAfterCopyFromTransferLine"(var TransferReceiptLine: Record "Transfer Receipt Line"; TransferLine: Record "Transfer Line")
    begin
        TransferReceiptLine."Inspection Reason Code" := TransferLine."Inspection Reason Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Transfer Shipment Line", OnAfterCopyFromTransferLine, '', false, false)]
    local procedure "Transfer Shipment Line_OnAfterCopyFromTransferLine"(var TransferShipmentLine: Record "Transfer Shipment Line"; TransferLine: Record "Transfer Line")
    begin
        TransferShipmentLine."Inspection Reason Code" := TransferLine."Inspection Reason Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Shipment", OnAfterCreateItemJnlLine, '', false, false)]
    local procedure "TransferOrder-Post Shipment_OnAfterCreateItemJnlLine"(var ItemJournalLine: Record "Item Journal Line"; TransferLine: Record "Transfer Line"; TransferShipmentHeader: Record "Transfer Shipment Header"; TransferShipmentLine: Record "Transfer Shipment Line")
    begin
        ItemJournalLine."Quality Inspection No." := TransferShipmentHeader."Quality Inspection No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post Receipt", OnBeforePostItemJournalLine, '', false, false)]
    local procedure "TransferOrder-Post Receipt_OnAfterPostItemJnlLine"(CommitIsSuppressed: Boolean; PostedWhseRcptHeader: Record "Posted Whse. Receipt Header"; TransferLine: Record "Transfer Line"; TransferReceiptHeader: Record "Transfer Receipt Header"; TransferReceiptLine: Record "Transfer Receipt Line"; TransLine: Record "Transfer Line"; var ItemJournalLine: Record "Item Journal Line")
    begin
        ItemJournalLine."Quality Inspection No." := TransferReceiptHeader."Quality Inspection No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnBeforeInsertItemLedgEntry, '', false, false)]
    local procedure "Item Jnl.-Post Line_OnBeforeInsertItemLedgEntry"(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; TransferItem: Boolean; OldItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLineOrigin: Record "Item Journal Line")
    begin
        ItemLedgerEntry."Quality Inspection No." := ItemJournalLine."Quality Inspection No.";
    end;









}
