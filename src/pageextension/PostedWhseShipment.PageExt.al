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
                ToolTip = 'Specifies the value of the Time of Removal field.';
            }
            field("LR/RR No."; Rec."LR/RR No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LR/RR No. field.';
            }
            field("LR/RR Date"; Rec."LR/RR Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LR/RR Date field.';
            }
            field("Vehicle No."; Rec."Vehicle No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vehicle No. field.';
            }
            field("Date of Removal"; Rec."Date of Removal")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Date of Removal field.';
            }
            field("Total Weight"; Rec."Total Weight")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Total Weight field.';
            }
            field("No Of Box"; Rec."No Of Box")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No Of Box field.';
            }
        }
    }
}

