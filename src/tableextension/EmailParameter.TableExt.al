namespace WM.WeidmullerDEV;

using System.EMail;
    
tableextension 50034 EmailParameter extends "Email Parameter"
{
    fields
    {
        field(50008; CC; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; BCC; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }
}

