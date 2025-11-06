report 50015 AssignIndustrySegment
{
    ApplicationArea = All;
    Caption = 'AssignIndustrySegment';
    UsageCategory = Administration;
    dataset
    {
        dataitem(SalesLine; "Sales Line")
        {
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
                SalesSegment: Record "Sales Segment";
                IndustrySegment: Record "Industry Segment";
                ExistingSalesSegment: Record "Sales Segment";

            begin
                IndustrySegment.RESET();
                IndustrySegment.SETRANGE("Customer No.", SalesLine."Sell-to Customer No.");
                IF IndustrySegment.IsEmpty THEN
                    CurrReport.Skip();
                //ERROR('Industry Segments are not defined for customer ' + SalesLine."Sell-to Customer No.");

                SalesLine.TESTFIELD(Status, SalesLine.Status::Released);
                SalesSegment.RESET();
                SalesSegment.SETRANGE("Sales Order No.", SalesLine."No.");
                IF SalesSegment.FINDSET() THEN BEGIN
                    IF CONFIRM('Industrial Segments are already assigned, do you want to reassign?') THEN BEGIN
                        SalesSegment.DELETEALL();
                        //GetSalesHeader();
                        GetSalesHeader().InsertSalesSegments();
                        MESSAGE('Industry segments are calculated');
                    END ELSE BEGIN
                        ExistingSalesSegment.RESET();
                        ExistingSalesSegment.SETRANGE("Sales Order No.", SalesLine."No.");
                        ExistingSalesSegment.SETRANGE("Customer No.", SalesLine."Sell-to Customer No.");
                        IF ExistingSalesSegment.FINDSET() THEN
                            REPEAT
                                ExistingSalesSegment.Amount := (SalesLine.Amount + SalesLine.GetGSTAmounts()) * (ExistingSalesSegment."Sales %" / 100);
                                ExistingSalesSegment.MODIFY();
                            UNTIL ExistingSalesSegment.NEXT() = 0;
                    END;
                END ELSE BEGIN
                    GetSalesHeader().InsertSalesSegments();
                    MESSAGE('Industry segments are calculated');
                END;
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
}
