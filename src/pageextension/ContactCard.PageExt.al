namespace WM.WeidmullerDEV;

using Microsoft.CRM.Contact;
    
pageextension 50060 ContactCard extends "Contact Card"
{
    layout
    {
        addlast(General)
        {
            field("Resigned - Left Company"; Rec."Resigned - Left Company")
            {
                ToolTip = 'Specifies the value of the Resigned - Left Company field.';
                ApplicationArea = All;
            }
        }
    }
}

