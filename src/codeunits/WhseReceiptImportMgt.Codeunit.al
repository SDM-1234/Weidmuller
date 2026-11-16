namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Item;
using Microsoft.Inventory.Location;
using Microsoft.Purchases.Document;
using Microsoft.Warehouse.Document;
using Microsoft.Warehouse.History;
using Microsoft.Warehouse.Request;
using Microsoft.Warehouse.Structure;
using System.IO;

codeunit 50172 "Whse. Receipt Import Mgt."
{
    procedure ImportExcel()
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        ImportLine: Record "Whse. Receipt Excel Import";
        ExcelInStream: InStream;
        FileName: Text;
        SheetName: Text;
        MaxRowNo: Integer;
        RowNo: Integer;
        ImportedCount: Integer;
        NextEntryNo: BigInteger;
        PurchaseOrderColumn: Integer;
        VendorInvoiceColumn: Integer;
        BOENoColumn: Integer;
        BOEDateColumn: Integer;
        ItemNoColumn: Integer;
        DescriptionColumn: Integer;
        QuantityColumn: Integer;
        UnitOfMeasureColumn: Integer;
        BinCodeColumn: Integer;
        PurchaseOrderNo: Code[20];
        ItemNo: Code[20];
        QuantityToReceive: Decimal;
        QuantityText: Text;
        UnitOfMeasureText: Text;
        BOENoText: Text;
        BOEDateText: Text;
        BOEDate: Date;
    begin
        UploadIntoStream(UploadExcelMsg, '', 'Excel Files|*.xlsx', FileName, ExcelInStream);
        if FileName = '' then
            Error(NoFileSelectedErr);

        SheetName := TempExcelBuffer.SelectSheetsNameStream(ExcelInStream);
        TempExcelBuffer.OpenBookStream(ExcelInStream, SheetName);
        TempExcelBuffer.ReadSheet();

        TempExcelBuffer.Reset();
        if TempExcelBuffer.FindLast() then
            MaxRowNo := TempExcelBuffer."Row No.";

        PurchaseOrderColumn := 1;
        VendorInvoiceColumn := 2;
        BOENoColumn := 3;
        BOEDateColumn := 4;
        ItemNoColumn := 5;
        DescriptionColumn := 6;
        UnitOfMeasureColumn := 7;
        QuantityColumn := 8;
        BinCodeColumn := 9;

        ValidateHeading(TempExcelBuffer, PurchaseOrderColumn, 'PO No');
        ValidateHeading(TempExcelBuffer, VendorInvoiceColumn, 'Vendor Invoice No');
        ValidateHeading(TempExcelBuffer, BOENoColumn, 'BOE No');
        ValidateHeading(TempExcelBuffer, BOEDateColumn, 'BOE Date');
        ValidateHeading(TempExcelBuffer, ItemNoColumn, 'Item No');
        ValidateHeading(TempExcelBuffer, DescriptionColumn, 'Item Description');
        ValidateHeading(TempExcelBuffer, UnitOfMeasureColumn, 'Unit of Measure');
        ValidateHeading(TempExcelBuffer, QuantityColumn, 'Qty to Measure');
        ValidateHeading(TempExcelBuffer, BinCodeColumn, 'Bin Code');

        ImportLine.LockTable();
        if ImportLine.FindLast() then
            NextEntryNo := ImportLine."Entry No." + 1
        else
            NextEntryNo := 1;

        for RowNo := 2 to MaxRowNo do begin
            Clear(BOEDate);
            PurchaseOrderNo := CopyStr(GetValueAtCell(TempExcelBuffer, RowNo, PurchaseOrderColumn), 1, MaxStrLen(PurchaseOrderNo));
            ItemNo := CopyStr(GetValueAtCell(TempExcelBuffer, RowNo, ItemNoColumn), 1, MaxStrLen(ItemNo));
            QuantityText := NormalizeNumericText(GetValueAtCell(TempExcelBuffer, RowNo, QuantityColumn));
            UnitOfMeasureText := GetValueAtCell(TempExcelBuffer, RowNo, UnitOfMeasureColumn);
            BOENoText := GetValueAtCell(TempExcelBuffer, RowNo, BOENoColumn);
            BOEDateText := GetValueAtCell(TempExcelBuffer, RowNo, BOEDateColumn);

            if (PurchaseOrderNo <> '') or (ItemNo <> '') or (QuantityText <> '') then begin
                if PurchaseOrderNo = '' then
                    Error(MissingValueErr, RowNo, 'PO No.');
                if ItemNo = '' then
                    Error(MissingValueErr, RowNo, 'Item No.');
                if QuantityText = '' then
                    Error(MissingValueErr, RowNo, 'Quantity to Receive');
                if not Evaluate(QuantityToReceive, QuantityText) or (QuantityToReceive <= 0) then begin
                    if Evaluate(QuantityToReceive, UnitOfMeasureText) and (QuantityToReceive > 0) then
                        UnitOfMeasureText := QuantityText
                    else
                        Error(InvalidQuantityErr, RowNo, QuantityText);
                end;
                if StrLen(BOENoText) > MaxStrLen(ImportLine."BOE No.") then
                    Error(BOENoTooLongErr, RowNo, MaxStrLen(ImportLine."BOE No."));
                if BOEDateText <> '' then
                    if not Evaluate(BOEDate, BOEDateText) then
                        Error(InvalidDateErr, RowNo, BOEDateText);

                ImportLine.Init();
                ImportLine."Entry No." := NextEntryNo;
                NextEntryNo += 1;
                ImportLine."Purchase Order No." := PurchaseOrderNo;
                ImportLine."Item No." := ItemNo;
                ImportLine.Validate("Qty. to Receive", QuantityToReceive);
                ImportLine.Validate("Vendor Invoice No.", CopyStr(GetValueAtCell(TempExcelBuffer, RowNo, VendorInvoiceColumn), 1, MaxStrLen(ImportLine."Vendor Invoice No.")));
                ImportLine.Validate("BOE No.", BOENoText);
                ImportLine."BOE Date" := BOEDate;
                if DescriptionColumn <> 0 then
                    ImportLine."Item Description" := CopyStr(GetValueAtCell(TempExcelBuffer, RowNo, DescriptionColumn), 1, MaxStrLen(ImportLine."Item Description"));
                if UnitOfMeasureColumn <> 0 then
                    ImportLine."Unit of Measure Code" := CopyStr(UnitOfMeasureText, 1, MaxStrLen(ImportLine."Unit of Measure Code"));
                if BinCodeColumn <> 0 then
                    ImportLine."Bin Code" := CopyStr(GetValueAtCell(TempExcelBuffer, RowNo, BinCodeColumn), 1, MaxStrLen(ImportLine."Bin Code"));
                ImportLine."Excel Row No." := RowNo;
                ImportLine.Insert(true);
                ImportedCount += 1;
            end;
        end;

        if ImportedCount = 0 then
            Error(NoImportRowsErr);
        Message(ImportedLinesMsg, ImportedCount);
    end;

    procedure ValidateLines()
    var
        ImportLine: Record "Whse. Receipt Excel Import";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        Location: Record Location;
        Bin: Record "Bin Content";
        OtherImportLine: Record "Whse. Receipt Excel Import";
        MatchingPurchaseLines: Integer;
        TotalQtyToReceive: Decimal;
    begin
        ImportLine.SetRange(Processed, false);
        if not ImportLine.FindSet(true) then
            Error(NoImportRowsErr);

        repeat
            Clear(ImportLine.Reason);
            ImportLine.Status := false;
            ImportLine."Outstanding Quantity" := 0;
            ImportLine."Location Code" := '';

            if ImportLine."Vendor Invoice No." = '' then
                ImportLine.Reason := VendorInvoiceRequiredErr;
            if (ImportLine.Reason = '') and (ImportLine."BOE No." = '') then
                ImportLine.Reason := BOENumberRequiredErr;
            if (ImportLine.Reason = '') and (ImportLine."BOE Date" = 0D) then
                ImportLine.Reason := BOEDateRequiredErr;

            if ImportLine.Reason = '' then
                if not PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, ImportLine."Purchase Order No.") then
                    ImportLine.Reason := StrSubstNo(PurchaseOrderNotFoundErr, ImportLine."Purchase Order No.");

            if (ImportLine.Reason = '') and (PurchaseHeader.Status <> PurchaseHeader.Status::Released) then
                ImportLine.Reason := PurchaseOrderNotReleasedErr;

            if ImportLine.Reason = '' then begin
                ImportLine."Location Code" := PurchaseHeader."Location Code";
                if not Location.Get(PurchaseHeader."Location Code") then
                    ImportLine.Reason := LocationNotFoundErr;
            end;

            if ImportLine.Reason = '' then begin
                PurchaseLine.Reset();
                PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
                PurchaseLine.SetRange("Document No.", ImportLine."Purchase Order No.");
                PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
                PurchaseLine.SetRange("No.", ImportLine."Item No.");
                MatchingPurchaseLines := PurchaseLine.Count();

                if MatchingPurchaseLines = 0 then
                    ImportLine.Reason := StrSubstNo(ItemNotOnPurchaseOrderErr, ImportLine."Item No.")
                else
                    if MatchingPurchaseLines > 1 then
                        ImportLine.Reason := DuplicatePurchaseOrderItemErr
                    else begin
                        PurchaseLine.FindFirst();
                        if (ImportLine."Unit of Measure Code" <> '') and
                           (ImportLine."Unit of Measure Code" <> PurchaseLine."Unit of Measure Code")
                        then
                            ImportLine.Reason := UnitOfMeasureMismatchErr
                        else begin
                            ImportLine."Item Description" := PurchaseLine.Description;
                            ImportLine."Unit of Measure Code" := PurchaseLine."Unit of Measure Code";
                            ImportLine."Outstanding Quantity" := PurchaseLine."Outstanding Quantity";
                            TotalQtyToReceive := 0;
                            OtherImportLine.Reset();
                            OtherImportLine.SetRange("Purchase Order No.", ImportLine."Purchase Order No.");
                            OtherImportLine.SetRange("Item No.", ImportLine."Item No.");
                            OtherImportLine.SetRange(Processed, false);
                            if OtherImportLine.FindSet() then
                                repeat
                                    TotalQtyToReceive += OtherImportLine."Qty. to Receive";
                                until OtherImportLine.Next() = 0;
                            if ImportLine."Outstanding Quantity" < TotalQtyToReceive then
                                ImportLine.Reason := OutstandingQuantityErr;
                        end;
                    end;
            end;

            if ImportLine.Reason = '' then begin
                OtherImportLine.SetRange("Purchase Order No.", ImportLine."Purchase Order No.");
                OtherImportLine.SetRange("Item No.", ImportLine."Item No.");
                OtherImportLine.SetRange("Vendor Invoice No.", ImportLine."Vendor Invoice No.");
                OtherImportLine.SetRange(Processed, false);
                OtherImportLine.SetFilter("Entry No.", '<>%1', ImportLine."Entry No.");
                if not OtherImportLine.IsEmpty() then
                    ImportLine.Reason := DuplicateImportedItemErr;
            end;

            if ImportLine.Reason = '' then begin
                OtherImportLine.Reset();
                OtherImportLine.SetRange("Vendor Invoice No.", ImportLine."Vendor Invoice No.");
                OtherImportLine.SetRange(Processed, false);
                if OtherImportLine.FindSet() then
                    repeat
                        if (OtherImportLine."BOE No." <> ImportLine."BOE No.") or
                           (OtherImportLine."BOE Date" <> ImportLine."BOE Date")
                        then
                            ImportLine.Reason := ConflictingInvoiceDetailsErr;
                    until (OtherImportLine.Next() = 0) or (ImportLine.Reason <> '');
            end;

            if ImportLine.Reason = '' then
                if ImportLine."Bin Code" = '' then begin
                    Bin.Reset();
                    Bin.SetRange("Location Code", ImportLine."Location Code");
                    Bin.SetRange("Item No.", ImportLine."Item No.");
                    Bin.SetRange(Default, True);
                    if Bin.FindFirst() then
                        ImportLine."Bin Code" := Bin."Bin Code"
                    else
                        ImportLine.Reason := BinNotAvailableErr
                end else begin
                    Bin.Reset();
                    Bin.SetRange("Location Code", ImportLine."Location Code");
                    Bin.SetRange("Bin Code", ImportLine."Bin Code");
                    Bin.SetRange("Item No.", ImportLine."Item No.");
                    if not Bin.FindFirst() then
                        ImportLine.Reason := BinNotAvailableErr;
                end;


            ImportLine.Status := ImportLine.Reason = '';
            ImportLine.Modify(true);
        until ImportLine.Next() = 0;

        Message(ValidationCompleteMsg);
    end;

    procedure ProcessLines()
    var
        ImportLine: Record "Whse. Receipt Excel Import";
        LinesForPurchaseOrder: Record "Whse. Receipt Excel Import";
        PurchaseOrderNo: Code[20];
        VendorInvoiceNo: Code[35];
        ProcessedCount: Integer;
    begin
        ImportLine.SetRange(Processed, false);
        if not ImportLine.FindSet(true) then
            Error(NoImportRowsErr);

        repeat
            if not ImportLine.Status then
                Error(ValidationRequiredErr, ImportLine."Excel Row No.", ImportLine.Reason);
        until ImportLine.Next() = 0;

        ImportLine.Reset();
        ImportLine.SetRange(Processed, false);
        while ImportLine.FindFirst() do begin
            PurchaseOrderNo := ImportLine."Purchase Order No.";
            VendorInvoiceNo := ImportLine."Vendor Invoice No.";
            LinesForPurchaseOrder.Reset();
            LinesForPurchaseOrder.SetRange("Purchase Order No.", PurchaseOrderNo);
            LinesForPurchaseOrder.SetRange("Vendor Invoice No.", VendorInvoiceNo);
            LinesForPurchaseOrder.SetRange(Processed, false);
            ProcessedCount += LinesForPurchaseOrder.Count();
            ProcessPurchaseOrder(PurchaseOrderNo, VendorInvoiceNo);

            ImportLine.Reset();
            ImportLine.SetRange(Processed, false);
        end;

        Message(ProcessedLinesMsg, ProcessedCount);
    end;

    local procedure ProcessPurchaseOrder(PurchaseOrderNo: Code[20]; VendorInvoiceNo: Code[35])
    var
        ImportLine: Record "Whse. Receipt Excel Import";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        WarehouseRequest: Record "Warehouse Request";
        WarehouseReceiptHeader: Record "Warehouse Receipt Header";
        WarehouseReceiptLine: Record "Warehouse Receipt Line";
        GetSourceDocuments: Report "Get Source Documents";
        ApprovalManagement: Codeunit "Whse Receipt Approval Mgmt";
        WarehouseReceiptWorkflow: Codeunit "WhseRecpt WF Evt Handling";
        FirstReceiptNo: Code[20];
    begin
        PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, PurchaseOrderNo);
        ImportLine.SetRange("Purchase Order No.", PurchaseOrderNo);
        ImportLine.SetRange("Vendor Invoice No.", VendorInvoiceNo);
        ImportLine.SetRange(Processed, false);
        if not ImportLine.FindFirst() then
            Error(NoImportRowsErr);

        PurchaseHeader.Validate("Vendor Shipment No.", ImportLine."Vendor Invoice No.");
        PurchaseHeader.Validate("Bill of Entry No.", ImportLine."BOE No.");
        PurchaseHeader.Validate("Bill of Entry Date", ImportLine."BOE Date");
        PurchaseHeader.Modify(true);

        WarehouseReceiptHeader.Init();
        WarehouseReceiptHeader.Validate("Location Code", PurchaseHeader."Location Code");
        WarehouseReceiptHeader.Validate("Vendor Shipment No.", PurchaseHeader."Vendor Shipment No.");
        WarehouseReceiptHeader.Validate("Bill of Entry No.", PurchaseHeader."Bill of Entry No.");
        WarehouseReceiptHeader.Validate("Bill of Entry Date", PurchaseHeader."Bill of Entry Date");
        WarehouseReceiptHeader.Insert(true);

        WarehouseRequest.SetRange("Source Type", Database::"Purchase Line");
        WarehouseRequest.SetRange("Source Subtype", 1);
        WarehouseRequest.SetRange("Source No.", PurchaseOrderNo);
        WarehouseRequest.SetRange(Type, WarehouseRequest.Type::Inbound);
        if WarehouseRequest.IsEmpty() then
            Error(NoWarehouseRequestErr, PurchaseOrderNo);

        GetSourceDocuments.SetHideDialog(true);
        GetSourceDocuments.SetSkipBlocked(true);
        GetSourceDocuments.SetOneCreatedReceiptHeader(WarehouseReceiptHeader);
        GetSourceDocuments.SetTableView(WarehouseRequest);
        GetSourceDocuments.UseRequestPage(false);
        GetSourceDocuments.RunModal();

        WarehouseReceiptLine.Reset();
        WarehouseReceiptLine.SetRange("Source Type", Database::"Purchase Line");
        WarehouseReceiptLine.SetRange("Source Subtype", 1);
        WarehouseReceiptLine.SetRange("Source No.", PurchaseOrderNo);
        WarehouseReceiptLine.SetRange("No.", WarehouseReceiptHeader."No.");
        Clear(FirstReceiptNo);
        if not WarehouseReceiptLine.FindSet(true) then
            Error(NoReceiptLinesCreatedErr, PurchaseOrderNo);

        repeat
            if FirstReceiptNo = '' then
                FirstReceiptNo := WarehouseReceiptLine."No."
            else
                if WarehouseReceiptLine."No." <> FirstReceiptNo then
                    Error(MultipleReceiptHeadersErr, PurchaseOrderNo);

            WarehouseReceiptLine.Validate("Qty. to Receive", 0);
            WarehouseReceiptLine.Modify(true);
        until WarehouseReceiptLine.Next() = 0;

        ImportLine.SetRange("Purchase Order No.", PurchaseOrderNo);
        ImportLine.SetRange("Vendor Invoice No.", VendorInvoiceNo);
        ImportLine.SetRange(Processed, false);
        if ImportLine.FindSet(true) then
            repeat
                PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
                PurchaseLine.SetRange("Document No.", PurchaseOrderNo);
                PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
                PurchaseLine.SetRange("No.", ImportLine."Item No.");
                if not PurchaseLine.FindFirst() then
                    Error(ItemNotOnPurchaseOrderErr, ImportLine."Item No.");

                WarehouseReceiptLine.Reset();
                WarehouseReceiptLine.SetRange("No.", FirstReceiptNo);
                WarehouseReceiptLine.SetRange("Source Line No.", PurchaseLine."Line No.");
                if not WarehouseReceiptLine.FindFirst() then
                    Error(ReceiptLineNotCreatedErr, ImportLine."Item No.", PurchaseOrderNo);

                WarehouseReceiptLine.Validate("Qty. to Receive", ImportLine."Qty. to Receive");
                WarehouseReceiptLine.Validate("Bin Code", ImportLine."Bin Code");
                WarehouseReceiptLine.Modify(true);

                ImportLine."Warehouse Receipt No." := FirstReceiptNo;
                ImportLine.Processed := true;
                ImportLine.Modify(true);
            until ImportLine.Next() = 0;

        WarehouseReceiptHeader.Get(FirstReceiptNo);
        ImportLine.Reset();
        ImportLine.SetRange("Purchase Order No.", PurchaseOrderNo);
        ImportLine.SetRange("Vendor Invoice No.", VendorInvoiceNo);
        ImportLine.SetRange(Processed, true);
        if ImportLine.FindFirst() then begin
            WarehouseReceiptHeader.Validate("Vendor Shipment No.", ImportLine."Vendor Invoice No.");
            WarehouseReceiptHeader.Validate("Bill of Entry No.", ImportLine."BOE No.");
            WarehouseReceiptHeader.Validate("Bill of Entry Date", ImportLine."BOE Date");
            WarehouseReceiptHeader.Modify(true);

            PurchaseHeader.Validate("Bill of Entry No.", ImportLine."BOE No.");
            PurchaseHeader.Validate("Bill of Entry Date", ImportLine."BOE Date");
            PurchaseHeader.Modify(true);
        end;

        WarehouseReceiptWorkflow.CheckInvcomingApprovalWorkFlowEnabled(WarehouseReceiptHeader);
        ApprovalManagement.OnSendRequestforApproval(WarehouseReceiptHeader);
    end;

    local procedure ValidateHeading(var TempExcelBuffer: Record "Excel Buffer" temporary; ColumnNo: Integer; ExpectedHeading: Text)
    var
        ActualHeading: Text;
    begin
        ActualHeading := GetValueAtCell(TempExcelBuffer, 1, ColumnNo);
        if NormalizeHeader(ActualHeading) <> NormalizeHeader(ExpectedHeading) then
            Error(InvalidHeadingErr, ColumnNo, ExpectedHeading, ActualHeading);
    end;

    local procedure NormalizeHeader(HeaderValue: Text): Text
    begin
        HeaderValue := ConvertStr(HeaderValue, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ');
        exit(DelChr(HeaderValue, '=', ' ._-/()'));
    end;

    local procedure NormalizeNumericText(Value: Text): Text
    begin
        exit(DelChr(Value, '=', ', ()'));
    end;

    local procedure GetValueAtCell(var TempExcelBuffer: Record "Excel Buffer" temporary; RowNo: Integer; ColumnNo: Integer): Text
    begin
        if (ColumnNo <> 0) and TempExcelBuffer.Get(RowNo, ColumnNo) then
            exit(TempExcelBuffer."Cell Value as Text");
        exit('');
    end;

    var
        UploadExcelMsg: Label 'Select the Excel file to import.';
        NoFileSelectedErr: Label 'No Excel file was selected.';
        InvalidHeadingErr: Label 'Excel column %1 must have the heading "%2", but contains "%3".', Comment = '%1 = column number; %2 = expected heading; %3 = actual heading.';
        MissingValueErr: Label 'Excel row %1 must contain a value for %2.', Comment = '%1 = Excel row number; %2 = required column name.';
        InvalidQuantityErr: Label 'Excel row %1 contains an invalid quantity: %2.', Comment = '%1 = Excel row number; %2 = invalid quantity text.';
        InvalidDateErr: Label 'Excel row %1 contains an invalid BOE date: %2.', Comment = '%1 = Excel row number; %2 = invalid date text.';
        BOENoTooLongErr: Label 'Excel row %1 has a BOE No. longer than %2 characters.', Comment = '%1 = Excel row number; %2 = maximum BOE No. length.';
        NoImportRowsErr: Label 'There are no unprocessed imported lines.';
        ImportedLinesMsg: Label '%1 line(s) were uploaded.', Comment = '%1 = number of imported lines.';
        ValidationCompleteMsg: Label 'Validation is complete. Review the Status and Reason columns before processing.';
        VendorInvoiceRequiredErr: Label 'Vendor Invoice No. is required.';
        BOENumberRequiredErr: Label 'BOE No. is required.';
        BOEDateRequiredErr: Label 'BOE Date is required.';
        PurchaseOrderNotFoundErr: Label 'Purchase order %1 was not found.', Comment = '%1 = purchase order number.';
        PurchaseOrderNotReleasedErr: Label 'The purchase order is not released.';
        LocationNotFoundErr: Label 'The purchase order location was not found.';
        ItemNotOnPurchaseOrderErr: Label 'Item %1 is not on the purchase order.', Comment = '%1 = item number.';
        DuplicatePurchaseOrderItemErr: Label 'The item occurs on multiple purchase order lines.';
        OutstandingQuantityErr: Label 'Outstanding quantity is less than the GRN quantity.';
        UnitOfMeasureMismatchErr: Label 'The Excel unit of measure does not match the purchase order.';
        DuplicateImportedItemErr: Label 'The same item occurs more than once for this purchase order.';
        ConflictingInvoiceDetailsErr: Label 'BOE details differ between lines with this vendor invoice number.';
        BinNotAvailableErr: Label 'Bin Code is not available for the purchase order location.';
        ValidationRequiredErr: Label 'Data upload has not passed validation: %1', Comment = ' %1 = validation reason.';
        NoWarehouseRequestErr: Label 'No inbound warehouse request was found for purchase order %1.', Comment = '%1 = purchase order number.';
        NoReceiptLinesCreatedErr: Label 'No warehouse receipt lines were created for purchase order %1.', Comment = '%1 = purchase order number.';
        MultipleReceiptHeadersErr: Label 'Purchase order %1 was split across multiple warehouse receipts.', Comment = '%1 = purchase order number.';
        ReceiptLineNotCreatedErr: Label 'No warehouse receipt line was created for item %1 on purchase order %2.', Comment = '%1 = item number; %2 = purchase order number.';
        ProcessedLinesMsg: Label '%1 line(s) were processed into warehouse receipts.', Comment = '%1 = number of processed lines.';
}
