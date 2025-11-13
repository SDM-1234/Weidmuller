tableextension 50010 PurchCrMemoHdr extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(50000; "WE Your Reference"; Code[100])
        {
            Caption = 'Your Reference';
            DataClassification = ToBeClassified;
        }
        field(50001; "No. of Boxes"; Integer)
        {
            Caption = 'No. of Boxes';
            DataClassification = ToBeClassified;
            Tooltip = 'No. of Boxes';
        }
        field(50002; "Box Dimension"; Text[100])
        {
            Caption = 'Box Dimension';
            DataClassification = ToBeClassified;
            Tooltip = 'Box Dimension';
        }
        field(50003; "Gross Weight"; Text[50])
        {
            Caption = 'Gross Weight';
            DataClassification = ToBeClassified;
            Tooltip = 'Gross Weight';
        }
        field(50004; "Net Weight"; Text[50])
        {
            Caption = 'Net Weight';
            DataClassification = ToBeClassified;
            Tooltip = 'Net Weight';
        }
        field(50005; "Proforma Contact Name"; Text[250])
        {
            Caption = 'Proforma Contact Name';
            DataClassification = ToBeClassified;
            Tooltip = 'Proforma Contact Name';
        }
    }
}

