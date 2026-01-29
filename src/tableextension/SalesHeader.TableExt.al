namespace WM.WeidmullerDEV;

using Microsoft.Finance.GST.Base;
using Microsoft.Finance.Reports;
using Microsoft.Finance.TaxEngine.TaxTypeHandler;
using Microsoft.Foundation.Attachment;
using Microsoft.Sales.Document;

tableextension 50029 SalesHeader extends "Sales Header"
{
    fields
    {

        modify("Transaction Type")
        {
            trigger OnAfterValidate()
            var
                SalesPriceManagement: Codeunit "Sales Price Management";
            begin
                SalesPriceManagement.ConfirmTransactionType(Rec, xRec);
            end;
        }
        modify("Shipment Date")
        {
            trigger OnAfterValidate()
            var
                SalesLine: Record "Sales Line";
            begin
                SalesLine.SetRange("Document Type", "Document Type");
                SalesLine.SetRange("Document No.", "No.");
                SalesLine.setrange("Shipment Date Updated", true);
                if not salesline.IsEmpty then
                    Error('Shipment Date cannot be changed as it is already updated once.');
            end;
        }

        modify("Requested Delivery Date")
        {
            trigger OnAfterValidate()
            var
                SalesLine: Record "Sales Line";
            begin
                SalesLine.SetRange("Document Type", "Document Type");
                SalesLine.SetRange("Document No.", "No.");
                SalesLine.setrange("Shipment Date Updated", true);
                if not salesline.IsEmpty then
                    Error('Requested Delivery Date cannot be changed as Shipment Date is already updated once.');
            end;
        }



        modify("External Document No.")
        {
            Caption = 'PO No.';
            trigger OnBeforeValidate()
            var
                SalesHeader: Record "Sales Header";
                i: Integer;
                SONo: array[10] of Code[20];
            begin


                SalesHeader.SETRANGE("Document Type", SalesHeader."Document Type"::Order);
                SalesHeader.SETRANGE("External Document No.", "External Document No.");
                i := 1;
                IF SalesHeader.FindSet() THEN
                    REPEAT
                        SONo[i] := SalesHeader."No.";
                        i += 1;
                    UNTIL SalesHeader.NEXT() = 0;
                IF i > 1 THEN
                    MESSAGE('Customer PO is already available with %1 %2 %3 OC', SONo[1], SONo[2], SONo[3]);

                IF ("Document Type" IN ["Document Type"::Quote, "Document Type"::Order]) AND
                  NOT ("External Document No." = xRec."External Document No.") THEN
                    UpdatePoNo();

            end;
        }
        field(50001; "Total No of Boxes"; Integer)
        {
        }
        field(50002; "Date of Removal"; Date)
        {
            Description = 'SE-E859';
        }
        field(50003; "Total Weight"; Decimal)
        {
            Description = 'SE-E859';
        }
        field(50004; "Enquiry No."; Code[20])
        {
            Description = 'SE-E859';
        }
        field(50080; Validity; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'SE_LIJO';
        }

    }
    keys
    {
        key(SK1; "Sell-to Customer No.", "External Document No.")
        {
        }
        key(SK2; "No.", "Document Type", "Status", "Document Date")
        {
        }

    }

    procedure UpdatePoNo()
    begin
        IF NOT SalesLinesExist() THEN
            EXIT;
        SalesLine.RESET();
        SalesLine.SETRANGE("Document Type", "Document Type");
        SalesLine.SETRANGE("Document No.", "No.");
        IF SalesLine.FINDSET() THEN
            REPEAT
                SalesLine."PO No." := "External Document No.";
                SalesLine.MODIFY();
            UNTIL SalesLine.NEXT() = 0;
    end;

    PROCEDURE CheckIndustrySegments();
    VAR
        IndustrySegment: Record "Industry Segment";
        SalesSegment: Record "Sales Segment";
    BEGIN
        IndustrySegment.RESET();
        IndustrySegment.SETRANGE("Customer No.", "Sell-to Customer No.");
        IF not IndustrySegment.IsEmpty THEN BEGIN
            SalesSegment.RESET();
            SalesSegment.SETRANGE("Customer No.", "Sell-to Customer No.");
            SalesSegment.SETRANGE("Sales Order No.", "No.");
            IF SalesSegment.IsEmpty THEN
                ERROR('Industrial Segments need to be assigned');
        END;
    END;

    PROCEDURE InsertSalesSegments();
    VAR
        IndustrySegment: Record "Industry Segment";
        SalesSegment: Record "Sales Segment";
    BEGIN
        IndustrySegment.RESET();
        IndustrySegment.SETRANGE("Customer No.", "Sell-to Customer No.");
        IF IndustrySegment.FINDSET() THEN
            REPEAT
                SalesSegment.INIT();
                SalesSegment."Customer No." := IndustrySegment."Customer No.";
                SalesSegment."Industry Group Code" := IndustrySegment."Industry Group Code";
                SalesSegment."Sales Order No." := "No.";
                SalesSegment."Sales %" := IndustrySegment."Sales %";
                SalesSegment.Amount := (Amount + GetGSTAmounts()) * (IndustrySegment."Sales %" / 100);
                SalesSegment.INSERT();
            UNTIL IndustrySegment.NEXT() = 0;
    END;

    procedure GetGSTAmounts(): Decimal
    var
        SalesLine: Record "Sales Line";
        GSTSetup: Record "GST Setup";
        TaxTransactionValue: Record "Tax Transaction Value";
        OrderConfReport: Report "Order Confirmation GST";
        SGSTAmt, CGSTAmt, IGSTAmt, CessAmount : Decimal;
    begin
        GSTSetup.Get();

        SalesLine.setfilter(Type, '<>%1', SalesLine.Type::" ");
        SalesLine.setrange("Document Type", "Document Type");
        SalesLine.setrange("Document No.", "No.");
        if SalesLine.FindSet() then
            repeat
                TaxTransactionValue.Reset();
                TaxTransactionValue.SetRange("Tax Record ID", SalesLine.RecordId);
                TaxTransactionValue.SetRange("Tax Type", GSTSetup."GST Tax Type");
                TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
                TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
                if TaxTransactionValue.FindSet() then
                    repeat
                        case TaxTransactionValue."Value ID" of
                            6:
                                SGSTAmt += Round(TaxTransactionValue.Amount, OrderConfReport.GetGSTRoundingPrecision(SGSTLbl));
                            2:
                                CGSTAmt += Round(TaxTransactionValue.Amount, OrderConfReport.GetGSTRoundingPrecision(CGSTLbl));
                            3:
                                IGSTAmt += Round(TaxTransactionValue.Amount, OrderConfReport.GetGSTRoundingPrecision(IGSTLbl));
                        end;
                    until TaxTransactionValue.Next() = 0;

                TaxTransactionValue.SetRange("Tax Type", GSTSetup."Cess Tax Type");
                TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
                TaxTransactionValue.SetRange("Value Type");
                if TaxTransactionValue.FindSet() then
                    repeat
                        CessAmount += Round(TaxTransactionValue.Amount, OrderConfReport.GetGSTRoundingPrecision(SGSTLbl));
                    until TaxTransactionValue.Next() = 0;
            until SalesLine.Next() = 0;
        exit(SGSTAmt + CGSTAmt + IGSTAmt + CessAmount);
    end;

    procedure CheckAttachment(GRec: Record "Sales Header")
    var
        RecordLink: Record "Document Attachment";
    begin
        RecordLink.SETRANGE("Table ID", Database::"Sales Header");
        RecordLink.SetRange("No.", GRec."No.");
        IF RecordLink.IsEmpty THEN
            ERROR('Link attachment is mandatory to send approval request');
    end;


    var
        IGSTLbl: Label 'IGST';
        SGSTLbl: Label 'SGST';
        CGSTLbl: Label 'CGST';

}

