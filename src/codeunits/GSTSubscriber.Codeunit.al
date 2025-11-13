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
}