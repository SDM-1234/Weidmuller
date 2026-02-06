report 50020 "Sales Order Auto-Reserve"
{
    UsageCategory = Tasks;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = where("Document Type" = const(Order), Status = const(Released));
            RequestFilterFields = "Document Type", "No.";
            dataitem(SalesLine; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"),
                             "Document No." = field("No.");
                DataItemTableView = where("Type" = const(Item), "Outstanding Quantity" = filter(> 0));
                CalcFields = "Reserved Qty. (Base)";
                trigger OnAfterGetRecord()
                var
                    Reservation: Page Reservation;
                begin
                    if "Outstanding Qty. (Base)" = "Reserved Qty. (Base)" then
                        CurrReport.Skip();
                    Clear(Reservation);
                    Reservation.SetReservSource(SalesLine);
                    Reservation.AutoReserve();
                end;

            }
            trigger OnPreDataItem()
            begin
                SalesSetup.Get();
                SalesSetup.TestField("Request Delivery Date Formula");
                SetRange("Requested Delivery Date", 0D, CalcDate(SalesSetup."Request Delivery Date Formula", Today));
            end;
        }
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
}