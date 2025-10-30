pageextension 50040 ItemCard extends "Item Card"
{
    layout
    {
        addafter(Inventory)
        {
            field("Inventory-Nippon"; Rec."Inventory-Nippon")
            {
                Caption = 'Inventory-FG';
                DecimalPlaces = 0 : 5;
                Importance = Promoted;
                ToolTip = 'Specifies the value of the Inventory-FG field.';
                ApplicationArea = All;
            }
            field("Inventory-Quarantine"; Rec."Inventory-Quarantine")
            {
                DecimalPlaces = 0 : 5;
                Importance = Promoted;
                ToolTip = 'Specifies the value of the Inventory-Quarantine field.';
                ApplicationArea = All;
            }
        }
        addafter(PreventNegInventoryDefaultNo)
        {
            field("EAN No."; Rec."EAN No.")
            {
                ToolTip = 'Specifies the value of the EAN No. field.';
                ApplicationArea = All;
            }
            field("Marketing Status"; Rec."Marketing Status")
            {
                ToolTip = 'Specifies the value of the Marketing Status field.';
                ApplicationArea = All;
            }
            field(Notification; Rec.Notification)
            {
                ToolTip = 'Specifies the value of the Notification field.';
                ApplicationArea = All;
            }
        }
        addafter("Lead Time Calculation")
        {
            field("Item Type"; Rec."Item Type")
            {
                ToolTip = 'Specifies the value of the Item Type field.';
                ApplicationArea = All;
            }
            field(Dangerous; Rec.Dangerous)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Dangerous field.', Comment = '%';
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        IF Rec."Reordering Policy" = Rec."Reordering Policy"::"Fixed Reorder Qty." THEN
            Rec.TESTFIELD("Order Multiple");
    end;
}

