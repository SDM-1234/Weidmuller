table 50007 "Distribution Code1"
{
    Caption = 'Distribution Code1';
    DataClassification = CustomerContent;


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
        key(PK; "COde")
        {
            Clustered = true;
        }
    }
}
