table 50003 "Industry Code"
{
    Caption = 'Industry Code';
    DataClassification = CustomerContent;
    DrillDownPageId = "Industry Code";
    LookupPageId = "Industry Code";

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
