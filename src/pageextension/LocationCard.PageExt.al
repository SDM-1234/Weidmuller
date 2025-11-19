namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Location;
    
pageextension 50080 LocationCard extends "Location Card"
{
    layout
    {
        addafter(Name)
        {
            field("Name 2"; Rec."Name 2")
            {
                ApplicationArea = All;
            }
        }
    }
}

