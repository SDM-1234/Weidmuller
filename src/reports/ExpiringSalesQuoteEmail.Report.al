report 50003 "Expiring Sales Quote Email"
{
    DefaultRenderingLayout = WordLayoutEMail1;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("No.") WHERE("Document Type" = CONST(Quote));
            column(No; "No.")
            {
            }
            column(CustomerName; "Sell-to Customer Name")
            {
            }
            column(CustomerNo; "Sell-to Customer No.")
            {
            }
            column(QuoteValidUntilDate; "Quote Valid Until Date")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(SalespersonCode; "Salesperson Code")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(Amount; "Amount Including VAT")
            {
                DecimalPlaces = 2;
            }

            trigger OnPreDataItem()
            var
                StartDate, EndDate : Date;
            begin
                StartDate := DWY2Date(1, ((Date2DWY(Today(), 2) + 1) > 52) ? 1 : (Date2DWY(Today(), 2) + 1), ((Date2DWY(Today(), 2) + 1) > 52) ? Date2DWY(Today(), 3) + 1 : Date2DWY(Today(), 3));
                EndDate := DWY2Date(7, ((Date2DWY(Today(), 2) + 1) > 52) ? 1 : (Date2DWY(Today(), 2) + 1), ((Date2DWY(Today(), 2) + 1) > 52) ? Date2DWY(Today(), 3) + 1 : Date2DWY(Today(), 3));
                SetRange("Quote Valid Until Date", StartDate, EndDate);
            end;
        }
    }
    rendering
    {
        layout(WordLayoutEMail1)
        {
            Type = Word;
            LayoutFile = 'src\reportlayout\ExpiringSalesQuoteEmail.docx';
        }
    }
}