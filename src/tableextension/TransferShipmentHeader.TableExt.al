tableextension 50041 TransferShipmentHeader extends "Transfer Shipment Header"
{
    fields
    {
        // Add changes to table fields here
        field(50001; "Quality Inspection No."; Code[20])
        {
            Caption = 'Quality Inspection No.';
            ToolTip = 'Specifies the quality inspection number for the transfer order.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
}