namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
pageextension 50058 SalesInvoiceSubform extends "Sales Invoice Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("OC No"; Rec."OC No")
            {
                ToolTip = 'Specifies the value of the OC No field.';
                ApplicationArea = All;
            }
        }
    }
    actions
    {

    }
}

