namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Requisition;

pageextension 50078 OrderPlanning extends "Order Planning"
{
    layout
    {
        addafter("No.")
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number of the requisition worksheet line.';
            }
        }
    }
}

