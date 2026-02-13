namespace WM.WeidmullerDEV;

using Microsoft.CRM.Setup;

table 50005 "Sales Segment"
{
    DrillDownPageID = "Sales Segments";
    LookupPageID = "Sales Segments";

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            NotBlank = true;
        }
        field(2; "Industry Group Code"; Code[20])
        {
            TableRelation = "Industry Segment"."Industry Group Code" where("Customer No." = field("Customer No."));
        }
        field(3; "Sales Invoice No."; Code[20])
        {
        }
        field(4; "Sales Order No."; Code[20])
        {
        }
        field(5; "Posted Sales Invoice No."; Code[20])
        {
        }
        field(6; "Sales %"; Decimal)
        {

            trigger OnValidate()
            var
                SalesSegment: Record "Sales Segment";
                TotalSalesPercentage: Decimal;
            begin
                SalesSegment.RESET();
                SalesSegment.SETRANGE("Customer No.", "Customer No.");
                SalesSegment.SETRANGE("Sales Order No.", "Sales Order No.");
                SalesSegment.SETRANGE("Sales Invoice No.", "Sales Invoice No.");
                SalesSegment.SETFILTER("Industry Group Code", '<>%1&<>%2', "Industry Group Code", 'UNASSIGNED');
                IF SalesSegment.FINDSET(false) THEN
                    REPEAT
                        TotalSalesPercentage += SalesSegment."Sales %";
                    UNTIL SalesSegment.NEXT() = 0;
                UpdateUnassignedPercentage("Customer No.", "Sales %");
                IF "Sales %" + TotalSalesPercentage > 100 THEN
#pragma warning disable AL0606
                    ERROR('Total Sales % for Sales Order No. ' + "Sales Order No." + ' cannot exceed 100');
#pragma warning restore AL0606
            end;

        }
        field(7; Amount; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Customer No.", "Industry Group Code", "Sales Order No.", "Sales Invoice No.")
        {
            Clustered = true;
        }
        key(Key2; "Posted Sales Invoice No.")
        {
        }
    }

    fieldgroups
    {
    }
    procedure UpdateUnassignedPercentage(CustNo: Code[20]; TotalSalesPercentage: Decimal)
    var
        TotalPercentage: Decimal;
    begin
        TotalPercentage := FindTotalSalesPercentage(CustNo, "Sales Order No.", "Sales Invoice No.") + TotalSalesPercentage;

        IF (TotalPercentage <= 100) THEN
            InsertUnassignedPercentage(CustNo, "Sales Order No.", "Sales Invoice No.", (100 - TotalPercentage));
    end;

    local procedure InsertUnassignedPercentage(CustNo: Code[20]; SalesOrderNo: Code[20]; SalesInvNo: Code[20]; SalesPercentage: Decimal)
    var
        SalesSegment, SalesSegment1 : Record "Sales Segment";
    begin
        SalesSegment1.RESET();
        SalesSegment1.SETRANGE("Customer No.", CustNo);
        IF SalesOrderNo <> '' THEN
            SalesSegment1.SETRANGE("Sales Order No.", SalesOrderNo);
        SalesSegment1.SETRANGE("Sales Invoice No.", SalesInvNo);
        SalesSegment1.SETRANGE("Industry Group Code", 'UNASSIGNED');
        IF NOT SalesSegment1.FINDFIRST() THEN BEGIN
            IF SalesPercentage > 0 THEN BEGIN
                SalesSegment.INIT();
                SalesSegment."Customer No." := CustNo;
                SalesSegment."Sales Order No." := SalesOrderNo;
                SalesSegment."Sales Invoice No." := SalesInvNo;
                SalesSegment."Industry Group Code" := 'UNASSIGNED';
                SalesSegment."Sales %" := SalesPercentage;
                SalesSegment.INSERT();
            END;
        END ELSE BEGIN
            SalesSegment1."Sales %" := SalesPercentage;
            SalesSegment1.MODIFY();
        END;
    end;

    procedure FindTotalSalesPercentage(CustNo: Code[20]; SalesOrderNo: Code[20]; SalesInvoiceNo: Code[20]) TotalPercentage: Decimal
    var
        SalesSegment: Record "Sales Segment";
    begin
        SalesSegment.RESET();
        SalesSegment.SETRANGE("Customer No.", CustNo);
        IF SalesOrderNo <> '' THEN
            SalesSegment.SETRANGE("Sales Order No.", SalesOrderNo);
        SalesSegment.SETRANGE("Sales Invoice No.", SalesInvoiceNo);
        SalesSegment.SETFILTER("Industry Group Code", '<>%1', 'UNASSIGNED');
        IF SalesSegment.FINDSET(false) THEN
            REPEAT
                TotalPercentage += SalesSegment."Sales %";
            UNTIL SalesSegment.NEXT() = 0;
    end;
}

