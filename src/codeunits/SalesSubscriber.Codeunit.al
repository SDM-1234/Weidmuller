namespace WM.WeidmullerDEV;

using Microsoft.CRM.Contact;
using Microsoft.CRM.Task;
using Microsoft.Finance.Currency;
using Microsoft.Finance.GeneralLedger.Posting;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Finance.GST.Sales;
using Microsoft.Finance.ReceivablesPayables;
using Microsoft.Foundation.ExtendedText;
using Microsoft.Foundation.Reporting;
using Microsoft.Inventory.Availability;
using Microsoft.Inventory.Item;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;
using Microsoft.Sales.History;
using Microsoft.Sales.Posting;
using Microsoft.Sales.Receivables;
using Microsoft.Sales.Setup;
using Microsoft.Utilities;
using Microsoft.Warehouse.Document;
using Microsoft.Warehouse.History;
using System.Automation;
    
codeunit 50100 SalesSubscriber
{

    [EventSubscriber(ObjectType::Table, Database::"Sales Shipment Line", OnBeforeCodeInsertInvLineFromShptLine, '', false, false)]
    local procedure OnBeforeCodeInsertInvLineFromShptLine_WM(var SalesLine: Record "Sales Line"; var SalesShipmentLine: Record "Sales Shipment Line")
    begin
        SalesLine."OC No" := SalesShipmentLine."Order No.";
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeCheckBlockedCust', '', false, false)]
    local procedure OnBeforeCheckBlockedCust_WM(Customer: Record Customer; DocType: Option; Shipment: Boolean; Source: Option; Transaction: Boolean; var IsHandled: Boolean)
    var
        SingleInstanceCU: Codeunit "Single Instance CU";
    begin
        IsHandled := true;
        IF Customer."Privacy Blocked" THEN
            Customer.CustPrivacyBlockedErrorMessage(Customer, Transaction);

        case Source of
            1: //DOcument
                IF ((Customer.Blocked = Customer.Blocked::All) OR
                    ((Customer.Blocked = Customer.Blocked::Invoice) AND (DocType IN [0, 1, 2, 4]) AND (NOT SingleInstanceCU.GetBlockParameterFromDocs())) OR
                    ((Customer.Blocked = Customer.Blocked::Ship) AND (DocType IN [0, 1, 4]) AND
                    (NOT Transaction) AND (NOT SingleInstanceCU.GetBlockParameterFromDocs())) OR
                    ((Customer.Blocked = Customer.Blocked::Ship) AND (DocType IN [0, 1, 2, 4]) AND
                    Shipment AND Transaction) AND (NOT SingleInstanceCU.GetBlockParameterFromDocs()))
                THEN
                    Customer.CustBlockedErrorMessage(Customer, Transaction);
            0: //Journal
                IF (Customer.Blocked = Customer.Blocked::All) OR
                   ((Customer.Blocked = Customer.Blocked::Invoice) AND (DocType IN [2]))

                THEN
                    Customer.CustBlockedErrorMessage(Customer, Transaction);
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnValidatePostingDateOnBeforeAssignDocumentDate, '', false, false)]
    local procedure OnValidatePostingDateOnBeforeAssignDocumentDate_WM(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    var
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.Get();
        if not SalesSetup."Link Doc. Date To Posting Date" then
            IF (SalesHeader."Incoming Document Entry No." = 0) AND (SalesHeader."Document Type" <> SalesHeader."Document Type"::Order) THEN begin
                SalesHeader.VALIDATE("Document Date", SalesHeader."Posting Date");
                IsHandled := true;
            end;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterCopyFromItem, '', false, false)]
    local procedure OnAfterCopyFromItem_WM(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; Item: Record Item)
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Quote THEN
            IF SalesHeader."Sell-to Customer No." <> '' THEN
                IF SalesLine."No." <> xSalesLine."No." THEN
                    IF SalesLine."No." <> '' THEN
                        SalesLine.UpdateLatestUnitPrice(SalesHeader)
                    ELSE BEGIN
                        SalesLine."Latest UnitPrice" := 0;
                        CLEAR(SalesLine."Latest Invoice Date");
                    END;
    END;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnCheckItemAvailableOnBeforeSalesLineCheck, '', false, false)]
    local procedure OnCheckItemAvailableOnBeforeSalesLineCheck_WM(var SalesLine: Record "Sales Line")
    var
        ItemCheckAvail: COdeunit "Item-Check Avail.";
    begin
        if ItemCheckAvail.SalesLineCheck(SalesLine) then
            ItemCheckAvail.RaiseUpdateInterruptedError()
        //else
        //  ItemCheckAvail.GetCurrSalesLine(SalesLine);//SE-E859

        //OnCheckItemAvailableOnBeforeSalesLineCheck(Rec, CalledByFieldNo, CurrFieldNo, xRec, IsHandled);

    end;

    [EventSubscriber(ObjectType::Table, Database::"To-do", OnBeforeValidateEvent, "Contact No.", true, true)]
    local procedure OnBeforeValidateEvent_ContactNo(CurrFieldNo: Integer; var Rec: Record "To-do"; var xRec: Record "To-do")
    var
        Cont: Record Contact;
    begin
        IF Cont.GET(Rec."Contact No.") THEN
            IF Rec."Salesperson Code" = '' THEN
                Rec."Salesperson Code" := Cont."Salesperson Code";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Apply Customer Entries", OnPostDirectApplicationBeforeApply, '', false, false)]
    local procedure "Apply Customer Entries_OnPostDirectApplicationBeforeApply"(GLSetup: Record "General Ledger Setup"; var NewApplyUnapplyParameters: Record "Apply Unapply Parameters" temporary)
    var
        RecCust: Record Customer;
    begin
        if NewApplyUnapplyParameters."Account Type" <> NewApplyUnapplyParameters."Account Type"::Customer then
            exit;
        IF NOT RecCust.GET(NewApplyUnapplyParameters."Account No.") THEN
            EXIT;
        IF NOT NewApplyUnapplyParameters.UpdateBackBlocked THEN BEGIN
            IF RecCust.Blocked <> RecCust.Blocked::Invoice THEN
                EXIT;
            IF (NewApplyUnapplyParameters."Document Type" = NewApplyUnapplyParameters."Document Type"::" ") THEN BEGIN
                RecCust.Blocked := RecCust.Blocked::" ";
                RecCust.MODIFY(TRUE);
                NewApplyUnapplyParameters.UpdateBackBlocked := TRUE;
            END;
        END;
    END;

    [EventSubscriber(ObjectType::Page, Page::"Apply Customer Entries", OnPostDirectApplicationOnAfterApply, '', false, false)]
    local procedure "Apply Customer Entries_OnPostDirectApplicationOnAfterApply"(var CustLedgerEntry: Record "Cust. Ledger Entry"; var NewApplyUnapplyParameters: Record "Apply Unapply Parameters" temporary; PreviewMode: Boolean; Applied: Boolean)
    var
        RecCust: Record Customer;
    begin
        IF NewApplyUnapplyParameters.UpdateBackBlocked THEN BEGIN
            RecCust.Blocked := Reccust.Blocked::Invoice;
            RecCust.MODIFY(TRUE);
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforePerformManualReleaseProcedure, '', false, false)]
    local procedure "Release Sales Document_OnBeforePerformManualReleaseProcedure"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean)
    var
        SalesPriceManagement: Codeunit "Sales Price Management";
    begin
        if SalesHeader."Document Type" in [SalesHeader."Document Type"::Quote, SalesHeader."Document Type"::Order] then
            SalesPriceManagement.ApprovalProcessMandatory(SalesHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', false, false)]
    local procedure "Sales-Post_OnBeforePostSalesDoc"(var Sender: Codeunit "Sales-Post"; var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var HideProgressWindow: Boolean; var IsHandled: Boolean; var CalledBy: Integer)
    var
        SalesPriceManagement: Codeunit "Sales Price Management";
    begin
        if not (SalesHeader."Document Type" in [SalesHeader."Document Type"::Quote, SalesHeader."Document Type"::Order]) then
            exit;
        SalesHeader.TESTFIELD("Currency Code");
        SalesHeader.TESTFIELD("External Document No.");
        //SalesHeader.CheckIndustrySegments();
        SalesPriceManagement.ApprovalProcessMandatory(SalesHeader);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Shipment Line", OnInsertInvLineFromShptLineOnBeforeAssigneSalesLine, '', false, false)]
    local procedure "Sales Shipment Line_OnInsertInvLineFromShptLineOnBeforeAssigneSalesLine"(var SalesShipmentLine: Record "Sales Shipment Line"; SalesHeaderInv: Record "Sales Header"; SalesHeaderOrder: Record "Sales Header"; var SalesLine: Record "Sales Line"; var SalesOrderLine: Record "Sales Line"; Currency: Record Currency)
    begin
        SalesLine."OC No" := SalesShipmentLine."Order No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Print", OnBeforeDoPrintSalesHeader, '', false, false)]
    local procedure "Document-Print_OnBeforeDoPrintSalesHeader"(var SalesHeader: Record "Sales Header"; ReportUsage: Integer; SendAsEmail: Boolean; var IsPrinted: Boolean)
    begin
        if SalesHeader."Document Type" in [SalesHeader."Document Type"::Quote, SalesHeader."Document Type"::Order] then
            SalesHeader.TESTFIELD("Currency Code");//SDM-RSF_ZOHO.1583
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Quote to Order (Yes/No)", OnBeforeRun, '', false, false)]
    local procedure "Sales-Quote to Order (Yes/No)_OnBeforeRun"(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    var
        SalesPriceManagement: Codeunit "Sales Price Management";
    begin
        SalesPriceManagement.ApprovalProcessMandatory(SalesHeader);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Shipment Line", OnBeforeCodeInsertInvLineFromShptLine, '', false, false)]
    local procedure "Sales Shipment Line_OnBeforeCodeInsertInvLineFromShptLine"(var SalesShipmentLine: Record "Sales Shipment Line"; var SalesLine: Record "Sales Line"; var IsHandled: Boolean)
    var
        recCust: Record Customer;
        SingleInstanceCU: Codeunit "Single Instance CU";
        txt50000Err: TextConst ENU = 'Selecting Multiple Shipment is Restricted for Customer %1';
    begin
        IF SalesLine."Bill-to Customer No." <> '' THEN BEGIN
            recCust.RESET();
            recCust.SETRANGE("No.", SalesLine."Sell-to Customer No.");
            recCust.SETRANGE("Invoice Print Check", TRUE);
            IF not recCust.IsEmpty THEN BEGIN
                IF SingleInstanceCU.GetLastDocNo() = '' THEN
                    SingleInstanceCU.SetLastDocNo(SalesShipmentLine."Document No.");
                IF (SingleInstanceCU.GetLastDocNo() <> '') AND (SingleInstanceCU.GetLastDocNo() <> SalesShipmentLine."Document No.") THEN
                    ERROR(txt50000Err, SalesLine."Bill-to Customer No.");
            END;
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Get Shipment", OnBeforeCreateInvLines, '', false, false)]
    local procedure "Sales-Get Shipment_OnBeforeCreateInvLines"(var Sender: Codeunit "Sales-Get Shipment"; var SalesShipmentLine2: Record "Sales Shipment Line"; var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; SalesShipmentHeader: Record "Sales Shipment Header"; var IsHandled: Boolean)
    var
        SingleInstanceCU: Codeunit "Single Instance CU";
    begin
        SingleInstanceCU.SetLastDocNo('');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnInsertPostedHeadersOnAfterInsertInvoiceHeader, '', false, false)]
    local procedure "Sales-Post_OnInsertPostedHeadersOnAfterInsertInvoiceHeader"(var SalesHeader: Record "Sales Header"; var SalesInvoiceHeader: Record "Sales Invoice Header")
    var
        SalesSegment: Record "Sales Segment";
    begin
        SalesSegment.RESET();
        SalesSegment.SETRANGE("Sales Invoice No.", SalesHeader."No.");
        IF SalesSegment.FINDSET(true) THEN
            REPEAT
                SalesSegment."Posted Sales Invoice No." := SalesInvoiceHeader."No.";
                SalesSegment.MODIFY();
            UNTIL SalesSegment.NEXT() = 0;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeCreatePostedWhseRcptHeader, '', false, false)]
    local procedure "Sales-Post_OnBeforeCreatePostedWhseRcptHeader"(var PostedWhseReceiptHeader: Record "Posted Whse. Receipt Header"; WarehouseReceiptHeader: Record "Warehouse Receipt Header"; SalesHeader: Record "Sales Header")
    var
        SingleInstanceCU: Codeunit "Single Instance CU";
    begin
        SingleInstanceCU.SetWhseDocNo(WarehouseReceiptHeader."No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterInsertShipmentHeader, '', false, false)]
    local procedure "Sales-Post_OnAfterInsertShipmentHeader"(var SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header")
    var
        SingleInstanceCU: Codeunit "Single Instance CU";
    begin
        SalesShipmentHeader."WarehouseShip No." := SingleInstanceCU.GetWhseDocNo()
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterCheckMandatoryFields, '', false, false)]
    local procedure "Sales-Post_OnAfterCheckMandatoryFields"(var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean)
    begin
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice THEN BEGIN
            SalesHeader.TESTFIELD("Total No of Boxes");
            SalesHeader.TESTFIELD("Total Weight");
            SalesHeader.TESTFIELD("Shipment Method Code");
            SalesHeader.TESTFIELD("Invoice Type");
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Blnkt Sales Ord. to Ord. (Y/N)", OnBeforeRun, '', false, false)]
    local procedure "Blnkt Sales Ord. to Ord. (Y/N)_OnBeforeRun"(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    var
        CustomerCreditCheck: Codeunit "Customer Credit Check";
    begin
        CustomerCreditCheck.MakeOrderfromBlnktOrder(SalesHeader."No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnCodeOnAfterCheckCustomerCreated, '', false, false)]
    local procedure "Release Sales Document_OnCodeOnAfterCheckCustomerCreated"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean; var LinesWereModified: Boolean)
    begin
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice THEN BEGIN
            SalesHeader.TESTFIELD("Shipment Method Code");
            SalesHeader.TESTFIELD("Invoice Type");
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeManualReleaseSalesDoc, '', false, false)]
    local procedure "Release Sales Document_OnBeforeManualReleaseSalesDoc"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    var
        CustomerCreditCheck: Codeunit "Customer Credit Check";
    begin
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Order THEN
            CustomerCreditCheck.ReleasingSalesOrder(SalesHeader."No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Copy Document Mgt.", OnCopySalesDocUpdateHeaderOnBeforeUpdateCustLedgerEntry, '', false, false)]
    local procedure "Copy Document Mgt._OnCopySalesDocUpdateHeaderOnBeforeUpdateCustLedgerEntry"(var ToSalesHeader: Record "Sales Header"; FromDocType: Option; FromDocNo: Code[20]; OldSalesHeader: Record "Sales Header")
    var
        SalesHeader: Record "Sales Header";
        FromDocTypeEnum: Enum "Sales Document Type From";
    begin
        FromDocTypeEnum := Enum::"Sales Document Type From".FromInteger(FromDocType);
        if FromDocTypeEnum = FromDocTypeEnum::Quote then
            if SalesHeader.Get(FromDocType, FromDocNo) then
                ToSalesHeader."Quote No." := SalesHeader."No.";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnValidateBillToCustomerNoOnBeforeCheckBlockedCustOnDocs, '', False, False)]
    local procedure OnValidateBillToCustomerNoOnBeforeCheckBlockedCustOnDocs(var Cust: Record Customer; var IsHandled: Boolean)
    var
        SingleInstaneCU: Codeunit "Single Instance CU";
    begin
        //SE-E859.s
        IF Cust.Blocked IN [Cust.Blocked::Ship, Cust.Blocked::Invoice] THEN
            SingleInstaneCU.SetBlockParameterFromDocs();
        //SE-E859.e
        //IsHandled := true;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnValidateSellToCustomerNoOnBeforeCheckBlockedCustOnDocs, '', False, False)]
    local procedure OnValidateSellToCustomerNoOnBeforeCheckBlockedCustOnDocs(var Cust: Record Customer; var IsHandled: Boolean)
    var
        SingleInstaneCU: Codeunit "Single Instance CU";
    begin
        //SE-E859.s
        IF Cust.Blocked IN [Cust.Blocked::Ship, Cust.Blocked::Invoice] THEN
            SingleInstaneCU.SetBlockParameterFromDocs();
        //SE-E859.e
        //IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Report Selections", OnBeforePrintDocument, '', false, false)]
    local procedure "Report Selections_OnBeforePrintDocument"(TempReportSelections: Record "Report Selections" temporary; IsGUI: Boolean; var RecVarToPrint: Variant; var IsHandled: Boolean)
    begin
        if TempReportSelections.Usage IN [TempReportSelections.Usage::"Pro Forma S. Invoice", TempReportSelections.Usage::"S.Order",
                                            TempReportSelections.Usage::"S.Quote"] then
            Commit();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Get Shipment", OnBeforeOnRun, '', false, false)]
    local procedure OnBeforeOnRun_SalesGetShipment(var IsHandled: Boolean; var SalesLine: Record "Sales Line")
    var
        recSalesHeader: Record "Sales Header";
        recCust: Record Customer;
        txt50000Lbl: Label ' Selecting Multiple Shipments for Customer %1 Restricted.', Comment = '%1=Label for error message when multiple shipments are selected for a customer.';
    begin
        IF SalesLine.COUNT >= 1 THEN BEGIN
            recSalesHeader.RESET();
            recSalesHeader.SETRANGE("No.", SalesLine."Document No.");
            IF recSalesHeader.FindFirst() THEN BEGIN
                recCust.RESET();
                recCust.SETRANGE("No.", recSalesHeader."Bill-to Customer No.");
                recCust.SETRANGE("Invoice Print Check", TRUE);
                IF not recCust.IsEmpty THEN
                    ERROR(txt50000Lbl, SalesLine."Bill-to Customer No.")
            END;
            IsHandled := true;
        END;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Shipment Line", OnBeforeInsertInvLineFromShptLine, '', false, false)]
    local procedure "Sales Shipment Line_OnBeforeInsertInvLineFromShptLine"(var SalesShptLine: Record "Sales Shipment Line"; var SalesLine: Record "Sales Line"; SalesOrderLine: Record "Sales Line"; var IsHandled: Boolean; var TransferOldExtTextLines: Codeunit "Transfer Old Ext. Text Lines")
    begin
        SalesLine."OC No" := SalesShptLine."Order No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnAfterCheckSalesApprovalPossible, '', false, false)]
    local procedure WM_OnAfterCheckSalesApprovalPossible(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.CheckAttachment(SalesHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostSalesDoc, '', false, false)]
    local procedure "Sales-Post_OnAfterPostSalesDoc"(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    var
        SalesInvHeader: Record "Sales Invoice Header";
        eInvoiceJsonHandler: Codeunit "e-Invoice Json Handler";
        eInvoiceManagement: Codeunit "e-Invoice Management";
        eInvoiceNonGSTTransactionErr: Label 'E-Invoicing is not applicable for Non-GST Transactions.';
    begin
        if eInvoiceManagement.IsGSTApplicable(SalesInvHdrNo, Database::"Sales Invoice Header") then begin
            SalesInvHeader.Reset();
            SalesInvHeader.SetRange("No.", SalesInvHdrNo);
            if SalesInvHeader.FindFirst() then begin
                Clear(eInvoiceJsonHandler);
                SalesInvHeader.Mark(true);
                eInvoiceJsonHandler.SetSalesInvHeader(SalesInvHeader);
                eInvoiceJsonHandler.Run();
            end;
        end else
            Error(eInvoiceNonGSTTransactionErr);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Quote to Order (Yes/No)", OnBeforeConfirmConvertToOrder, '', false, false)]
    local procedure "Sales-Quote to Order (Yes/No)_OnBeforeConfirmConvertToOrder"(SalesHeader: Record "Sales Header"; var Result: Boolean; var IsHandled: Boolean)
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Quote then
            exit;
        if SalesHeader."Quote Valid Until Date" < Today() then
            Error('The quote %1 date has been exceeded. You cannot convert an expired quote to an order.', SalesHeader."No.");
    end;















}