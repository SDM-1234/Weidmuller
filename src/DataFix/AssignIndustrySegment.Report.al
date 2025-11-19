namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
report 50115 AssignIndustrySegment
{
    ApplicationArea = All;
    Caption = 'AssignIndustrySegment';
    UsageCategory = Administration;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Header; "Sales Header")
        {
            DataItemTableView = SORTING("No.") WHERE(Status = CONST(Released), "Document Type" = CONST(Order));
            trigger OnPreDataItem()
            begin
                MyDialog.Open('Assigning Industrial Segments. #1#####', TotCount);
            end;

            trigger OnAfterGetRecord()
            var
                SalesSegment: Record "Sales Segment";
                IndustrySegment: Record "Industry Segment";
            begin
                TotCount += 1;
                IndustrySegment.SETRANGE("Customer No.", "Sell-to Customer No.");
                IF IndustrySegment.IsEmpty THEN
                    CurrReport.Skip();

                TESTFIELD(Status, Status::Released);
                SalesSegment.SETRANGE("Sales Order No.", "No.");
                IF SalesSegment.IsEmpty() THEN
                    InsertSalesSegments();
                MyDialog.UPDATE();
            end;

            trigger OnPostDataItem()
            begin
                MyDialog.Close();
                MESSAGE('Industry segments are calculated');
            end;


        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        MyDialog: Dialog;
        TotCount: Integer;
}
