namespace WM.WeidmullerDEV;

using Microsoft.Purchases.Document;
    
pageextension 50077 PurchInvoiceSubform extends "Purch. Invoice Subform"
{


    layout
    {
        addafter("No.")
        {
            field("Document Type"; Rec."Document Type")
            {
                Editable = false;
                ApplicationArea = all;
            }
        }
    }
}

