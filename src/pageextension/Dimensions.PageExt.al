namespace WM.WeidmullerDEV;

using Microsoft.Finance.Dimension;
    
pageextension 50019 Dimensions extends Dimensions
{
    layout
    {
        addafter(Blocked)
        {
            field("Mandatory for Item"; Rec."Mandatory for Item")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Mandatory for Item field.', Comment = '%';
            }
        }
    }
}
