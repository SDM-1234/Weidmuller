table 50006 "Key Account"
{
    Caption = 'Key Account';
    DataClassification = CustomerContent;
    DrillDownPageId = "Key Accounts";
    LookupPageId = "Key Accounts";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
