pageextension 50049 SalesLines extends "Sales Lines"
{

    layout
    {

        addafter("Location Code")
        {

            field("Order Date"; SH."Order Date")
            {
                Caption = 'Order Date';
                ApplicationArea = All;
            }
            field("GST Bill-to State Code"; SH."GST Bill-to State Code")
            {
                Caption = 'GST Bill-to State Code';
                ApplicationArea = All;
            }
            field("GST Ship-to State Code"; SH."GST Ship-to State Code")
            {
                Caption = 'GST Ship-to State Code';
                ApplicationArea = All;
            }

        }
    }

    var
        Item: Record Item;
        SH: Record "Sales Header";
        InventoryFG: Decimal;


    trigger OnAfterGetRecord()
    begin
        CLEAR(InventoryFG);
        IF Item.GET(Rec."No.") THEN BEGIN
            Item.CALCFIELDS(Inventory, "Inventory-Nippon");
            //InventoryStock := Item.Inventory;
            InventoryFG := Item."Inventory-Nippon";
        END;
        IF SH.GET(Rec."Document Type", Rec."Document No.") THEN;
    end;

}
