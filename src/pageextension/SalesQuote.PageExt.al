namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
pageextension 50051 SalesQuote extends "Sales Quote"
{
    layout
    {
        addlast(General)
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ToolTip = 'Specifies the value of the Posting Date field.';
                ApplicationArea = All;
            }

            field("Enquiry No."; Rec."Enquiry No.")
            {
                ToolTip = 'Specifies the value of the Enquiry No. field.';
                ApplicationArea = All;
            }
            field(Validity; Rec.Validity)
            {
                ToolTip = 'Specifies the value of the Validity field.';
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.UpdatePONo();
    end;
}


