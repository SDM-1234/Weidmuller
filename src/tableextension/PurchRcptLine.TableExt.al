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
        field(50003; "Vendor Ship No."; Code[35])
        {
            FieldClass = FlowField;
            CalcFormula = Min("Purch. Rcpt. Header"."Vendor Shipment No." WHERE("No." = FIELD("Document No.")));
            Caption = 'Vendor Invoice No.';
        }
        field(50004; "Bill of Entry No."; Code[35])
        {
            Caption = 'Bill of Entry No.';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purch. Rcpt. Header"."Bill of Entry No." WHERE("No." = FIELD("Document No.")));
        }
        field(50005; "Bill of Entry Date"; Date)
        {
            Caption = 'Bill of Entry Date';
            FieldClass = FlowField;
            CalcFormula = Lookup("Purch. Rcpt. Header"."Bill of Entry Date" WHERE("No." = FIELD("Document No.")));
        }
    }
}
