namespace WM.WeidmullerDEV;

page 50003 "Key Accounts"
{
    ApplicationArea = All;
    Caption = 'Key Accounts';
    PageType = List;
    SourceTable = "Key Account";
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
