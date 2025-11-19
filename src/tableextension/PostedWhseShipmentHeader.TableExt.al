namespace WM.WeidmullerDEV;

using Microsoft.Warehouse.History;
    
tableextension 50052 PostedWhseShipmentHeader extends "Posted Whse. Shipment Header"
{
    fields
    {
        field(50001; "Time of Removal"; Time)
        {
            Caption = 'Time of Removal';
            Description = 'SE-SE859';
        }
        field(50002; "LR/RR No."; Code[20])
        {
            Caption = 'LR/RR No.';
            Description = 'SE-SE859';
        }
        field(50003; "LR/RR Date"; Date)
        {
            Caption = 'LR/RR Date';
            Description = 'SE-SE859';
        }
        field(50004; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            Description = 'SE-SE859';
        }
        field(50005; "Date of Removal"; Date)
        {
            Description = 'SE-SE859';
        }
        field(50006; "Total Weight"; Decimal)
        {
            Description = 'SE-SE859';
        }
        field(50007; "No Of Box"; Integer)
        {
            Description = 'SE-SE859';
        }
    }
}

