namespace WM.WeidmullerDEV;

using Microsoft.Sales.History;
    
pageextension 50007 PostedSalesInvoiceSubform extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter(Control9)
        {
            field("OC No"; Rec."OC No")
            {
                ToolTip = 'Specifies the value of the OC No field.';
                ApplicationArea = All;
            }


            field("GST Place of Supply"; Rec."GST Place of Supply")
            {
                ToolTip = 'Specifies the value of the GST Place of Supply field.';
                ApplicationArea = All;
            }
            field("GST Group Type"; Rec."GST Group Type")
            {
                ToolTip = 'Specifies the value of the GST Group Type field.';
                ApplicationArea = All;
            }
            field("Shipment No."; Rec."Shipment No.")
            {
                ToolTip = 'Specifies the value of the Shipment No. field.';
                ApplicationArea = All;
            }
        }
    }
}

