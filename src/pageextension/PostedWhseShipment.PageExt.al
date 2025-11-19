namespace WM.WeidmullerDEV;

using Microsoft.Warehouse.History;
    
pageextension 50010 PostedWhseShipment extends "Posted Whse. Shipment"
{
    layout
    {
        addafter("Location Code")
        {
            field("Time of Removal"; Rec."Time of Removal")
            {
                ApplicationArea = All;
            }
            field("LR/RR No."; Rec."LR/RR No.")
            {
                ApplicationArea = All;
            }
            field("LR/RR Date"; Rec."LR/RR Date")
            {
                ApplicationArea = All;
            }
            field("Vehicle No."; Rec."Vehicle No.")
            {
                ApplicationArea = All;
            }
            field("Date of Removal"; Rec."Date of Removal")
            {
                ApplicationArea = All;
            }
            field("Total Weight"; Rec."Total Weight")
            {
                ApplicationArea = All;
            }
            field("No Of Box"; Rec."No Of Box")
            {
                ApplicationArea = All;
            }
        }
    }
}

