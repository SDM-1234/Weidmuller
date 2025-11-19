namespace WM.WeidmullerDEV;

table 50000 "Industry Segment Group"
{
    Caption = 'Industry Segment Group';
    DrillDownPageID = "Industry Segment Group list";
    LookupPageID = "Industry Segment Group list";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}