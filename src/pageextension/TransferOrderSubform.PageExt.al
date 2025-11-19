namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Transfer;

pageextension 50029 TransferOrderSubform extends "Transfer Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("Inspection Reason Code"; Rec."Inspection Reason Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Inspection Reason Code field.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}