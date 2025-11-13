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
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}