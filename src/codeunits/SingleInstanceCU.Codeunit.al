codeunit 50000 "Single Instance CU"
{
    SingleInstance = true;

    procedure SetLastDocNo(pDocNO: Code[20])
    begin
        DocNO := pDocNO;
    end;

    procedure GetLastDocNo(): Code[20]
    begin
        exit(DocNO);
    end;

    procedure SetWhseDocNo(pDocNO: Code[20])
    begin
        DocNO := pDocNO;
    end;

    procedure GetWhseDocNo(): Code[20]
    begin
        exit(DocNO);
    end;

    procedure SetBlockParameterFromDocs()
    begin
        SetBlockParameterFromDocsValue := TRUE;
    end;

    procedure GetBlockParameterFromDocs(): Boolean
    begin
        exit(SetBlockParameterFromDocsValue);
    end;

    procedure SetBulkEInvoices(pBulkEInvoice: Boolean)
    begin
        BulkEInvoice := pBulkEInvoice;
    end;

    procedure GetBulkEInvoices(): Boolean
    begin
        exit(BulkEInvoice);
    end;

    procedure AddEinvoiceJsonArray(JObject: JsonObject)
    begin
        JsonArrayData.Add(JObject);
    end;

    procedure GetEinvoiceJsonArray(): JsonArray
    begin
        exit(JsonArrayData);
    end;

    var
        SetBlockParameterFromDocsValue, BulkEInvoice : Boolean;
        DocNO: Code[20];
        JsonArrayData: JsonArray;

    // Need to shift in single instance

}

