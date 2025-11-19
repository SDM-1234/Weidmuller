namespace WM.WeidmullerDEV;

using Microsoft.Sales.History;
    
tableextension 50003 SalesInvoiceHeader extends "Sales Invoice Header"
{
    fields
    {

        field(50001; "Total No of Boxes"; Integer)
        {
            Description = 'SE-E859';
        }
        field(50002; "Date of Removal"; Date)
        {
            Description = 'SE-E859';
        }
        field(50003; "Total Weight"; Decimal)
        {
            Description = 'SE-E859';
        }
    }
    keys
    {
    }

    procedure AmountToCustomer(): Decimal
    var
        SalesInvLIne: Record "Sales Invoice Line";
        AmtToCustCU: Codeunit "Amount To Customer";
        CGSTLineAmount: Decimal;
        SGSTLineAmount: Decimal;
        IGSTLineAmount: Decimal;
        CESSLineAmount: Decimal;
        TotGstAmt: Decimal;
    begin
        SalesInvLIne.SetFilter(Type, '<>%1', SalesInvLIne.Type::" ");
        SalesInvLIne.SetRange("Document No.", Rec."No.");
        if SalesInvLIne.FindSet(false) then
            repeat
                CGSTLineAmount := 0;
                SGSTLineAmount := 0;
                IGSTLineAmount := 0;
                CESSLineAmount := 0;

                AmtToCustCU.GetGSTValueForLine(
                    SalesInvLIne."Document No.",
                    SalesInvLIne."Line No.",
                    CGSTLineAmount,
                    SGSTLineAmount,
                    IGSTLineAmount,
                    CESSLineAmount);

                TotGstAmt += CGSTLineAmount + SGSTLineAmount + IGSTLineAmount + CESSLineAmount;
            until SalesInvLIne.Next() = 0;
        Rec.CalcFields("Amount");
        exit(TotGstAmt + Rec.Amount);
    end;
}

