namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Journal;
using Microsoft.Inventory.Ledger;
    
pageextension 50048 ItemReclassJournal extends "Item Reclass. Journal"
{
    layout
    {
        modify("Item No.")
        {
            trigger OnAfterValidate()
            begin
                IF rEC."Location Code" <> '' THEN
                    UpdateInventory();
            end;
        }
        modify("Location Code")
        {
            trigger OnAfterValidate()
            begin
                IF xRec."Location Code" <> Rec."Location Code" THEN
                    UpdateInventory();

            end;
        }
        addafter("Item No.")
        {
            field("EAN No."; Rec."EAN No.")
            {
                ApplicationArea = All;

            }
            field(Inventory; Inventory)
            {
                ApplicationArea = All;

            }
        }
    }

    var
        Inventory: Decimal;

    trigger OnAfterGetRecord()
    BEGIN
        UpdateInventory();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CLEAR(Inventory);
    end;

    trigger OnOpenPage()
    begin
        UpdateInventory();
    end;

    local procedure UpdateInventory()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        CLEAR(Inventory);
        ItemLedgerEntry.RESET();
        ItemLedgerEntry.SETCURRENTKEY("Item No.", Open, "Variant Code", Positive, "Location Code", "Posting Date");
        ItemLedgerEntry.SETRANGE("Item No.", Rec."Item No.");
        ItemLedgerEntry.SETRANGE("Location Code", Rec."Location Code");
        ItemLedgerEntry.SETFILTER("Remaining Quantity", '<>%1', 0);
        ItemLedgerEntry.CALCSUMS("Remaining Quantity");
        Inventory := ItemLedgerEntry."Remaining Quantity";
    end;
}

