namespace WM.WeidmullerDEV;

using Microsoft.Finance.GST.Base;
using Microsoft.Finance.Reports;
using Microsoft.Finance.TaxEngine.TaxTypeHandler;
using Microsoft.Purchases.Document;
    
tableextension 50032 PurchaseLine extends "Purchase Line"
{
    fields
    {
        field(50000; Weight; Decimal)
        {
            Description = 'SE-E859';
        }
        field(50001; "Demand Order No."; Code[20])
        {
            Caption = 'Demand Order No.';
            Description = 'SE-E859';
            Editable = false;
        }
    }
    keys
    {
        key(WEKey1; "Document Type", "Pay-to Vendor No.")
        {
            Enabled = false;
        }
    }

    procedure GetGSTAmounts(): Decimal
    var
        GSTSetup: Record "GST Setup";
        TaxTransactionValue: Record "Tax Transaction Value";
        OrderConfReport: Report "Order Confirmation GST";
        SGSTAmt, CGSTAmt, IGSTAmt, CessAmount : Decimal;
    begin
        GSTSetup.Get();
        TaxTransactionValue.Reset();
        TaxTransactionValue.SetRange("Tax Record ID", Rec.RecordId);
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
        exit(SGSTAmt + CGSTAmt + IGSTAmt + CessAmount);
    end;

    var
        IGSTLbl: Label 'IGST';
        SGSTLbl: Label 'SGST';
        CGSTLbl: Label 'CGST';

}

