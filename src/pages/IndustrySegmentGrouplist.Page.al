namespace WM.WeidmullerDEV;

page 50009 "Industry Segment Group list"
{
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Industry Segment Group";
    ApplicationArea = All;
    Caption = 'Industry Segment Group List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the code for the industry segment group.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Specifies the description of the industry segment group.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

