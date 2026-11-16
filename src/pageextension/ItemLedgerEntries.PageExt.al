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
                ToolTip = 'Specifies the value of the External Document No. field.';
            }
        }
        addafter("External Document No.")
        {
            field("Bill of Entry No."; Rec."Bill of Entry No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Bill of Entry number for this item ledger entry.';
            }
            field("Bill of Entry Date"; Rec."Bill of Entry Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Bill of Entry date for this item ledger entry.';
            }
        }
    }
}
