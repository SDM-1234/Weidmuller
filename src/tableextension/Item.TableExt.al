tableextension 50026 Item extends Item
{
    fields
    {
        field(50000; "EAN No."; Code[13])
        {
            Description = 'SE-E859';

            trigger OnValidate()
            begin
                //SE-E859.s
                IF "EAN No." <> '' THEN
                    CheckIsValidEAN("EAN No.");
                //SE-E859.e
            end;
        }
        field(50001; "Marketing Status"; Code[20])
        {
            Description = 'SE-E859';
        }
        field(50002; Notification; Boolean)
        {
            Description = 'SE-E859';
        }
        field(50003; "Inv Below Safety Qty"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'SE - -E963';
        }
        field(50004; "Inventory-Nippon"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                  "Location Code" = CONST('NIPPON'),
                                                                  "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                  "Variant Code" = FIELD("Variant Filter"),
                                                                  "Lot No." = FIELD("Lot No. Filter"),
                                                                  "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Inventory-Nippon';
            Description = 'ZE_LIJO';
            Editable = false;
        }
        field(50005; "Inventory-Quarantine"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                  "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                  "Location Code" = CONST('QR - NE'),
                                                                  "Drop Shipment" = FIELD("Drop Shipment Filter"),
                                                                  "Variant Code" = FIELD("Variant Filter"),
                                                                  "Lot No." = FIELD("Lot No. Filter"),
                                                                  "Serial No." = FIELD("Serial No. Filter")));
            Caption = 'Inventory-Quarantine';
            Description = 'ZE_LIJO';
            Editable = false;
        }
        field(50006; "Item Type"; Option)
        {
            Caption = 'Item Type';
            DataClassification = ToBeClassified;
            Description = 'ZE_LIJO';
            OptionCaption = ' ,MRP1,MRP2,Slow moving, Non-moving, Obsolete';
            OptionMembers = " ",MRP1,MRP2,"Slow moving"," Non-moving"," Obsolete";
        }
        field(50007; Dangerous; Boolean)
        {
            Caption = 'Dangerous';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(WEKey1; "EAN No.")
        {
        }
        key(WEKey2; "Inv Below Safety Qty")
        {
            Enabled = false;
        }
    }

    local procedure CheckIsValidEAN(L_EAN_No: Code[13])
    begin
        IF STRLEN(L_EAN_No) > 13 THEN
            ERROR(Text029_Tok);
        IF STRLEN(L_EAN_No) < 13 THEN
            ERROR(Text030_Tok);

    end;

    var
        Text029_Tok: Label 'Your EAN number is not valid. Its is more than 13.';
        Text030_Tok: Label 'Your EAN number is not valid. Its is less than 13.';
}

