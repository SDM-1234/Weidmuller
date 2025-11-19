namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Item.Attribute;
    
tableextension 50014 ItemAttribute extends "Item Attribute"
{
    fields
    {
        field(50000; Mandatory; Boolean)
        {
            Caption = 'Mandatory';
            DataClassification = CustomerContent;
        }
    }
}
