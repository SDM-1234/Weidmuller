namespace WM.WeidmullerDEV;

using Microsoft.CRM.Contact;
    
tableextension 50036 Contact extends Contact
{
    fields
    {
        field(50000; "Resigned - Left Company"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}

