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
                ToolTip = 'Specifies the date when the order was created.';
            }
            field(Validity; Rec.Validity)
            {
                Editable = false;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Validity field.';
            }
        }
    }
    actions
    {
    }
}

