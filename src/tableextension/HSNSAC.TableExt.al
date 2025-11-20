namespace WM.WeidmullerDEV;

using Microsoft.Finance.GST.Base;
    
tableextension 50016 HSNSAC extends "HSN/SAC"
{
    fields
    {
        field(50000; Hide; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}

