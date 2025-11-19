namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Location;

pageextension 50017 LocationList extends "Location List"
{
    layout
    {
        addafter(Name)
        {
            field("Name 2"; Rec."Name 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Name 2 field.';
            }
        }
    }
}

