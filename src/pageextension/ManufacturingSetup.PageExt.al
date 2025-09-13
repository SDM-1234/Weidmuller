pageextension 50027 ManufacturingSetup extends "Manufacturing Setup"
{
    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            group(Weidmuller)
            {
                field("Reclass Journal Template"; Rec."Reclass Journal Template")
                {
                    ApplicationArea = All;
                }
                field("Reclass Journal Batch"; Rec."Reclass Journal Batch")
                {
                    ApplicationArea = All;
                }
                field("Reclass From Location"; Rec."Reclass From Location")
                {
                    ApplicationArea = All;
                }
                field("Reclass To Location"; Rec."Reclass To Location")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}