pageextension 50061 PurchaseOrder extends "Purchase Order"
{

    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("Receiving No."; Rec."Receiving No.")
            {
                ApplicationArea = All;
            }

            field("Receiving No. Series"; Rec."Receiving No. Series")
            {
                ApplicationArea = All;
            }
        }
    }
}

