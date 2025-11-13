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
    }
    keys
    {
        key(WEKey1; "Location Code", "Item No.")
        {
        }
    }
}

