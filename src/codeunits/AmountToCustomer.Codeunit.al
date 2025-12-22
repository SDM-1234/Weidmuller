namespace WM.WeidmullerDEV;

using Microsoft.Finance.GST.Base;
using Microsoft.Sales.History;
using Microsoft.Sales.Receivables;
    
codeunit 50012 "Amount To Customer"
{
    trigger OnRun()
    begin

    end;

    var
        CGSTLbl: Label 'CGST', Locked = true;
        SGSTLbl: label 'SGST', Locked = true;
        IGSTLbl: Label 'IGST', Locked = true;
        CESSLbl: Label 'CESS', Locked = true;

    procedure AmttoCustomerHeader(TableNo: Integer; DocumentNo: Code[20]): Decimal
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        CustLedgerEntry.SetCurrentKey("Document No.");
        CustLedgerEntry.SetRange("Document No.", DocumentNo);
        case TableNo of
            Database::"Sales Invoice Header":
                CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Invoice);
            Database::"Sales Cr.Memo Header":
                CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::"Credit Memo");
        end;

        if CustLedgerEntry.FindFirst() then
            exit(Abs(CustLedgerEntry."Sales (LCY)"));
    end;

    procedure GetGSTValueForLine(
    DocumentNo: Code[20];
    DocumentLineNo: Integer;
    var CGSTLineAmount: Decimal;
    var SGSTLineAmount: Decimal;
    var IGSTLineAmount: Decimal;
    var CESSLineAmount: Decimal)
    var
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        PostedSalesInvRep: Report "Posted Sales Invoice";
    begin
        SalesInvoiceHeader.Get(DocumentNo);
        CGSTLineAmount := 0;
        SGSTLineAmount := 0;
        IGSTLineAmount := 0;
        CESSLineAmount := 0;

        DetailedGSTLedgerEntry.SetRange("Document No.", DocumentNo);
        DetailedGSTLedgerEntry.SetRange("Document Line No.", DocumentLineNo);
        DetailedGSTLedgerEntry.SetRange("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
        DetailedGSTLedgerEntry.SetRange("GST Component Code", CGSTLbl);
        if DetailedGSTLedgerEntry.FindSet() then
            repeat
                CGSTLineAmount += Abs(DetailedGSTLedgerEntry."GST Amount");
            until DetailedGSTLedgerEntry.Next() = 0;

        DetailedGSTLedgerEntry.SetRange("GST Component Code", SGSTLbl);
        if DetailedGSTLedgerEntry.FindSet() then
            repeat
                SGSTLineAmount += Abs(DetailedGSTLedgerEntry."GST Amount")
            until DetailedGSTLedgerEntry.Next() = 0;

        DetailedGSTLedgerEntry.SetRange("GST Component Code", IGSTLbl);
        if DetailedGSTLedgerEntry.FindSet() then
            repeat
                if salesInvoiceHeader."Currency Code" <> '' then
                    IGSTLineAmount += Round((Abs(DetailedGSTLedgerEntry."GST Amount") * salesInvoiceHeader."Currency Factor"), PostedSalesInvRep.GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"))
                else
                    IGSTLineAmount += Abs(DetailedGSTLedgerEntry."GST Amount");
            until DetailedGSTLedgerEntry.Next() = 0;

        DetailedGSTLedgerEntry.SetRange("GST Component Code", CESSLbl);
        if DetailedGSTLedgerEntry.FindSet() then
            repeat
                if salesInvoiceHeader."Currency Code" <> '' then
                    CESSLineAmount += Round((Abs(DetailedGSTLedgerEntry."GST Amount") * salesInvoiceHeader."Currency Factor"), PostedSalesInvRep.GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"))
                else
                    CESSLineAmount += Abs(DetailedGSTLedgerEntry."GST Amount");
            until DetailedGSTLedgerEntry.Next() = 0;

    end;

    procedure GetGSTValueForLineCrMemo(
        DocumentNo: Code[20];
        DocumentLineNo: Integer;
        var CGSTLineAmount: Decimal;
        var SGSTLineAmount: Decimal;
        var IGSTLineAmount: Decimal;
        var CESSLineAmount: Decimal)
    var
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        PostedSalesInvRep: Report "Posted Sales Invoice";
    begin
        SalesCrMemoHeader.Get(DocumentNo);
        CGSTLineAmount := 0;
        SGSTLineAmount := 0;
        IGSTLineAmount := 0;
        CESSLineAmount := 0;

        DetailedGSTLedgerEntry.SetRange("Document No.", DocumentNo);
        DetailedGSTLedgerEntry.SetRange("Document Line No.", DocumentLineNo);
        DetailedGSTLedgerEntry.SetRange("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
        DetailedGSTLedgerEntry.SetRange("GST Component Code", CGSTLbl);
        if DetailedGSTLedgerEntry.FindSet() then
            repeat
                CGSTLineAmount += Abs(DetailedGSTLedgerEntry."GST Amount");
            until DetailedGSTLedgerEntry.Next() = 0;

        DetailedGSTLedgerEntry.SetRange("GST Component Code", SGSTLbl);
        if DetailedGSTLedgerEntry.FindSet() then
            repeat
                SGSTLineAmount += Abs(DetailedGSTLedgerEntry."GST Amount")
            until DetailedGSTLedgerEntry.Next() = 0;

        DetailedGSTLedgerEntry.SetRange("GST Component Code", IGSTLbl);
        if DetailedGSTLedgerEntry.FindSet() then
            repeat
                if SalesCrMemoHeader."Currency Code" <> '' then
                    IGSTLineAmount += Round((Abs(DetailedGSTLedgerEntry."GST Amount") * SalesCrMemoHeader."Currency Factor"), PostedSalesInvRep.GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"))
                else
                    IGSTLineAmount += Abs(DetailedGSTLedgerEntry."GST Amount");
            until DetailedGSTLedgerEntry.Next() = 0;

        DetailedGSTLedgerEntry.SetRange("GST Component Code", CESSLbl);
        if DetailedGSTLedgerEntry.FindSet() then
            repeat
                if SalesCrMemoHeader."Currency Code" <> '' then
                    CESSLineAmount += Round((Abs(DetailedGSTLedgerEntry."GST Amount") * SalesCrMemoHeader."Currency Factor"), PostedSalesInvRep.GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"))
                else
                    CESSLineAmount += Abs(DetailedGSTLedgerEntry."GST Amount");
            until DetailedGSTLedgerEntry.Next() = 0;

    end;
}