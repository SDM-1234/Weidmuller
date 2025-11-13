tableextension 50021 ManufacturingSetup extends "Manufacturing Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Reclass Journal Template"; Code[10])
        {
            Caption = 'Reclass Journal Template';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Template";
            toolTip = 'Specifies the journal template to use in the reclassification journal.';
        }
        field(50001; "Reclass Journal Batch"; Code[10])
        {
            Caption = 'Reclass Journal Batch';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("Reclass Journal Template"));
            ToolTip = 'Specifies the batch name of the item journal to use in the reclassification journal.';
        }
        field(50003; "Reclass From Location"; Code[10])
        {
            Caption = 'Reclass From Location';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use as In-Transit" = const(false));
            ToolTip = 'Specifies the location from which items are reclassified.';
        }
        field(50004; "Reclass To Location"; Code[10])
        {
            Caption = 'Reclass To Location';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use as In-Transit" = const(false));
            ToolTip = 'Specifies the location to which items are reclassified.';
        }
        field(50005; "Reclass To Bin Code"; Code[10])
        {
            Caption = 'Reclass To Location';
            DataClassification = ToBeClassified;
            TableRelation = Location where("Use as In-Transit" = const(false));
            ToolTip = 'Specifies the location to which items are reclassified.';
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