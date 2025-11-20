namespace WM.WeidmullerDEV;

using Microsoft.Manufacturing.Setup;

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
                    ToolTip = 'Specifies the value of the Reclass Journal Template field.';
                }
                field("Reclass Journal Batch"; Rec."Reclass Journal Batch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reclass Journal Batch field.';
                }
                field("Reclass From Location"; Rec."Reclass From Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reclass From Location field.';
                }
                field("Reclass To Location"; Rec."Reclass To Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reclass To Location field.';
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}