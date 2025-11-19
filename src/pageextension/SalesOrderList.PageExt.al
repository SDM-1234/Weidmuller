namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
pageextension 50109 SalesOrderList extends "Sales Order List"
{
    layout
    {

        addafter("Salesperson Code")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }
            field(Validity; Rec.Validity)
            {
                Editable = false;
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}

