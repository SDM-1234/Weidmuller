namespace WM.WeidmullerDEV;

using Microsoft.Pricing.PriceList;
using Microsoft.Sales.Pricing;
using Microsoft.Utilities;
    
codeunit 50151 "Price Approval Mgmt"
{
    trigger OnRun()
    begin

    end;


    /// <summary>
    /// OnSendRequestForApproval.
    /// </summary>
    /// <param name="Var Youtube">Record "Price List Header".</param>
    [IntegrationEvent(false, false)]
    procedure OnSendRequestForApproval(Var PriceHeader: Record "Price List Header")
    begin
    end;

    /// <summary>
    /// OnCancelRequestForApproval.
    /// </summary>
    /// <param name="Var PriceHeader">Record "Price List Header".</param>
    [IntegrationEvent(false, false)]
    procedure OnCancelRequestForApproval(Var PriceHeader: Record "Price List Header")
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", OnAfterGetPageID, '', false, false)]
    local procedure "Page Management_OnAfterGetPageID"(var RecordRef: RecordRef; var PageID: Integer)
    begin
        if RecordRef.Number = Database::"Price List Header" then
            PageID := Page::"Sales Price List";
    end;




}