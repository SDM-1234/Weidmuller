namespace WM.WeidmullerDEV;

using Microsoft.Purchases.Pricing;
using Microsoft.Purchases.Vendor;
    
report 50050 "Purchase Price Update"
{
    DefaultLayout = RDLC;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Vendor; Vendor)
        {

            trigger OnAfterGetRecord()
            begin
                PurchPrice.RESET();
                PurchPrice.SETFILTER(PurchPrice."Vendor No.", Vendor."No.");
                IF PurchPrice.FINDSET() THEN
                    REPEAT
                        PurchPrice.RENAME(PurchPrice."Item No.", PurchPrice."Vendor No.", PurchPrice."Starting Date", PurchPrice."Currency Code", PurchPrice."Variant Code", PurchPrice."Unit of Measure Code", 0);
                        COMMIT();
                    UNTIL PurchPrice.NEXT() = 0;
            end;

            trigger OnPreDataItem()
            begin
                MESSAGE('%1', COMPANYNAME);
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

    trigger OnPostReport()
    begin
        MESSAGE('Minimum Quantity is Updated');
    end;

    var
        PurchPrice: Record "Purchase Price";
}

