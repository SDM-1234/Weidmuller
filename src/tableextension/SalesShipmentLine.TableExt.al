namespace WM.WeidmullerDEV;

using Microsoft.Sales.History;
    
tableextension 50002 SalesShipmentLine extends "Sales Shipment Line"
{
    fields
    {
        field(50000; "Package No."; Code[20])
        {
            Description = 'SE-E859';
        }
        field(50001; Weight; Decimal)
        {
            Description = 'SE-E859';
        }
    }
    keys
    {
        key(SK1; "Bin Code")
        {
        }
    }

}

