namespace WM.WeidmullerDEV;

using Microsoft.Sales.History;
    
tableextension 50004 SalesInvoiceLine extends "Sales Invoice Line"
{
    fields
    {
        field(50017; "OC No"; Code[20])
        {
            Description = '//SE-E859';
        }
        field(50070; "Bill-to Customer Name"; Text[100])
        {
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Bill-to Customer No.")));
            Caption = 'Bill-to Customer Name';
            Description = 'ZT0207';
            FieldClass = FlowField;
        }
    }
    procedure AmountToCustomer(): Decimal
    var
        AmtToCustCU: Codeunit "Amount To Customer";
        CGSTLineAmount: Decimal;
        SGSTLineAmount: Decimal;
        IGSTLineAmount: Decimal;
        CESSLineAmount: Decimal;
    begin
        CGSTLineAmount := 0;
        SGSTLineAmount := 0;
        IGSTLineAmount := 0;
        CESSLineAmount := 0;

        AmtToCustCU.GetGSTValueForLine(
            "Document No.",
            "Line No.",
            CGSTLineAmount,
            SGSTLineAmount,
            IGSTLineAmount,
            CESSLineAmount);

        Exit("Line Amount" + CGSTLineAmount + SGSTLineAmount + IGSTLineAmount + CESSLineAmount);
    end;

    procedure GstAmount(): Decimal
    var
        AmtToCustCU: Codeunit "Amount To Customer";
        CGSTLineAmount: Decimal;
        SGSTLineAmount: Decimal;
        IGSTLineAmount: Decimal;
        CESSLineAmount: Decimal;
    begin
        CGSTLineAmount := 0;
        SGSTLineAmount := 0;
        IGSTLineAmount := 0;
        CESSLineAmount := 0;

        AmtToCustCU.GetGSTValueForLine(
            "Document No.",
            "Line No.",
            CGSTLineAmount,
            SGSTLineAmount,
            IGSTLineAmount,
            CESSLineAmount);

        Exit(CGSTLineAmount + SGSTLineAmount + IGSTLineAmount + CESSLineAmount);
    end;
}

