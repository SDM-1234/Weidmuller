page 50001 "Change Log Entries - NAV"
{
    ApplicationArea = All;
    Caption = 'Change Log Entries - NAV';
    PageType = List;
    SourceTable = "WMChange Log Entry";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Changed Record SystemId"; Rec."Changed Record SystemId")
                {
                    ToolTip = 'Specifies the value of the Changed Record SystemId field.', Comment = '%';
                }
                field("Date and Time"; Rec."Date and Time")
                {
                    ToolTip = 'Specifies the value of the Date and Time field.', Comment = '%';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Field Caption"; Rec."Field Caption")
                {
                    ToolTip = 'Specifies the value of the Field Caption field.', Comment = '%';
                }
                field("Field Log Entry Feature"; Rec."Field Log Entry Feature")
                {
                    ToolTip = 'Specifies the value of the Field Log Entry Feature field.', Comment = '%';
                }
                field("Field No."; Rec."Field No.")
                {
                    ToolTip = 'Specifies the value of the Field No. field.', Comment = '%';
                }
                field("New Value"; Rec."New Value")
                {
                    ToolTip = 'Specifies the value of the New Value field.', Comment = '%';
                }
                field("Notification Message Id"; Rec."Notification Message Id")
                {
                    ToolTip = 'Specifies the value of the Notification Message Id field.', Comment = '%';
                }
                field("Notification Status"; Rec."Notification Status")
                {
                    ToolTip = 'Specifies the value of the Notification status field.', Comment = '%';
                }
                field("Old Value"; Rec."Old Value")
                {
                    ToolTip = 'Specifies the value of the Old Value field.', Comment = '%';
                }
                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.', Comment = '%';
                }
                field("Primary Key Field 1 Caption"; Rec."Primary Key Field 1 Caption")
                {
                    ToolTip = 'Specifies the value of the Primary Key Field 1 Caption field.', Comment = '%';
                }
                field("Primary Key Field 1 No."; Rec."Primary Key Field 1 No.")
                {
                    ToolTip = 'Specifies the value of the Primary Key Field 1 No. field.', Comment = '%';
                }
                field("Primary Key Field 1 Value"; Rec."Primary Key Field 1 Value")
                {
                    ToolTip = 'Specifies the value of the Primary Key Field 1 Value field.', Comment = '%';
                }
                field("Primary Key Field 2 Caption"; Rec."Primary Key Field 2 Caption")
                {
                    ToolTip = 'Specifies the value of the Primary Key Field 2 Caption field.', Comment = '%';
                }
                field("Primary Key Field 2 No."; Rec."Primary Key Field 2 No.")
                {
                    ToolTip = 'Specifies the value of the Primary Key Field 2 No. field.', Comment = '%';
                }
                field("Primary Key Field 2 Value"; Rec."Primary Key Field 2 Value")
                {
                    ToolTip = 'Specifies the value of the Primary Key Field 2 Value field.', Comment = '%';
                }
                field("Primary Key Field 3 Caption"; Rec."Primary Key Field 3 Caption")
                {
                    ToolTip = 'Specifies the value of the Primary Key Field 3 Caption field.', Comment = '%';
                }
                field("Primary Key Field 3 No."; Rec."Primary Key Field 3 No.")
                {
                    ToolTip = 'Specifies the value of the Primary Key Field 3 No. field.', Comment = '%';
                }
                field("Primary Key Field 3 Value"; Rec."Primary Key Field 3 Value")
                {
                    ToolTip = 'Specifies the value of the Primary Key Field 3 Value field.', Comment = '%';
                }
                field(Protected; Rec."Protected")
                {
                    ToolTip = 'Specifies the value of the Protected field.', Comment = '%';
                }
                field("Record ID"; Rec."Record ID")
                {
                    ToolTip = 'Specifies the value of the Record ID field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
                field("Table Caption"; Rec."Table Caption")
                {
                    ToolTip = 'Specifies the value of the Table Caption field.', Comment = '%';
                }
                field("Table No."; Rec."Table No.")
                {
                    ToolTip = 'Specifies the value of the Table No. field.', Comment = '%';
                }
                field("Time"; Rec."Time")
                {
                    ToolTip = 'Specifies the value of the Time field.', Comment = '%';
                }
                field("Type of Change"; Rec."Type of Change")
                {
                    ToolTip = 'Specifies the value of the Type of Change field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
            }
        }
    }
}
