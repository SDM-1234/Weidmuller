namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Ledger;
    
tableextension 50027 ItemLedgerEntry extends "Item Ledger Entry"
{
    fields
    {
        field(50000; "Quality Inspection No."; Code[20])
        {
            Caption = 'Quality Inspection No.';
            ToolTip = 'Specifies the quality inspection number for the transfer order.';
            DataClassification = ToBeClassified;
        }
        field(50001; "Bill of Entry No."; Code[35])
        {
            Caption = 'Bill of Entry No.';
            DataClassification = CustomerContent;
        }
        field(50002; "Bill of Entry Date"; Date)
        {
            Caption = 'Bill of Entry Date';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(WEKey1; "Location Code", "Item No.")
        {
        }
    }
}
