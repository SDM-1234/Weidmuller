namespace WM.WeidmullerDEV;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Receivables;
    
report 50026 "Customer Applied Entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/reportlayout/CustomerAppliedEntries.rdl';
    ApplicationArea = All;
    Caption = 'Customer Applied Entries';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            DataItemTableView = SORTING("Entry No.")
                                ORDER(Ascending)
                                WHERE("Document Type" = FILTER(Invoice));
            RequestFilterFields = "Posting Date", "Customer No.";
            dataitem(TempCustomerLedgerEntry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = FIELD("Customer No.");
                DataItemTableView = SORTING("Entry No.") ORDER(Ascending);
                UseTemporary = true;
                column(PostingDate_TempCustomerLedgerEntry; TempCustomerLedgerEntry."Posting Date")
                {
                }
                column(CustomerNo_TempCustomerLedgerEntry; TempCustomerLedgerEntry."Customer No.")
                {
                }
                column(DocumentType_TempCustomerLedgerEntry; TempCustomerLedgerEntry."Document Type")
                {
                }
                column(DocumentNo_TempCustomerLedgerEntry; TempCustomerLedgerEntry."Document No.")
                {
                }
                column(CurrencyCode_TempCustomerLedgerEntry; TempCustomerLedgerEntry."Currency Code")
                {
                }
                column(Amount_TempCustomerLedgerEntry; TempCustomerLedgerEntry.Amount)
                {
                }
                column(RemainingAmount_TempCustomerLedgerEntry; TempCustomerLedgerEntry."Remaining Amount")
                {
                }
                column(OriginalAmtLCY_TempCustomerLedgerEntry; TempCustomerLedgerEntry."Original Amt. (LCY)")
                {
                }
                column(RemainingAmtLCY_TempCustomerLedgerEntry; TempCustomerLedgerEntry."Remaining Amt. (LCY)")
                {
                }
                column(PostingDate_CustLedgerEntry; "Cust. Ledger Entry"."Posting Date")
                {
                }
                column(DueDate_CustLedgerEntry; "Cust. Ledger Entry"."Due Date")
                {
                }
                column(Amount_CustLedgerEntry; "Cust. Ledger Entry".Amount)
                {
                }
                column(DocumentNo_CustLedgerEntry; "Cust. Ledger Entry"."Document No.")
                {
                }
                column(AmounttoApply_TempCustomerLedgerEntry; TempCustomerLedgerEntry."Amount to Apply")
                {
                }
                column(OrgAmount_CustLedgerEntry; "Cust. Ledger Entry"."Original Amount")
                {
                }
                column(DelaysInDays; "Cust. Ledger Entry"."Due Date" - TempCustomerLedgerEntry."Posting Date")
                {
                }
                column(CustomerName; CustomerName)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                "Cust. Ledger Entry".CALCFIELDS("Remaining Amount", "Original Amount");
                IF "Original Amount" = "Remaining Amount" THEN
                    CurrReport.SKIP();
                GetAppliedCustomerDocs("Cust. Ledger Entry", TempCustomerLedgerEntry, FALSE);


                IF Customer.GET("Customer No.") THEN
                    CustomerName := Customer.Name
                ELSE
                    CustomerName := '';
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Customer: Record Customer;
        CustomerName: Text;

    procedure GetAppliedCustomerDocs(CreateCustLedgEntry: Record "Cust. Ledger Entry"; var TEMPCustLedgerEntry: Record "Cust. Ledger Entry"; AppliedAmtWithLCY: Boolean)
    var
        DtldCustLedgEntry1: Record "Detailed Cust. Ledg. Entry";
        DtldCustLedgEntry2: Record "Detailed Cust. Ledg. Entry";
        CustLedgerEntryRec: Record "Cust. Ledger Entry";
    begin
        CLEAR(TEMPCustLedgerEntry);
        TEMPCustLedgerEntry.DELETEALL();
        DtldCustLedgEntry1.SETCURRENTKEY("Cust. Ledger Entry No.");
        DtldCustLedgEntry1.SETRANGE("Cust. Ledger Entry No.", CreateCustLedgEntry."Entry No.");
        DtldCustLedgEntry1.SETRANGE(Unapplied, FALSE);
        IF DtldCustLedgEntry1.FIND('-') THEN
            REPEAT
                IF DtldCustLedgEntry1."Cust. Ledger Entry No." =
                   DtldCustLedgEntry1."Applied Cust. Ledger Entry No."
                THEN BEGIN
                    DtldCustLedgEntry2.INIT();
                    DtldCustLedgEntry2.SETCURRENTKEY("Applied Cust. Ledger Entry No.", "Entry Type");
                    DtldCustLedgEntry2.SETRANGE(
                      "Applied Cust. Ledger Entry No.", DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                    DtldCustLedgEntry2.SETRANGE("Entry Type", DtldCustLedgEntry2."Entry Type"::Application);
                    DtldCustLedgEntry2.SETRANGE(Unapplied, FALSE);
                    IF DtldCustLedgEntry2.FIND('-') THEN
                        REPEAT
                            IF DtldCustLedgEntry2."Cust. Ledger Entry No." <>
                               DtldCustLedgEntry2."Applied Cust. Ledger Entry No."
                            THEN BEGIN
                                CustLedgerEntryRec.SETCURRENTKEY("Entry No.");
                                CustLedgerEntryRec.SETRANGE("Entry No.", DtldCustLedgEntry2."Cust. Ledger Entry No.");
                                IF CustLedgerEntryRec.FIND('-') THEN BEGIN
                                    CustLedgerEntryRec.MARK(TRUE);
                                    IF NOT TEMPCustLedgerEntry.GET(CustLedgerEntryRec."Entry No.") THEN BEGIN
                                        TEMPCustLedgerEntry := CustLedgerEntryRec;
                                        IF AppliedAmtWithLCY THEN
                                            TEMPCustLedgerEntry."Amount to Apply" := ABS(DtldCustLedgEntry2."Amount (LCY)")
                                        ELSE
                                            TEMPCustLedgerEntry."Amount to Apply" := ABS(DtldCustLedgEntry2.Amount);
                                        TEMPCustLedgerEntry."Transaction No." := DtldCustLedgEntry2."Entry No.";
                                        TEMPCustLedgerEntry."Posting Date" := DtldCustLedgEntry2."Posting Date";
                                        TEMPCustLedgerEntry.INSERT();
                                        TEMPCustLedgerEntry.MARK(TRUE);
                                    END
                                    ELSE
                                        IF TEMPCustLedgerEntry."Transaction No." <> DtldCustLedgEntry2."Entry No." THEN BEGIN
                                            IF AppliedAmtWithLCY THEN
                                                TEMPCustLedgerEntry."Amount to Apply" += ABS(DtldCustLedgEntry2."Amount (LCY)")
                                            ELSE
                                                TEMPCustLedgerEntry."Amount to Apply" += ABS(DtldCustLedgEntry2.Amount);
                                            TEMPCustLedgerEntry."Posting Date" := DtldCustLedgEntry2."Posting Date";
                                            TEMPCustLedgerEntry.MODIFY();
                                            TEMPCustLedgerEntry.MARK(TRUE);
                                        END;
                                END;
                            END;
                        UNTIL DtldCustLedgEntry2.NEXT() = 0;
                END ELSE BEGIN
                    CustLedgerEntryRec.SETCURRENTKEY("Entry No.");
                    CustLedgerEntryRec.SETRANGE("Entry No.", DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                    IF CustLedgerEntryRec.FIND('-') THEN BEGIN
                        CustLedgerEntryRec.MARK(TRUE);
                        IF NOT TEMPCustLedgerEntry.GET(CustLedgerEntryRec."Entry No.") THEN BEGIN
                            TEMPCustLedgerEntry := CustLedgerEntryRec;
                            IF AppliedAmtWithLCY THEN
                                TEMPCustLedgerEntry."Amount to Apply" := ABS(DtldCustLedgEntry1."Amount (LCY)")
                            ELSE
                                TEMPCustLedgerEntry."Amount to Apply" := ABS(DtldCustLedgEntry1.Amount);
                            TEMPCustLedgerEntry."Transaction No." := DtldCustLedgEntry1."Entry No.";
                            TEMPCustLedgerEntry."Posting Date" := DtldCustLedgEntry1."Posting Date";
                            TEMPCustLedgerEntry.INSERT();
                            TEMPCustLedgerEntry.MARK(TRUE);
                        END
                        else
                            if TEMPCustLedgerEntry."Transaction No." <> DtldCustLedgEntry1."Entry No." THEN BEGIN
                                IF AppliedAmtWithLCY THEN
                                    TEMPCustLedgerEntry."Amount to Apply" += ABS(DtldCustLedgEntry1."Amount (LCY)")
                                ELSE
                                    TEMPCustLedgerEntry."Amount to Apply" += ABS(DtldCustLedgEntry1.Amount);
                                TEMPCustLedgerEntry."Posting Date" := DtldCustLedgEntry1."Posting Date";
                                TEMPCustLedgerEntry.MODIFY();
                                TEMPCustLedgerEntry.MARK(TRUE);
                            END;
                    END;
                END;
            UNTIL DtldCustLedgEntry1.NEXT() = 0;

        CustLedgerEntryRec.SETCURRENTKEY("Entry No.");
        CustLedgerEntryRec.SETRANGE("Entry No.");

        IF CreateCustLedgEntry."Closed by Entry No." <> 0 THEN BEGIN
            CustLedgerEntryRec."Entry No." := CreateCustLedgEntry."Closed by Entry No.";
            CustLedgerEntryRec.MARK(TRUE);
            IF NOT TEMPCustLedgerEntry.GET(CustLedgerEntryRec."Entry No.") THEN BEGIN
                TEMPCustLedgerEntry := CustLedgerEntryRec;
                TEMPCustLedgerEntry.INSERT();
                TEMPCustLedgerEntry.MARK(TRUE);
            END
            ELSE
                TEMPCustLedgerEntry.MARK(TRUE);
        END;
        CustLedgerEntryRec.SETCURRENTKEY("Closed by Entry No.");
        CustLedgerEntryRec.SETRANGE("Closed by Entry No.", CreateCustLedgEntry."Entry No.");
        IF CustLedgerEntryRec.FIND('-') THEN
            REPEAT
                CustLedgerEntryRec.MARK(TRUE);
                IF NOT TEMPCustLedgerEntry.GET(CustLedgerEntryRec."Entry No.") THEN BEGIN
                    TEMPCustLedgerEntry := CustLedgerEntryRec;
                    TEMPCustLedgerEntry.INSERT();
                    TEMPCustLedgerEntry.MARK(TRUE);
                END
                ELSE
                    TEMPCustLedgerEntry.MARK(TRUE);
            UNTIL CustLedgerEntryRec.NEXT() = 0;

        CustLedgerEntryRec.SETCURRENTKEY("Entry No.");
        CustLedgerEntryRec.SETRANGE("Closed by Entry No.");

        CustLedgerEntryRec.MARKEDONLY(TRUE);

        TEMPCustLedgerEntry.SETCURRENTKEY("Entry No.");
        TEMPCustLedgerEntry.SETRANGE("Closed by Entry No.");

        TEMPCustLedgerEntry.MARKEDONLY(TRUE);
    end;
}

