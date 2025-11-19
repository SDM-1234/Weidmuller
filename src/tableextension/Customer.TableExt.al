tableextension 50023 Customer extends Customer
{
    fields
    {

        modify(Name)
        {
            trigger OnAfterValidate()
            begin
                IF "E-Mail" = '' THEN
                    ERROR('Kindly enter Customer mail');
            end;
        }

        modify("Customer Posting Group")
        {
            trigger OnAfterValidate()
            begin
                IF "Customer Posting Group" = 'LOCAL' THEN
                    "Currency Code" := 'INR';
            end;
        }

        modify("Currency Code")
        {
            trigger OnAfterValidate()
            begin
                IF ("Customer Posting Group" = 'LOCAL') OR ("Customer Posting Group" = 'EMPLOYEE') THEN
                    TESTFIELD("Currency Code", 'INR');

                IF "Currency Code" = 'INR' THEN
                    TESTFIELD("Customer Posting Group", 'LOCAL|EMPOYEE')
            end;
        }

        modify("E-Mail")

        {
            trigger OnAfterValidate()
            begin
                MailManagement.CheckValidEmailAddress("E-Mail");
            end;
        }

        field(50000; "No. of Industry Segments"; Integer)
        {
            CalcFormula = Count("Industry Segment" WHERE("Customer No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Weidmuller Industry Code (WIC)';
        }
        field(50001; "Invoice Print Check"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'E963 To Restrict Multiple Sales Shpmnt Selection from Sales Invoice';
        }
        field(50002; Freight; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'SE_E969';
        }
        field(50003; "Freight GL Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'SE_E969';
            TableRelation = "G/L Account" WHERE("Direct Posting" = CONST(true), "Account Type" = CONST(Posting), Blocked = CONST(false));
        }
        field(50004; "Weidmuller Industry Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            toolTip = 'Specifies the Weidmuller Industry Code.';
            caption = 'Weidmuller Industry Code (WIC) - OLD';
        }
        field(50005; "Industry Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ISIC1 Code,The 5 digits of the Industry Code';
            TableRelation = "Industry Code"."Code";
        }
        field(50006; "Legal status"; Option)
        {
            Caption = 'Legal status';
            DataClassification = CustomerContent;
            OptionCaption = 'Distributor,Direct,Customer Behind Distributor';
            OptionMembers = Distributor,Direct,"Customer Behind Distributor";
        }
        field(50007; "Key Account"; Code[20])
        {
            Caption = 'Key Account';
            DataClassification = CustomerContent;
            TableRelation = "Key Account"."Code";
        }
        field(50008; "Key Account Relation"; Option)
        {
            Caption = 'Key Account Relation';
            DataClassification = CustomerContent;
            OptionCaption = 'Direct,Indirect';
            OptionMembers = Direct,Indirect;
        }
        field(50009; "Distribution Code1"; Code[20])
        {
            Caption = 'Distribution Code1';
            DataClassification = CustomerContent;
            TableRelation = "Distribution Code1"."Code";

        }
        field(50010; "Distri. PRO Partner"; Boolean)
        {
            Caption = 'Distri. PRO Partner';
            Description = 'Distribution PRO Partner';
            DataClassification = CustomerContent;
        }
    }

    var
        MailManagement: Codeunit "Mail Management";

}

