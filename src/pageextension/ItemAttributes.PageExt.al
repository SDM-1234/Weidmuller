namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Item.Attribute;
    
pageextension 50045 ItemAttributes extends "Item Attributes"
{
    layout
    {
        addafter("Type")
        {
            field(Mandatory; Rec."Mandatory")
            {
                ToolTip = 'Specifies whether the attribute is mandatory.';
                ApplicationArea = All;
            }
        }
    }
}
