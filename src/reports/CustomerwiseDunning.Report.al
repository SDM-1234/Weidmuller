namespace WM.WeidmullerDEV;

using Microsoft.Foundation.Company;
using Microsoft.Foundation.PaymentTerms;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Receivables;
    
report 50024 "Customer-wise Dunning"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/reportlayout/CustomerwiseDunning.rdl';
    PreviewMode = PrintLayout;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Customer-wise Dunning';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(Name_Customer; Customer.Name)
            {
            }
            column(Address_Customer; Customer.Address)
            {
            }
            column(Address2_Customer; Customer."Address 2")
            {
            }
            column(City_Customer; Customer.City)
            {
            }
            column(PaymentTermsCode_Customer; Customer."Payment Terms Code")
            {
            }
            column(PostCode_Customer; Customer."Post Code")
            {
            }
            column(Txt00001; Txt00001_Lbl)
            {
            }
            column(Txt00002; Txt00002_Lbl)
            {
            }
            column(Txt00003; Txt00003_Lbl)
            {
            }
            column(Txt00004; Txt00004_Lbl)
            {
            }
            column(Txt00005; Txt00005_Lbl)
            {
            }
            column(Txt00006; Txt00006_Lbl)
            {
            }
            column(PayTermsDesc; PayTermsDesc)
            {
            }
            column(TDate; TODAY)
            {
            }
            column(Balance; Balance)
            {
                DecimalPlaces = 0 : 2;
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = FIELD("No.");
                DataItemTableView = WHERE(Open = CONST(true),
                                          "Remaining Amount" = FILTER(> 10 | < -10));
                column(Picture_CompanyInfo; CompanyInfo.Picture)
                {
                }
                column(CustomerNo_CustLedgerEntry; "Cust. Ledger Entry"."Customer No.")
                {
                }
                column(PostingDate_CustLedgerEntry; "Cust. Ledger Entry"."Posting Date")
                {
                }
                column(DocumentNo_CustLedgerEntry; "Cust. Ledger Entry"."Document No.")
                {
                }
                column(Description_CustLedgerEntry; "Cust. Ledger Entry".Description)
                {
                }
                column(RemainingAmount_CustLedgerEntry; "Cust. Ledger Entry"."Remaining Amount")
                {
                }
                column(DueDate_CustLedgerEntry; "Cust. Ledger Entry"."Due Date")
                {
                }
                column(CurrencyCode_CustLedgerEntry; "Cust. Ledger Entry"."Currency Code")
                {
                }
                column(Arrears; Arrears)
                {
                }
                column(Dunning; Dunning)
                {
                }
                column(TINNO_CompanyInfo; CompanyInfo."T.A.N. No.")
                {
                }
                column(CSTNO_CompanyInfo; CompanyInfo."Registration No.")
                {
                }
                column(Name_CompanyInfo; CompanyInfo.Name)
                {
                }
                column(Name2_CompanyInfo; CompanyInfo."Name 2")
                {
                }
                column(Address_CompanyInfo; CompanyInfo.Address)
                {
                }
                column(Address2_CompanyInfo; CompanyInfo."Address 2")
                {
                }
                column(City_CompanyInfo; CompanyInfo.City)
                {
                }
                column(PhoneNo_CompanyInfo; CompanyInfo."Phone No.")
                {
                }
                column(HomePage_CompanyInfo; CompanyInfo."Home Page 2")
                {
                }
                column(PhoneNo2_CompanyInfo; CompanyInfo."Phone No. 2")
                {
                }
                column(HomePage2_CompanyInfo; CompanyInfo."Home Page 2")
                {
                }
                column(CIN_CompanyInfo; CompanyInfo.CIN)
                {
                }
                column(Country_CompanyInfo; CompanyInfo.County)
                {
                }
                column(PostCode_CompanyInfo; CompanyInfo."Post Code")
                {
                }
                column(OriginalAmount_CustLedgerEntry; "Cust. Ledger Entry"."Original Amount")
                {
                }
                column(DunReminder; DunReminder)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Arrears := TODAY - "Cust. Ledger Entry"."Due Date";
                    IF (Arrears >= 1) AND (Arrears < 8) THEN
                        Dunning := Dunning::"Dunning 1"
                    ELSE
                        IF (Arrears >= 8) AND (Arrears < 16) THEN
                            Dunning := Dunning::"Dunning 2"
                        ELSE
                            IF (Arrears >= 16) AND (Arrears < 31) THEN
                                Dunning := Dunning::"Dunning 3"
                            ELSE
                                IF Arrears >= 31 THEN BEGIN
                                    Dunning := Dunning::"Dunning 4";
                                    DunReminder := TRUE;
                                END ELSE
                                    Dunning := Dunning::"Dunning 0";
                end;

                trigger OnPreDataItem()
                begin
                    CLEAR(Arrears);
                    "Cust. Ledger Entry".SETFILTER("Cust. Ledger Entry"."Due Date", '<%1', TODAY);//ZE.RSF.1095
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Customer.CALCFIELDS(Balance);
                Balance := Customer.Balance;
                DunReminder := FALSE;
                PayTerms.RESET();
                if PayTerms.Get(Customer."Payment Terms Code") then
                    PayTermsDesc := PayTerms.Description
                else
                    Clear(PayTermsDesc);
            end;

            trigger OnPreDataItem()
            begin
                IF STRLEN(Customer.GETFILTER("No.")) < 3 THEN
                    ERROR('Customer filter is not applied');
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

    trigger OnInitReport()
    begin
        CompanyInfo.GET();
        CompanyInfo.CALCFIELDS(Picture);
    end;

    var
        PayTerms: Record "Payment Terms";
        CompanyInfo: Record "Company Information";
        Arrears: Integer;
        Dunning: Option "Dunning 0","Dunning 1","Dunning 2","Dunning 3","Dunning 4";
        PayTermsDesc: Text[250];
        DunReminder: Boolean;
        Txt00001_Lbl: Label 'Statement of overdue outstanding as on';
        Txt00002_Lbl: Label 'Please release the payments as per the below open items at the earliest.';
        Txt00003_Lbl: Label 'Dear Sir / Madam,';
        Txt00004_Lbl: Label 'Please remit your payment of';
        Txt00005_Lbl: Label 'as soon as possible.';
        Txt00006_Lbl: Label 'Terms:';
}

