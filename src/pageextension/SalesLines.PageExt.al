namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Item;
using Microsoft.Sales.Document;

pageextension 50049 SalesLines extends "Sales Lines"
{

    layout
    {

        addafter("Location Code")
        {

            field(InventoryFG; InventoryFG)
            {
                Caption = 'Inventory - FG';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Inventory - FG field.';
            }

            field("Order Date"; SH."Order Date")
            {
                Caption = 'Order Date';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Order Date field.';
            }
            field("GST Bill-to State Code"; SH."GST Bill-to State Code")
            {
                Caption = 'GST Bill-to State Code';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the GST Bill-to State Code field.';
            }
            field("GST Ship-to State Code"; SH."GST Ship-to State Code")
            {
                Caption = 'GST Ship-to State Code';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the GST Ship-to State Code field.';
            }

        }
    }

    var
        Item: Record Item;
        SH: Record "Sales Header";
        InventoryFG: Decimal;
        InventoryStock: Decimal;

    trigger OnAfterGetRecord()
    begin
        CLEAR(InventoryFG);
        CLEAR(InventoryStock);
        IF Item.GET(Rec."No.") THEN BEGIN
            Item.CALCFIELDS(Inventory, "Inventory-Nippon");
            InventoryStock := Item.Inventory;
            InventoryFG := Item."Inventory-Nippon";
        END;
        IF SH.GET(Rec."Document Type", Rec."Document No.") THEN;
    end;

}
