namespace WM.WeidmullerDEV;

using Microsoft.Sales.History;
    
tableextension 50001 SalesShipmentHeader extends "Sales Shipment Header"
{
    fields
    {


        field(50000; "Package No."; Code[20])
        {
        }
        field(50001; "Total No of Boxes"; Integer)
        {
            Description = 'SE-E859';
        }
        field(50005; "WarehouseShip No."; Code[20])
        {
            Description = 'SE-E859';
        }
    }
}

