namespace WM.WeidmullerDEV;

using Microsoft.Purchases.Document;
using Microsoft.Purchases.History;
using Microsoft.Purchases.Posting;
using Microsoft.Warehouse.Document;
using Microsoft.Warehouse.History;
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






}