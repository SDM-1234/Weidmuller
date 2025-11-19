namespace WM.WeidmullerDEV;

using Microsoft.Purchases.Document;

pageextension 50076 PurchaseOrderSubformWM extends "Purchase Order Subform"
{
    layout
    {
        modify("Tax Area Code")
        {
            Visible = true;

        }
        modify("Tax Group Code")
        {
            Visible = true;
        }

        modify("Tax Liable")
        {
            Visible = true;
        }
        modify("Line No.")
        {
            Visible = true;
        }
        modify("Description 2")
        {
            Visible = true;
        }

        addafter("No.")
        {
            field("Profit %"; Rec."Profit %")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Profit % field.';

            }


        }
    }

}

