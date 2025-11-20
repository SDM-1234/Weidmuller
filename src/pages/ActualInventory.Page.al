namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Ledger;
    
page 50012 "Actual Inventory"
{
    PageType = List;
    SourceTable = "Item Ledger Entry";
    SourceTableTemporary = true;
    ApplicationArea = All;
    Caption = 'Actual Inventory';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ToolTip = 'Specifies the item number for which the actual inventory is displayed.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ToolTip = 'Specifies the location code for the item.';
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    Caption = 'Remaining Quantity';
                    ToolTip = 'Specifies the remaining quantity of the item in the location.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        EntryNo := 0;
        IF ItemLedgerEntry.FINDLAST() THEN
            EntryNo := ItemLedgerEntry."Entry No.";
        ItemLedgerEntry.RESET();
        ItemLedgerEntry.SETCURRENTKEY("Location Code", "Item No.");
        ItemLedgerEntry.SETFILTER("Location Code", '<>%1', '');
        ItemLedgerEntry.SETFILTER("Item No.", '<>%1', '');
        ItemLedgerEntry.SETFILTER("Remaining Quantity", '<>%1', 0);
        IF ItemLedgerEntry.FINDSET(false) THEN
            REPEAT
                IF LocationCode <> ItemLedgerEntry."Location Code" THEN BEGIN
                    CLEAR(ItemNo);
                    IF ItemNo <> ItemLedgerEntry."Item No." THEN BEGIN
                        EntryNo += 1;
                        InsertTemLedgeEntry(ItemLedgerEntry);
                    END;
                END ELSE
                    IF ItemNo <> ItemLedgerEntry."Item No." THEN BEGIN
                        EntryNo += 1;
                        InsertTemLedgeEntry(ItemLedgerEntry);
                    END ELSE
                        UpdateTempLedgerEntry(ItemLedgerEntry);
                ItemNo := ItemLedgerEntry."Item No.";
                LocationCode := ItemLedgerEntry."Location Code";
            UNTIL ItemLedgerEntry.NEXT() = 0;
        CurrPage.UPDATE();
    end;

    var
        LocationCode: Code[20];
        ItemNo: Code[20];
        EntryNo: Integer;

    local procedure InsertTemLedgeEntry(var ItemLedgerEntry: Record "Item Ledger Entry")
    begin
        Rec.INIT();
        Rec."Entry No." := EntryNo;
        Rec."Location Code" := ItemLedgerEntry."Location Code";
        Rec."Item No." := ItemLedgerEntry."Item No.";
        Rec."Remaining Quantity" := ItemLedgerEntry."Remaining Quantity";
        Rec.INSERT();
    end;

    local procedure UpdateTempLedgerEntry(var ItemLedgerEntry: Record "Item Ledger Entry")
    begin
        Rec."Remaining Quantity" += ItemLedgerEntry."Remaining Quantity";
        Rec.MODIFY();

    end;
}

