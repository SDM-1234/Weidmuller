namespace WM.WeidmullerDEV;

using Microsoft.Purchases.Document;
using Microsoft.Purchases.History;
using Microsoft.Purchases.Posting;
using Microsoft.Inventory.Journal;
using Microsoft.Inventory.Ledger;
using Microsoft.Inventory.Posting;
using Microsoft.Warehouse.Document;
using Microsoft.Warehouse.History;
using Microsoft.Warehouse.Request;
using System.Automation;
    
codeunit 50005 "Purchase Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnInsertReceiptLineOnBeforeCreatePostedRcptLine, '', false, false)]
    local procedure "Purch.-Post_OnInsertReceiptLineOnBeforeCreatePostedRcptLine"(var PurchRcptLine: Record "Purch. Rcpt. Line"; var WarehouseReceiptLine: Record "Warehouse Receipt Line"; PostedWhseReceiptHeader: Record "Posted Whse. Receipt Header")
    begin
        PurchRcptLine.Weight := WarehouseReceiptLine.Weight;
        PurchRcptLine."Total No of Boxes" := WarehouseReceiptLine."Total No of Boxes";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnAfterCheckPurchaseApprovalPossible, '', false, false)]
    local procedure "Approvals Mgmt._OnAfterCheckPurchaseApprovalPossible"(var PurchaseHeader: Record "Purchase Header")
    begin
        if PurchaseHeader."Document Type" <> PurchaseHeader."Document Type"::Invoice then
            exit;
        PurchaseHeader.CheckAttachment(PurchaseHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", OnAfterConfirmPost, '', false, false)]
    local procedure WM_OnAfterConfirmPost(var PurchaseHeader: Record "Purchase Header")
    begin
        if PurchaseHeader.Receive OR PurchaseHeader.Invoice then
            PurchaseHeader.CheckAttachment(PurchaseHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Get Receipt", OnAfterCreateInvLines, '', false, false)]
    local procedure "Purch.-Get Receipt_OnAfterCreateInvLines"(var PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line")
    var
        InvoiceLine: Record "Purchase Line";
        ReceiptHeader: Record "Purch. Rcpt. Header";
        FirstReceiptHeader: Record "Purch. Rcpt. Header";
        FoundReceipt: Boolean;
    begin
        if PurchaseHeader."Document Type" <> PurchaseHeader."Document Type"::Invoice then
            exit;

        InvoiceLine.SetRange("Document Type", PurchaseHeader."Document Type");
        InvoiceLine.SetRange("Document No.", PurchaseHeader."No.");
        InvoiceLine.SetFilter("Receipt No.", '<>%1', '');
        if not InvoiceLine.FindSet() then
            exit;

        repeat
            if ReceiptHeader.Get(InvoiceLine."Receipt No.") then
                if not FoundReceipt then begin
                    FirstReceiptHeader := ReceiptHeader;
                    FoundReceipt := true;
                end else
                    if (ReceiptHeader."Vendor Shipment No." <> FirstReceiptHeader."Vendor Shipment No.") or
                       (ReceiptHeader."Bill of Entry No." <> FirstReceiptHeader."Bill of Entry No.") or
                       (ReceiptHeader."Bill of Entry Date" <> FirstReceiptHeader."Bill of Entry Date")
                    then
                        Error(MixedReceiptDetailsErr);
        until InvoiceLine.Next() = 0;

        if not FoundReceipt then
            exit;

        PurchaseHeader.Validate("Vendor Shipment No.", FirstReceiptHeader."Vendor Shipment No.");
        PurchaseHeader.Validate("Bill of Entry No.", FirstReceiptHeader."Bill of Entry No.");
        PurchaseHeader.Validate("Bill of Entry Date", FirstReceiptHeader."Bill of Entry Date");
        PurchaseHeader.Modify(true);
    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", OnPurchaseLineOnAfterCreateRcptHeader, '', false, false)]
    local procedure "Get Source Documents_OnPurchaseLineOnAfterCreateRcptHeader"(var WhseReceiptHeader: Record "Warehouse Receipt Header"; WhseHeaderCreated: Boolean; PurchaseHeader: Record "Purchase Header"; PurchaseLine: Record "Purchase Line"; WarehouseRequest: Record "Warehouse Request")
    begin
        if WhseReceiptHeader."Vendor Shipment No." = '' then
            WhseReceiptHeader.Validate("Vendor Shipment No.", PurchaseHeader."Vendor Shipment No.");
        if WhseReceiptHeader."Bill of Entry No." = '' then
            WhseReceiptHeader.Validate("Bill of Entry No.", PurchaseHeader."Bill of Entry No.");
        if WhseReceiptHeader."Bill of Entry Date" = 0D then
            WhseReceiptHeader.Validate("Bill of Entry Date", PurchaseHeader."Bill of Entry Date");
        WhseReceiptHeader.Modify(true);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnAfterPurchRcptHeaderInsert, '', false, false)]
    local procedure "Purch.-Post_OnAfterPurchRcptHeaderInsert"(var PurchRcptHeader: Record "Purch. Rcpt. Header"; var PurchaseHeader: Record "Purchase Header"; CommitIsSupressed: Boolean; PreviewMode: Boolean)
    begin
        if PurchRcptHeader."Vendor Shipment No." = '' then
            PurchRcptHeader."Vendor Shipment No." := PurchaseHeader."Vendor Shipment No.";
        PurchRcptHeader."Bill of Entry No." := PurchaseHeader."Bill of Entry No.";
        PurchRcptHeader."Bill of Entry Date" := PurchaseHeader."Bill of Entry Date";
        PurchRcptHeader.Modify(true);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnBeforeInsertItemLedgEntry, '', false, false)]
    local procedure "Item Jnl.-Post Line_OnBeforeInsertItemLedgEntry"(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; TransferItem: Boolean; OldItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLineOrigin: Record "Item Journal Line")
    var
        PurchRcptHeader: Record "Purch. Rcpt. Header";
    begin
        if not PurchRcptHeader.Get(ItemJournalLine."Document No.") then
            exit;

        ItemLedgerEntry."External Document No." := PurchRcptHeader."Vendor Shipment No.";
        ItemLedgerEntry."Bill of Entry No." := PurchRcptHeader."Bill of Entry No.";
        ItemLedgerEntry."Bill of Entry Date" := PurchRcptHeader."Bill of Entry Date";
    end;

    var
        MixedReceiptDetailsErr: Label 'The selected posted receipts have different vendor shipment or Bill of Entry details. Add receipts with matching details to the invoice separately.';




}