namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Item;
    
pageextension 50044 ItemList extends "Item List"
{
    Caption = 'Article No';
    layout
    {
        addafter("Item Category Code")
        {
            field(Inventory; Rec.Inventory)
            {
                ApplicationArea = ALl;
                ToolTip = 'Specifies the total quantity of the item that is currently in inventory at all locations.';
            }
            field("Inventory-Nippon"; Rec."Inventory-Nippon")
            {
                Caption = 'Inventory-FG';
                DecimalPlaces = 0 : 5;
                Importance = Promoted;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Inventory-FG field.';
            }
            field("Inventory-Quarantine"; Rec."Inventory-Quarantine")
            {
                DecimalPlaces = 0 : 5;
                Importance = Promoted;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Inventory-Quarantine field.';

            }
            field("Safety Stock Quantity"; Rec."Safety Stock Quantity")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies a quantity of stock to have in inventory to protect against supply-and-demand fluctuations during replenishment lead time.';

            }
            field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies how many units of the item are inbound on purchase orders, meaning listed on outstanding purchase order lines.';

            }
            field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies how many units of the item are allocated to sales orders, meaning listed on outstanding sales orders lines.';

            }


            field("Minimum Order Quantity"; Rec."Minimum Order Quantity")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies a minimum allowable quantity for an item order proposal.';

            }
            field("GST Group Code"; Rec."GST Group Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies an unique identifier for the GST group code used to calculate and post GST.';

            }
            field("HSN/SAC Code"; Rec."HSN/SAC Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies an unique identifier for the type of HSN or SAC that is used to calculate and post GST.';

            }
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';

            }
            field("Net Weight"; Rec."Net Weight")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the net weight of the item.';

            }
            field("Gross Weight"; Rec."Gross Weight")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the gross weight of the item.';

            }
            field("EAN No."; Rec."EAN No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the EAN No. field.';

            }
            field("Marketing Status"; Rec."Marketing Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Marketing Status field.';

            }
            field(Notification; Rec.Notification)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Notification field.';

            }
            field("Item Type"; Rec."Item Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Item Type field.';

            }
        }
    }
}

