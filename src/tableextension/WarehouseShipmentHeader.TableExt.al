tableextension 50050 WarehouseShipmentHeader extends "Warehouse Shipment Header"
{
    fields
    {
        field(50000; "EAN No."; Code[13])
        {
            Description = 'SE-SE859';

            trigger OnValidate()
            begin
                IF "EAN No." <> '' THEN
                    CheckIsValidEAN("EAN No.");
            end;
        }
        field(50001; "Time of Removal"; Time)
        {
            Caption = 'Time of Removal';
            Description = 'SE-SE859';
        }
        field(50002; "LR/RR No."; Code[20])
        {
            Caption = 'LR/RR No.';
            Description = 'SE-SE859';
        }
        field(50003; "LR/RR Date"; Date)
        {
            Caption = 'LR/RR Date';
            Description = 'SE-SE859';
        }
        field(50004; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            Description = 'SE-SE859';
        }
        field(50005; "Date of Removal"; Date)
        {
            Description = 'SE-SE859';
        }
    }

    local procedure CheckIsValidEAN(L_EAN_No: Code[13])
    var
        L_Item: Record Item;
    begin
        IF STRLEN(L_EAN_No) > 13 THEN
            ERROR(Text029_Tok);
        IF STRLEN(L_EAN_No) < 13 THEN
            ERROR(Text030_Tok);
        L_Item.RESET();
        L_Item.SETCURRENTKEY("EAN No.");
        L_Item.SETRANGE("EAN No.", L_EAN_No);
        IF NOT L_Item.ISEMPTY THEN
            ERROR(Text031_Tok);
    end;

    procedure ClearBins()
    var
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
    begin
        WarehouseShipmentLine.RESET();
        WarehouseShipmentLine.SETCURRENTKEY("No.", "Bin Code");
        WarehouseShipmentLine.SETRANGE("No.", "No.");
        WarehouseShipmentLine.SETFILTER("Bin Code", '<>%1', '');
        WarehouseShipmentLine.MODIFYALL("Bin Code", '');
    end;

    var
        Text029_Tok: Label 'Your EAN number is not valid. Its is more than 13.';
        Text030_Tok: Label 'Your EAN number is not valid. Its is less than 13.';
        Text031_Tok: Label 'Your EAN number is Already Existing.';
}

