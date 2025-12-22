namespace WM.WeidmullerDEV;

page 50002 "Industry Code"
{
    ApplicationArea = All;
    Caption = 'Industry Code';
    PageType = List;
    SourceTable = "Industry Code";
    UsageCategory = Lists;


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
