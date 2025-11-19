namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Ledger;
    
pageextension 50046 ItemLedgerEntries extends "Item Ledger Entries"
{
    layout
    {
        addafter(Quantity)
        {
            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = All;
            }
        }
    }
}

