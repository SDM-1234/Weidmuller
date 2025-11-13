report 50012 "Industry Segments Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/reportlayout/IndustrySegmentsReport.rdl';
    Caption = 'Industry Segments Report';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group";
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; '')
            {
            }
            column(Customer_TABLECAPTION__________CustFilter; TABLECAPTION + ': ' + CustFilter)
            {
            }
            column(CustFilter; CustFilter)
            {
            }
            column(Customer__No__; "No.")
            {
            }
            column(Customer__Name; Customer.Name)
            {
            }
            column(Customer___ListCaption; Customer___ListCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(CustNoCaption; CustNoCaptionLbl)
            {
            }
            column(CustNameCaption; CustNameCaptionLbl)
            {
            }
            column(ExternalSalesCaption; ExternalSalesCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(IM1Caption; IM1CaptionLbl)
            {
            }
            column(IM1PercentageCaption; IM1PercentageCaptionLbl)
            {
            }
            column(IM2Caption; IM2CaptionLbl)
            {
            }
            column(IM2PercentageCaption; IM2PercentageCaptionLbl)
            {
            }
            column(IM3Caption; IM3CaptionLbl)
            {
            }
            column(IM3PercentageCaption; IM3PercentageCaptionLbl)
            {
            }
            column(IM4Caption; IM4CaptionLbl)
            {
            }
            column(IM4PercentageCaption; IM4PercentageCaptionLbl)
            {
            }
            column(IM5Caption; IM5CaptionLbl)
            {
            }
            column(IM5PercentageCaption; IM5PercentageCaptionLbl)
            {
            }
            column(IM6Caption; IM6CaptionLbl)
            {
            }
            column(IM6PercentageCaption; IM6PercentageCaptionLbl)
            {
            }
            column(SegmentDescArray1; SegmentDescArray[1])
            {
            }
            column(SegmentPercentageArray1; SegmentPercentageArray[1])
            {
            }
            column(SegmentAmountArray1; SegmentAmountArray[1])
            {
            }
            column(SegmentDescArray2; SegmentDescArray[2])
            {
            }
            column(SegmentPercentageArray2; SegmentPercentageArray[2])
            {
            }
            column(SegmentAmountArray2; SegmentAmountArray[2])
            {
            }
            column(SegmentDescArray3; SegmentDescArray[3])
            {
            }
            column(SegmentPercentageArray3; SegmentPercentageArray[3])
            {
            }
            column(SegmentAmountArray3; SegmentAmountArray[3])
            {
            }
            column(SegmentDescArray4; SegmentDescArray[4])
            {
            }
            column(SegmentPercentageArray4; SegmentPercentageArray[4])
            {
            }
            column(SegmentAmountArray4; SegmentAmountArray[4])
            {
            }
            column(SegmentDescArray5; SegmentDescArray[5])
            {
            }
            column(SegmentPercentageArray5; SegmentPercentageArray[5])
            {
            }
            column(SegmentAmountArray5; SegmentAmountArray[5])
            {
            }
            column(SegmentDescArray6; SegmentDescArray[6])
            {
            }
            column(SegmentPercentageArray6; SegmentPercentageArray[6])
            {
            }
            column(SegmentAmountArray6; SegmentAmountArray[6])
            {
            }
            column(AmtLCY_CustLedgerEntry; Customer."Inv. Amounts (LCY)")
            {
            }
            column(IndustryCode_Customer; Customer."Industry Code")
            {
            }
            column(Legal_status_Customer; Customer."Legal Status")
            {
            }

            column(Key_Account; Customer."Key Account")
            {
            }



            column(Key_Account_Relation; Customer."Key Account Relation")
            {
            }


            column(Distribution_Code1; Customer."Distribution Code1")
            {
            }

            column(Distri_PRO_Partner; Customer."Distri. PRO Partner")
            {
            }
            trigger OnAfterGetRecord()
            var
                IndustrySegmentTemp: Record "Industry Segment" temporary;
                SalesInvoiceHeader: Record "Sales Invoice Header";
                SalesSegment: Record "Sales Segment";
                IndustrySegment: Record "Industry Segment";
                SalesInvoiceLine: Record "Sales Invoice Line";
                Currency: Record Currency;
                CurrExchRate: Record "Currency Exchange Rate";
                SalesAmt: Decimal;
                i: Integer;
            begin
                SalesAmt := 0;
                SalesInvoiceHeader.RESET();
                SalesInvoiceHeader.SETRANGE("Sell-to Customer No.", Customer."No.");
                IF Customer.GETFILTER("Date Filter") <> '' THEN
                    SalesInvoiceHeader.SETFILTER("Posting Date", '%1..%2', Customer.GETRANGEMIN("Date Filter"), Customer.GETRANGEMAX("Date Filter"));
                IF SalesInvoiceHeader.FINDSET() THEN
                    REPEAT
                        SalesSegment.RESET();
                        SalesSegment.SETCURRENTKEY("Posted Sales Invoice No.");
                        SalesSegment.SETRANGE("Customer No.", Customer."No.");
                        SalesSegment.SETRANGE("Posted Sales Invoice No.", SalesInvoiceHeader."No.");
                        IF SalesSegment.FINDSET() THEN
                            REPEAT
                                IndustrySegmentTemp.RESET();
                                IF NOT IndustrySegmentTemp.GET(SalesSegment."Customer No.", SalesSegment."Industry Group Code") THEN BEGIN
                                    IndustrySegmentTemp.INIT();
                                    IndustrySegmentTemp."Customer No." := SalesSegment."Customer No.";
                                    IndustrySegmentTemp."Industry Group Code" := SalesSegment."Industry Group Code";
                                    IndustrySegmentTemp."Sales %" := SalesSegment."Sales %";
                                    IndustrySegmentTemp.Amount := SalesSegment.Amount;
                                    IndustrySegmentTemp.Counter := 1;
                                    IndustrySegmentTemp.INSERT();
                                END ELSE BEGIN
                                    IndustrySegmentTemp.Counter += 1;
                                    IndustrySegmentTemp."Sales %" += SalesSegment."Sales %";
                                    IndustrySegmentTemp.Amount += SalesSegment.Amount;
                                    IndustrySegmentTemp.MODIFY();
                                END;
                            UNTIL SalesSegment.NEXT() = 0;
                        SalesInvoiceLine.RESET();
                        SalesInvoiceLine.SETRANGE("Document No.", SalesInvoiceHeader."No.");
                        SalesInvoiceLine.SETFILTER("No.", '<>%1', '');
                        IF SalesInvoiceLine.FINDSET() THEN
                            REPEAT
                                IF SalesInvoiceHeader."Currency Code" <> '' THEN BEGIN
                                    Currency.RESET();
                                    Currency.GET(SalesInvoiceHeader."Currency Code");
                                    SalesAmt += ROUND(
                                        CurrExchRate.ExchangeAmtFCYToLCY(
                                          SalesInvoiceHeader."Posting Date", SalesInvoiceHeader."Currency Code",
                                          SalesInvoiceLine."Line Amount", SalesInvoiceHeader."Currency Factor"),
                                          Currency."Unit-Amount Rounding Precision");
                                END ELSE
                                    SalesAmt += SalesInvoiceLine."Line Amount";
                            UNTIL SalesInvoiceLine.NEXT() = 0;
                    UNTIL SalesInvoiceHeader.NEXT() = 0;

                CLEAR(SegmentDescArray);
                CLEAR(SegmentPercentageArray);
                CLEAR(SegmentAmountArray);
                IndustrySegmentTemp.RESET();
                IndustrySegmentTemp.SETRANGE("Customer No.", Customer."No.");
                IF IndustrySegmentTemp.FINDSET() THEN
                    REPEAT
                        IF i < 7 THEN BEGIN
                            i += 1;
                            IndustrySegment.RESET();
                            IndustrySegment.SETRANGE("Industry Group Code", IndustrySegmentTemp."Industry Group Code");
                            IF IndustrySegment.FINDFIRST() THEN
                                IndustrySegment.CALCFIELDS("Industry Group Description");
                            SegmentDescArray[i] := IndustrySegmentTemp."Industry Group Code" + ' | ' + IndustrySegment."Industry Group Description";
                            IF SalesAmt > 0 THEN
                                SegmentPercentageArray[i] := (IndustrySegmentTemp.Amount / SalesAmt) * 100;
                            SegmentAmountArray[i] := IndustrySegmentTemp.Amount;
                        END;
                    UNTIL IndustrySegmentTemp.NEXT() = 0;
                IF PrintToExcel THEN
                    MakeExcelDataBody();
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field(PrintToExcel; PrintToExcel)
                {
                    Caption = 'Print To Excel';
                    ApplicationArea = ALl;
                    ToolTip = ' ';
                }
            }
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
        IF PrintToExcel THEN
            CreateExcelbook();
    end;

    trigger OnPreReport()
    begin
        IF PrintToExcel THEN
            MakeExcelInfo();
    end;

    var
        CustFilter: Text;
        Customer___ListCaptionLbl: Label 'Industry Segments Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        CustNoCaptionLbl: Label 'Customer No.';
        CustNameCaptionLbl: Label 'Customer Name';
        ExternalSalesCaptionLbl: Label 'External Sales';
        TotalCaptionLbl: Label 'Total';
        IM1CaptionLbl: Label 'IM 1';
        IM1PercentageCaptionLbl: Label 'IM 1 (%)';
        IM1AmountCaptionLbl: Label 'IM 1 Amount';
        IM2CaptionLbl: Label 'IM 2';
        IM2PercentageCaptionLbl: Label 'IM 2 (%)';
        IM2AmountCaptionLbl: Label 'IM 2 Amount';
        IM3CaptionLbl: Label 'IM 3';
        IM3PercentageCaptionLbl: Label 'IM 3 (%)';
        IM3AmountCaptionLbl: Label 'IM 3 Amount';
        IM4CaptionLbl: Label 'IM 4';
        IM4PercentageCaptionLbl: Label 'IM 4 (%)';
        IM4AmountCaptionLbl: Label 'IM 4 Amount';
        IM5CaptionLbl: Label 'IM 5';
        IM5PercentageCaptionLbl: Label 'IM 5 (%)';
        IM5AmountCaptionLbl: Label 'IM 5 Amount';
        IM6CaptionLbl: Label 'IM 6';
        IM6PercentageCaptionLbl: Label 'IM 6 (%)';
        SegmentDescArray: array[6] of Text[200];
        SegmentPercentageArray: array[6] of Decimal;
        SegmentAmountArray: array[6] of Decimal;
        PrintToExcel: Boolean;
        ExcelBuf: Record "Excel Buffer" temporary;
        IM6AmountCaptionLbl: Label 'IM 6 Amount';
        Text001: Label 'Company Name';
        Text002: Label 'Report Name';
        Text003: Label 'Industry Segments Report';
        Text004: Label 'User ID';
        Text005: Label 'Date';
        Text006: Label 'Data';

    procedure MakeExcelInfo()
    begin
        ExcelBuf.SetUseInfoSheet();
        ExcelBuf.AddInfoColumn(FORMAT(Text001), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(COMPANYNAME, false, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow();
        ExcelBuf.AddInfoColumn(FORMAT(Text002), FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(FORMAT(Text003), FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow();
        ExcelBuf.AddInfoColumn(FORMAT(Text004), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(USERID, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow();
        ExcelBuf.AddInfoColumn(FORMAT(Text005), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(TODAY, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date);
        ExcelBuf.ClearNewRow();
        MakeExcelDataHeader();
    end;

    procedure MakeExcelDataHeader()
    begin
        ExcelBuf.NewRow();
        ExcelBuf.AddColumn(CustNoCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(CustNameCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(ExternalSalesCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(TotalCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM1CaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM1PercentageCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM1AmountCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM2CaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM2PercentageCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM2AmountCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM3CaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM3PercentageCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM3AmountCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM4CaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM4PercentageCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM4AmountCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM5CaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM5PercentageCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM5AmountCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM6CaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM6PercentageCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(IM6AmountCaptionLbl, FALSE, '', TRUE, FALSE, TRUE, '@', ExcelBuf."Cell Type"::Text);
    end;

    procedure MakeExcelDataBody()
    begin
        ExcelBuf.NewRow();
        ExcelBuf.AddColumn(Customer."No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Customer.Name, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(SegmentAmountArray[1] + SegmentAmountArray[2] + SegmentAmountArray[3] + SegmentAmountArray[4] + SegmentAmountArray[5] + SegmentAmountArray[6]), FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(FORMAT(SegmentPercentageArray[1] + SegmentPercentageArray[2] + SegmentPercentageArray[3] + SegmentPercentageArray[4] + SegmentPercentageArray[5] + SegmentPercentageArray[6]), FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SegmentDescArray[1], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(SegmentPercentageArray[1], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SegmentAmountArray[1], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SegmentDescArray[2], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(SegmentPercentageArray[2], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SegmentAmountArray[2], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SegmentDescArray[3], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(SegmentPercentageArray[3], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SegmentAmountArray[3], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SegmentDescArray[4], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(SegmentPercentageArray[4], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SegmentAmountArray[4], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SegmentDescArray[5], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(SegmentPercentageArray[5], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SegmentAmountArray[5], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SegmentDescArray[6], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(SegmentPercentageArray[6], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SegmentAmountArray[6], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
    end;

    procedure CreateExcelbook()
    begin
        ExcelBuf.CreateNewBook(Text006);
        ExcelBuf.WriteSheet(Text006, CompanyName, UserId);
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename('Industry Segments');
        ExcelBuf.OpenExcel();
    end;
}

