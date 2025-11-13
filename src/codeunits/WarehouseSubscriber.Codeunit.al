codeunit 50009 "Warehouse Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Create Source Document", OnBeforeWhseShptLineInsert, '', false, false)]
    local procedure "Whse.-Create Source Document_OnBeforeWhseShptLineInsert"(var WarehouseShipmentLine: Record "Warehouse Shipment Line")
    var
        Item: Record Item;
    begin
        Item.get(WarehouseShipmentLine."Item No.");
        WarehouseShipmentLine."EAN No." := Item."EAN No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Create Source Document", OnBeforeWhseReceiptLineInsert, '', false, false)]
    local procedure "Whse.-Create Source Document_OnBeforeWhseReceiptLineInsert"(var WarehouseReceiptLine: Record "Warehouse Receipt Line")
    var
        Item: Record Item;
        ItemUnitofMeasure: Record "Item Unit of Measure";
    begin
        WarehouseReceiptLine."EAN No." := Item."EAN No.";
        IF ItemUnitofMeasure.GET(Item."No.", Item."Base Unit of Measure") THEN
            WarehouseReceiptLine.Weight := ItemUnitofMeasure.Weight;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Get Source Doc. Outbound", OnBeforeGetSourceDocForHeader, '', false, false)]
    local procedure "Get Source Doc. Outbound_OnBeforeGetSourceDocForHeader"(var WarehouseShipmentHeader: Record "Warehouse Shipment Header"; var WarehouseRequest: Record "Warehouse Request"; var IsHandled: Boolean)
    var
        GetSourceDocuments: Report "Get Source Documents";
        SourceDocSelection: Page "Source Documents";
        Text001Err: TextConst ENU = 'You selected multiple Documents. Please select one Document.';
    begin
        SourceDocSelection.LookupMode(true);
        SourceDocSelection.SetTableView(WarehouseRequest);
        if SourceDocSelection.RunModal() <> ACTION::LookupOK then
            exit;
        SourceDocSelection.GetResult(WarehouseRequest);
        IF WarehouseRequest.COUNT > 1 THEN
            ERROR(Text001Err);
        GetSourceDocuments.SetOneCreatedShptHeader(WarehouseShipmentHeader);
        GetSourceDocuments.SetSkipBlocked(true);
        GetSourceDocuments.UseRequestPage(false);
        WarehouseRequest.SetRange("Location Code", WarehouseShipmentHeader."Location Code");
        GetSourceDocuments.SetTableView(WarehouseRequest);
        GetSourceDocuments.RunModal();
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Receipt", OnCodeOnAfterGetWhseRcptHeader, '', false, false)]
    local procedure "Whse.-Post Receipt_OnCodeOnAfterGetWhseRcptHeader"(var WarehouseReceiptHeader: Record "Warehouse Receipt Header")
    begin
        WarehouseReceiptHeader.TESTFIELD("Vendor Shipment No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", OnBeforePostedWhseShptHeaderInsert, '', false, false)]
    local procedure "Whse.-Post Shipment_OnBeforePostedWhseShptHeaderInsert"(var PostedWhseShipmentHeader: Record "Posted Whse. Shipment Header"; WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    begin
        PostedWhseShipmentHeader."Time of Removal" := WarehouseShipmentHeader."Time of Removal";
        PostedWhseShipmentHeader."LR/RR No." := WarehouseShipmentHeader."LR/RR No.";
        PostedWhseShipmentHeader."LR/RR Date" := WarehouseShipmentHeader."LR/RR Date";
        PostedWhseShipmentHeader."Vehicle No." := WarehouseShipmentHeader."Vehicle No.";
        PostedWhseShipmentHeader."Date of Removal" := WarehouseShipmentHeader."Date of Removal";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Attachment Mgmt", OnAfterGetRefTable, '', false, false)]
    local procedure "Document Attachment Mgmt_OnAfterGetRefTable"(var RecRef: RecordRef; DocumentAttachment: Record "Document Attachment")
    var
        WhseRecptHdr: Record "Warehouse Receipt Header";
    begin
        case DocumentAttachment."Table ID" of
            Database::"Warehouse Receipt Header":
                begin
                    RecRef.Open(Database::"Warehouse Receipt Header");
                    if WhseRecptHdr.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(WhseRecptHdr);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Attachment Mgmt", OnAfterTableHasNumberFieldPrimaryKey, '', false, false)]
    local procedure "Document Attachment Mgmt_OnAfterTableHasNumberFieldPrimaryKey"(TableNo: Integer; var Result: Boolean; var FieldNo: Integer)
    begin
        case TableNo of
            Database::"Warehouse Receipt Header":
                begin
                    FieldNo := 1;
                    Result := true;
                end;
        end;
    end;





}