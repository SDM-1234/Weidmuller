namespace WM.WeidmullerDEV;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;
using Microsoft.Sales.History;
    
report 50014 "Calculate Industry Segments"
{
    ApplicationArea = All;
    UsageCategory = Tasks;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            dataitem("Sales Header"; "Sales Header")
            {
                DataItemLink = "Sell-to Customer No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Sell-to Customer No.")
                                    ORDER(Ascending)
                                    WHERE(Status = FILTER(Released));
                RequestFilterFields = "Document Type", "Sell-to Customer No.", "No.";

                trigger OnAfterGetRecord()
                var
                    SalesSegment: Record "Sales Segment";
                    SalesLine: Record "Sales Line";
                    SalesShipmentLine: Record "Sales Shipment Line";
                    NewSalesSegment: Record "Sales Segment";
                begin
                    IF "Sales Header"."Document Type" = "Sales Header"."Document Type"::Order THEN BEGIN
                        SalesSegment.RESET();
                        SalesSegment.SETRANGE("Sales Order No.", "Sales Header"."No.");
                        IF NOT SalesSegment.FINDSET() THEN
                            InsertSalesSegments();
                    END ELSE
                        IF "Sales Header"."Document Type" = "Sales Header"."Document Type"::Invoice THEN BEGIN
                            SalesSegment.RESET();
                            SalesSegment.SETRANGE("Customer No.", "Sales Header"."Sell-to Customer No.");
                            SalesSegment.SETRANGE("Sales Invoice No.", "Sales Header"."No.");
                            IF NOT SalesSegment.FINDSET() THEN BEGIN
                                SalesLine.RESET();
                                SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Invoice);
                                SalesLine.SETRANGE("Document No.", "Sales Header"."No.");
                                SalesLine.SETFILTER("Shipment No.", '<>%1', '');
                                IF SalesLine.FINDFIRST() THEN BEGIN
                                    SalesShipmentLine.RESET();
                                    IF SalesShipmentLine.GET(SalesLine."Shipment No.", SalesLine."Shipment Line No.") THEN BEGIN
                                        SalesSegment.RESET();
                                        SalesSegment.SETRANGE("Sales Order No.", SalesShipmentLine."Order No.");
                                        SalesSegment.SETFILTER("Sales Invoice No.", '%1', '');
                                        IF SalesSegment.FINDSET() THEN BEGIN
                                            REPEAT
                                                NewSalesSegment.INIT();
                                                NewSalesSegment.TRANSFERFIELDS(SalesSegment);
                                                NewSalesSegment."Sales Invoice No." := SalesLine."Document No.";
                                                NewSalesSegment.Amount := FindLineAmount("Sales Header") * (SalesSegment."Sales %" / 100);
                                                NewSalesSegment.INSERT();
                                            UNTIL SalesSegment.NEXT() = 0;
                                            Counter += 1;
                                        END ELSE
                                            InsertInvoiceSalesSegments("Sales Header");
                                    END ELSE
                                        InsertInvoiceSalesSegments("Sales Header");
                                END ELSE
                                    InsertInvoiceSalesSegments("Sales Header");
                            END ELSE
                                InsertInvoiceSalesSegments("Sales Header");
                        END;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Customer.CALCFIELDS(Customer."No. of Industry Segments");
                IF Customer."No. of Industry Segments" = 0 THEN
                    CurrReport.SKIP();
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

    trigger OnPostReport()
    begin
        MESSAGE(FORMAT(Counter) + ' Industry Segments are calculated');
    end;

    trigger OnPreReport()
    begin
        IF "Sales Header".GETFILTER("Sales Header"."Document Type") = '' THEN
            "Sales Header".SETFILTER("Sales Header"."Document Type", '%1|%2', "Sales Header"."Document Type"::Order, "Sales Header"."Document Type"::Invoice);
    end;

    var
        Counter: Integer;

    local procedure FindLineAmount(SalesHeader: Record "Sales Header") TotalLineAmt: Decimal
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.RESET();
        SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
        SalesLine.SETRANGE("Document No.", SalesHeader."No.");
        IF SalesLine.FINDSET() THEN
            REPEAT
                TotalLineAmt += SalesLine."Line Amount";
            UNTIL SalesLine.NEXT() = 0;
    end;

    local procedure FindInvoiceLineAmount(SalesHeader: Record "Sales Header") TotalLineAmt: Decimal
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.RESET();
        SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
        SalesLine.SETRANGE("Document No.", SalesHeader."No.");
        IF SalesLine.FINDSET() THEN
            REPEAT
                TotalLineAmt += SalesLine."Line Amount";
            UNTIL SalesLine.NEXT() = 0;
    end;

    local procedure InsertInvoiceSalesSegments(SalesHeader: Record "Sales Header")
    var
        SalesSegment: Record "Sales Segment";
        IndustrySegment: Record "Industry Segment";
    begin
        IndustrySegment.RESET();
        IndustrySegment.SETRANGE("Customer No.", SalesHeader."Sell-to Customer No.");
        IF IndustrySegment.FINDSET() THEN BEGIN
            REPEAT
                SalesSegment.INIT();
                SalesSegment."Customer No." := IndustrySegment."Customer No.";
                SalesSegment."Industry Group Code" := IndustrySegment."Industry Group Code";
                SalesSegment."Sales Invoice No." := SalesHeader."No.";
                SalesSegment."Sales %" := IndustrySegment."Sales %";
                SalesSegment.Amount := FindInvoiceLineAmount(SalesHeader) * (IndustrySegment."Sales %" / 100);
                SalesSegment.INSERT();
            UNTIL IndustrySegment.NEXT() = 0;
            Counter += 1;
        END;
    end;
}

