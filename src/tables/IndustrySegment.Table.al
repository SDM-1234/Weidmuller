namespace WM.WeidmullerDEV;

using Microsoft.Sales.Customer;
    
table 50004 "Industry Segment"
{

    Caption = 'Industry Segment';
    DrillDownPageID = "Industry Segments";

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            NotBlank = true;
            TableRelation = Customer;
        }
        field(2; "Industry Group Code"; Code[10])
        {
            Caption = 'Industry Group Code';
            NotBlank = true;
            TableRelation = "Industry Segment Group";
        }
        field(3; "Industry Group Description"; Text[50])
        {
            CalcFormula = Lookup("Industry Segment Group".Description WHERE(Code = FIELD("Industry Group Code")));
            Caption = 'Industry Group Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Customer Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Customer No.")));
            Caption = 'Customer Name';
            Editable = false;
        }
        field(5; "Sales %"; Decimal)
        {

            trigger OnValidate()
            var
                IndustrySegment: Record "Industry Segment";
                TotalSalesPercentage: Decimal;
            begin
                IndustrySegment.RESET();
                IndustrySegment.SETRANGE("Customer No.", "Customer No.");
                IndustrySegment.SETFILTER("Industry Group Code", '<>%1&<>%2', "Industry Group Code", 'UNASSIGNED');
                IF IndustrySegment.FINDSET(false) THEN
                    REPEAT
                        TotalSalesPercentage += IndustrySegment."Sales %";
                    UNTIL IndustrySegment.NEXT() = 0;
                UpdateUnassignedPercentage("Customer No.");
                IF "Sales %" + TotalSalesPercentage > 100 THEN
                    ERROR('Total Sales % for customer ' + "Customer No." + ' cannot exceed 100');
            end;
        }
        field(6; Amount; Decimal)
        {
            Description = 'For report';
        }
        field(7; Counter; Integer)
        {
            Description = 'For report';
        }
    }

    keys
    {
        key(Key1; "Customer No.", "Industry Group Code")
        {
            Clustered = true;
        }
        key(Key2; "Industry Group Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TouchCust("Customer No.");
    end;

    trigger OnInsert()
    begin
        TouchCust("Customer No.");
    end;

    trigger OnModify()
    begin
        TouchCust("Customer No.");
    end;

    trigger OnRename()
    begin
        IF xRec."Customer No." = "Customer No." THEN
            TouchCust("Customer No.")
        ELSE BEGIN
            TouchCust("Customer No.");
            TouchCust(xRec."Customer No.");
        END;
    end;

    var
        Cust: Record Customer;

    local procedure TouchCust(CustNo: Code[20])
    begin
        Cust.LOCKTABLE();
        Cust.GET(CustNo);
        Cust."Last Date Modified" := TODAY;
        Cust.MODIFY();
    end;

    procedure FindTotalSalesPercentage(CustNo: Code[20]) TotalPercentage: Decimal
    var
        IndustrySegment: Record "Industry Segment";
    begin
        IndustrySegment.RESET();
        IndustrySegment.SETRANGE("Customer No.", CustNo);
        IndustrySegment.SETFILTER("Industry Group Code", '<>%1', 'UNASSIGNED');
        IF IndustrySegment.FINDSET(false) THEN
            REPEAT
                TotalPercentage += IndustrySegment."Sales %";
            UNTIL IndustrySegment.NEXT() = 0;
    end;

    procedure UpdateUnassignedPercentage(CustNo: Code[20])
    var
        IndustrySegment: Record "Industry Segment";
        TotalSalesPercentage: Decimal;
    begin
        IndustrySegment.RESET();
        IndustrySegment.SETRANGE("Customer No.", CustNo);
        IndustrySegment.SETRANGE("Industry Group Code", 'UNASSIGNED');
        IF IndustrySegment.FINDFIRST() THEN BEGIN
            TotalSalesPercentage := 100 - FindTotalSalesPercentage(CustNo);
            IF (TotalSalesPercentage < 100) THEN BEGIN
                IndustrySegment."Sales %" := TotalSalesPercentage;
                IndustrySegment.MODIFY();
            END ELSE
                IndustrySegment."Sales %" := TotalSalesPercentage;
            IndustrySegment.MODIFY();
        END;
    end;

    procedure CountIndustrySegments(CustNo: Code[20]) TotalCount: Integer
    var
        IndustrySegment: Record "Industry Segment";
    begin
        IndustrySegment.RESET();
        IndustrySegment.SETRANGE("Customer No.", CustNo);
        IndustrySegment.SETFILTER("Industry Group Code", '<>%1', 'UNASSIGNED');
        IF IndustrySegment.FINDSET() THEN
            TotalCount := IndustrySegment.COUNT;
    end;
}