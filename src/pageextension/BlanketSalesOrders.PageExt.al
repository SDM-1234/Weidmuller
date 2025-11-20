namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
pageextension 50111 BlanketSalesOrders extends "Blanket Sales Orders"
{
    layout
    {

        modify("External Document No.")
        {
            Caption = 'PO No.';
        }

    }
}

