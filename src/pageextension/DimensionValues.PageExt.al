namespace WM.WeidmullerDEV;

using Microsoft.Finance.Dimension;

pageextension 50075 DimensionValues extends "Dimension Values"
{
    layout
    {
        addafter(Code)
        {
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description field.';
            }
        }
    }
}

