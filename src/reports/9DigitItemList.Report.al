namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Item;
    
report 50016 "9 Digit Item List"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/reportlayout/9DigitItemList.rdl';
    ApplicationArea = All;
    Caption = '9 Digit Item List';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Item; Item)
        {
            column(No_Item; Item."No.")
            {
            }
            column(Description_Item; Item.Description)
            {
            }

            trigger OnAfterGetRecord()
            begin
                "Digit Count" := STRLEN(Item."No.");

                IF "Digit Count" <> 8 THEN
                    CurrReport.SKIP();
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        "Digit Count": Integer;
}

