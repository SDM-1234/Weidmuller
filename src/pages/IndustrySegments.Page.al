namespace WM.WeidmullerDEV;

using Microsoft.CRM.Setup;
    
page 50013 "Industry Segments"
{
    PageType = List;
    SourceTable = "Industry Segment";
    ApplicationArea = All;
    Caption = 'Industry Segments';
    UsageCategory = Lists;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    Visible = false;
                    ToolTip = 'Specifies the customer number associated with the industry segment.';
                }
                field("Industry Group Code"; Rec."Industry Group Code")
                {
                    Caption = 'Industry Group Code';
                    ToolTip = 'Specifies the industry group code for the industry segment.';
                    ApplicationArea = All;
                }
                field("Industry Group Description"; Rec."Industry Group Description")
                {
                    Caption = 'Industry Group Description';
                    ToolTip = 'Specifies the description of the industry group associated with the industry segment.';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                    ToolTip = 'Specifies the name of the customer associated with the industry segment.';
                }
                field("Sales %"; Rec."Sales %")
                {
                    Caption = 'Sales %';
                    ToolTip = 'Specifies the sales percentage for the industry segment.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    var
        IndustrySegment, IndustrySegment1 : Record "Industry Segment";
        IndustryGroup: Record "Industry Group";
    begin
        IndustrySegment.RESET();
        IndustrySegment.SETRANGE("Customer No.", Rec."Customer No.");
        IF IndustrySegment.IsEmpty THEN BEGIN
            IndustryGroup.RESET();
            IF NOT IndustryGroup.GET('UNASSIGNED') THEN BEGIN
                IndustryGroup.INIT();
                IndustryGroup.Code := 'UNASSIGNED';
                IndustryGroup.Description := 'Unassigned';
                IndustryGroup.INSERT();
            END;
            IndustrySegment1.INIT();
            IndustrySegment1.VALIDATE("Customer No.", Rec."Customer No.");
            IndustrySegment1.VALIDATE("Industry Group Code", 'UNASSIGNED');
            IndustrySegment1."Sales %" := 100;
            IndustrySegment1.INSERT();
        END;
        Rec.UpdateUnassignedPercentage(Rec."Customer No.");
    end;

    trigger OnAfterGetRecord()
    var
        IndustrySegment, IndustrySegment1 : Record "Industry Segment";
        IndustryGroup: Record "Industry Group";
    begin
        IndustrySegment.RESET();
        IndustrySegment.SETRANGE("Customer No.", Rec."Customer No.");
        IF IndustrySegment.IsEmpty THEN BEGIN
            IndustryGroup.RESET();
            IF NOT IndustryGroup.GET('UNASSIGNED') THEN BEGIN
                IndustryGroup.INIT();
                IndustryGroup.Code := 'UNASSIGNED';
                IndustryGroup.Description := 'Unassigned';
                IndustryGroup.INSERT();
            END;
            IndustrySegment1.INIT();
            IndustrySegment1.VALIDATE("Customer No.", Rec."Customer No.");
            IndustrySegment1.VALIDATE("Industry Group Code", 'UNASSIGNED');
            IndustrySegment1."Sales %" := 100;
            IndustrySegment1.INSERT();
        END;
        Rec.UpdateUnassignedPercentage(Rec."Customer No.");
    end;

    trigger OnClosePage()
    var
        IndustrySegment: Record "Industry Segment";
    begin
        IF (Rec.FindTotalSalesPercentage(Rec."Customer No.") = 100) AND (Rec.CountIndustrySegments(Rec."Customer No.") > 0) THEN BEGIN
            IndustrySegment.RESET();
            IndustrySegment.SETRANGE("Customer No.", Rec."Customer No.");
            IndustrySegment.SETRANGE("Industry Group Code", 'UNASSIGNED');
            IF IndustrySegment.FINDFIRST() THEN
                IndustrySegment.DELETE();
        END;
        IndustrySegment.RESET();
        IndustrySegment.SETRANGE("Customer No.", Rec."Customer No.");
        IndustrySegment.SETRANGE("Sales %", 0);
        IF IndustrySegment.FINDSET() THEN
            REPEAT
                IndustrySegment.DELETE();
            UNTIL IndustrySegment.NEXT() = 0;
    end;
}

