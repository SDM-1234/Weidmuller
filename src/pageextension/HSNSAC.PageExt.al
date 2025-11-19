namespace WM.WeidmullerDEV;

using Microsoft.Finance.GST.Base;
    
pageextension 50020 HSNSAC extends "HSN/SAC"
{

    //Unsupported feature: Property Insertion (SourceTableView) on "HSNSAC(Page 16411)".

    layout
    {
        addafter("GST Group Code")
        {
            field(Hide; Rec.Hide)
            {
                ApplicationArea = all;
            }
        }
    }
}

