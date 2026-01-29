namespace WM.WeidmullerDEV;

using Microsoft.Finance.GST.Sales;
using Microsoft.Sales.Setup;
using Microsoft.Sales.History;

codeunit 50024 "GST Subscriber"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"e-Invoice Json Handler", OnBeforeExportAsJson, '', false, false)]
    local procedure "e-Invoice Json Handler_OnBeforeExportAsJson"(var JsonArrayData: JsonArray; var JObject: JsonObject; FileName: Text[20]; var IsHandled: Boolean)
    var
        SingleInstanceCU: Codeunit "Single Instance CU";
    begin
        if SingleInstanceCU.GetBulkEInvoices() then begin
            SingleInstanceCU.AddEinvoiceJsonArray(JObject);
            IsHandled := true;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"e-Invoice Json Handler", OnBeforeFindSalesInvoiceLineSetFilter, '', false, false)]
    local procedure eInvoiceJsonHandler_OnBeforeFindSalesInvoiceLineSetFilter(var SalesInvoiceLine: Record "Sales Invoice Line")
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
    begin
        SalesReceivablesSetup.Get();
        if (SalesReceivablesSetup."Starting Line No." <> 0) and (SalesReceivablesSetup."Ending Line No." <> 0) then
            SalesInvoiceLine.SetRange("Line No.", SalesReceivablesSetup."Starting Line No.", SalesReceivablesSetup."Ending Line No.");
    end;
}