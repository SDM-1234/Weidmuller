namespace WM.WeidmullerDEV;

using Microsoft.Sales.Customer;

pageextension 50043 CustomerCard extends "Customer Card"
{
    layout
    {
        modify(Blocked)
        {
            trigger OnBeforeValidate()
            begin
                IF (xRec.Blocked = Rec.Blocked::All) OR (xRec.Blocked = Rec.Blocked::Invoice) THEN
                    IF xRec."No." <> 'C001' THEN
                        ERROR('Send Approval Request for Customer Unblocking');
            end;
        }
        addbefore(ContactDetails)
        {
            field("Territory Code"; Rec."Territory Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Territory Code field.';
            }
        }
        addafter("Last Date Modified")
        {
            field("No. of Industry Segments"; Rec."No. of Industry Segments")
            {
                ToolTip = 'Specifies the value of the No. of Industry Segments field.';
                ApplicationArea = All;
            }
            field("Invoice Print Check"; Rec."Invoice Print Check")
            {
                ToolTip = 'Specifies the value of the Invoice Print Check field.';
                ApplicationArea = All;
            }
            field(Freight; Rec.Freight)
            {
                ToolTip = 'Specifies the value of the Freight field.';
                ApplicationArea = All;
            }
            field("Freight GL Account"; Rec."Freight GL Account")
            {
                ToolTip = 'Specifies the value of the Freight GL Account field.';
                ApplicationArea = All;
            }
            field("Weidmuller Industry Code"; Rec."Weidmuller Industry Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Weidmuller Industry Code (WIC) - OLD field.';
            }
            field("Industry Code"; Rec."Industry Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Industry Code field.', Comment = '%';
            }
            field("Legal status"; Rec."Legal status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Legal status field.', Comment = '%';
            }
            field("Key Account"; Rec."Key Account")
            {
                ApplicationArea = All;
                Editable = not (rec."Legal status" = Rec."Legal status"::Distributor);

                ToolTip = 'Specifies the value of the Key Account field.', Comment = '%';
            }
            field("Key Account Relation"; Rec."Key Account Relation")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Key Account Relation field.', Comment = '%';
            }
            field("Distribution Code1"; Rec."Distribution Code1")
            {
                ApplicationArea = All;
                Editable = (rec."Legal status" = Rec."Legal status"::Distributor);
                ToolTip = 'Specifies the value of the Distribution Code1 field.', Comment = '%';
            }
            field("Distri. PRO Partner"; Rec."Distri. PRO Partner")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Distri. PRO Partner field.', Comment = '%';
            }
        }
    }
    actions
    {
        modify(Approve)
        {
            Enabled = true;
        }
        modify(Reject)
        {
            Enabled = true;
        }
        modify(Delegate)
        {
            Enabled = false;
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        IF (xRec."Customer Price Group" <> Rec."Customer Price Group") OR (xRec."Customer Posting Group" <> Rec."Customer Posting Group")
          OR (xRec."Gen. Bus. Posting Group" <> Rec."Gen. Bus. Posting Group") THEN
            Rec.Blocked := Rec.Blocked::All;
    end;


    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin

        IF Rec."Currency Code" = '' THEN
            Rec.TESTFIELD("Currency Code");

    end;
}

