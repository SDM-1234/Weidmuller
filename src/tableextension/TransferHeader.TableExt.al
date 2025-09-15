tableextension 50012 TransferHeader extends "Transfer Header"
{
    fields
    {
        field(50000; "Approval Status"; Enum "Approval Status")
        {
            Caption = 'Approval Status';
            DataClassification = CustomerContent;
            editable = false;
            ToolTip = 'Specifies the approval status for Transfer Header.';
            Initvalue = Open;
        }
        field(50001; "Quality Inspection No."; Code[20])
        {
            Caption = 'Quality Inspection No.';
            ToolTip = 'Specifies the quality inspection number for the transfer order.';
            DataClassification = ToBeClassified;
        }
    }
}
