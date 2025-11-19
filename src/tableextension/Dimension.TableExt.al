namespace WM.WeidmullerDEV;

using Microsoft.Finance.Dimension;
    
tableextension 50011 Dimension extends Dimension
{
    fields
    {
        field(50000; "Mandatory for Item"; Boolean)
        {
            Caption = 'Mandatory for Item';
            DataClassification = CustomerContent;
        }
    }
}
