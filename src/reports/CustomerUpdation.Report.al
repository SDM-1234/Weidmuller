namespace WM.WeidmullerDEV;

using Microsoft.Sales.Customer;
    
report 50011 "Customer Updation"
{
    ProcessingOnly = true;
    UseRequestPage = false;
    ApplicationArea = All;
    UsageCategory = Tasks;

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING("No.")
                                ORDER(Ascending)
                                WHERE(Blocked = FILTER(<> All));

            trigger OnAfterGetRecord()
            begin
                OverDue := Customer.CalcOverdueBalance();
                IF Customer."Credit Limit (LCY)" - OverDue <= 0 THEN BEGIN
                    Customer.Blocked := Customer.Blocked::All;
                    Customer.MODIFY();
                    MESSAGE('%1', Customer."No.");
                END;
            end;

            trigger OnPreDataItem()
            begin
                Customer.SETFILTER(Customer."No.", 'IN00001..IN00010');
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
        OverDue: Decimal;
}

