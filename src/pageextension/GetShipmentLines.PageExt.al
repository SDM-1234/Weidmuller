namespace WM.WeidmullerDEV;

using Microsoft.Sales.History;
    
pageextension 50083 GetShipmentLines extends "Get Shipment Lines"
{
    layout
    {
        addafter("Unit of Measure")
        {
            field("Order No."; rec."Order No.")
            {
                ToolTip = 'Specifies the value of the Order No. field.';
                ApplicationArea = All;
            }
        }
    }
}

