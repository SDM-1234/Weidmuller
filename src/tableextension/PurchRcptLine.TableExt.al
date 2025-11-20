namespace WM.WeidmullerDEV;

using Microsoft.Purchases.History;
    
tableextension 50007 PurchRcptLine extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50000; Weight; Decimal)
        {
            Description = 'SE-E859';
        }
        field(50002; "Total No of Boxes"; Integer)
        {
            Description = 'SE-E859';
        }
        field(50003; "Vendor Ship No."; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = Min("Purch. Rcpt. Header"."Vendor Shipment No." WHERE("No." = FIELD("Document No.")));

        }
    }
}

