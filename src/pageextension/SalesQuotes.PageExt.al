namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
pageextension 50108 SalesQuotes extends "Sales Quotes"
{
    layout
    {
        addlast(Control1)
        {
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
    actions
    {
    }
}

