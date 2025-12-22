namespace WM.WeidmullerDEV;

using Microsoft.Purchases.History;
    
pageextension 50015 PostedPurchaseInvoices extends "Posted Purchase Invoices"
{
    layout
    {
        addafter("Pay-to Contact")
        {
            field("Currency Factor"; Rec."Currency Factor")
            {
                ToolTip = 'Specifies the value of the Currency Factor field.';
                ApplicationArea = All;
            }
            field("Amount(LCY)"; AmountLCY)
            {
                Caption = 'Amount(LCY)';
                ToolTip = 'Specifies the value of the Amount(LCY) field.';
                ApplicationArea = All;
            }
        }
    }

    var
        AmountLCY: Decimal;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    trigger OnAfterGetRecord()
    begin

        //ZE_LIJO 08.08.2019
        //++
        Rec.CALCFIELDS(Amount);
        IF Rec."Currency Factor" <> 0 THEN
            AmountLCY := (1 / Rec."Currency Factor") * Rec.Amount
        ELSE
            AmountLCY := Rec.Amount;
        //--

    end;
}

