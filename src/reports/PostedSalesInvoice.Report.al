namespace WM.WeidmullerDEV;

using Microsoft.Assembly.History;
using Microsoft.CRM.Segment;
using Microsoft.CRM.Team;
using Microsoft.Finance.Currency;
using Microsoft.Finance.Dimension;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Finance.GST.Base;
using Microsoft.Finance.TaxBase;
using Microsoft.Finance.TaxEngine.TaxTypeHandler;
using Microsoft.Finance.TCS.TCSBase;
using Microsoft.Foundation.Address;
using Microsoft.Foundation.Company;
using Microsoft.Foundation.PaymentTerms;
using Microsoft.Foundation.Shipping;
using Microsoft.Foundation.UOM;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Ledger;
using Microsoft.Inventory.Location;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;
using Microsoft.Sales.History;
using Microsoft.Sales.Receivables;
using Microsoft.Sales.Reminder;
using Microsoft.Sales.Setup;
using System.Globalization;
using System.Utilities;

report 50005 "Posted Sales Invoice"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'src/reportlayout/PostedSalesInvoice.rdl';

    Caption = 'Sales - Invoice';
    Permissions = TableData "Sales Shipment Buffer" = rimd;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Invoice';
            column(BillToCustNo_SalesInvHdrCaption; "Sales Invoice Header".FIELDCAPTION("Bill-to Customer No."))
            {
            }
            column(PricesInclVAT_SalesInvHdrCaption; "Sales Invoice Header".FIELDCAPTION("Prices Including VAT"))
            {
            }
            column(BillToCustomerNo_SalesInvHdr; "Sales Invoice Header"."Bill-to Customer No.")
            {
            }
            column(ExtDocNo_SalesInvHdr; SH."External Document No.")
            {
            }
            column(ShippingAgentCode_SalesInvoiceHeader; SACode)
            {
            }
            column(No_SalesInvHdr; "No.")
            {
            }
            column(CustomerReferencenoCaption; CustomerReferencenoCaptionLbl)
            {
            }
            column(LineTotalCaption1; LineTotalCaptionLbl1)
            {
            }
            column(TotalNoofBoxes_SalesInvoiceHeader; "Sales Invoice Header"."Total No of Boxes")
            {
            }
            column(TotalWeight_SalesInvoiceHeader; "Sales Invoice Header"."Total Weight")
            {
            }
            column(ShipFromCaption; ShipFromCaptionLbl)
            {
            }
            column(InvDiscountAmountCaption; InvDiscountAmountCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(PaymentTermsCaption; PaymentTermsCaptionLbl)
            {
            }
            column(ShipmentMethodCaption; ShipmentMethodCaptionLbl)
            {
            }
            column(StateCaption; StateCaptionLbl)
            {
            }
            column(CodeCaption; CodeCaptionLbl)
            {
            }
            column(GSTRegistrationCaption; GSTRegistrationCaptionLbl)
            {
            }
            column(PANCaption; PANCaptionLbl)
            {
            }
            column(GSTINCaption; GSTINCaptionLbl)
            {
            }
            column(LUTCaptionlbl; LUTCaptionlbl)
            {
            }
            column(CustomerIDCaption; CustomerIDCaptionLbl)
            {
            }
            column(CustomerPOCaption; CustomerPOCaptionLbl)
            {
            }
            column(PACKINGMARKSCaption; PACKINGMARKSCaptionLbl)
            {
            }
            column(PackingDetailsCaption; PackingDetailsCaptionLbl)
            {
            }
            column(WeightCaption; WeightCaptionLbl)
            {
            }
            column(GCaption; GCaptionLbl)
            {
            }
            column(NCaption; NCaptionLbl)
            {
            }
            column(ModeOfShipmentCaption; ModeOfShipmentCaptionLbl)
            {
            }
            column(TRANSPORTERCaption; TRANSPORTERCaptionLbl)
            {
            }
            column(CurrencyCaption; CurrencyCaptionLbl)
            {
            }
            column(IncoTermsCaption; IncoTermsCaptionLbl)
            {
            }
            column(TrackingCaption; TrackingCaptionLbl)
            {
            }
            column(DELIVERYDATECaption; DELIVERYDATECaptionLbl)
            {
            }
            column(PhoneCaption; PhoneCaptionLbl)
            {
            }
            column(WebCaption; WebCaptionLbl)
            {
            }
            column(TaxInvoiceCaption; TaxInvoiceCaptionLbl)
            {
            }
            column(BillToCaption; BillToCaptionLbl)
            {
            }
            column(ShipToCaption; ShipToCaptionLbl)
            {
            }
            column(InvoiceNoCaption; InvoiceNoCaptionLbl)
            {
            }
            column(PostingDateCaption; PostingDateCaptionLbl)
            {
            }
            column(BankDetailsCaption; BankDetailsCaptionLbl)
            {
            }
            column(BankNameCaption; BankNameCaptionLbl)
            {
            }
            column(BankAccNoCaption; BankAccNoCaptionLbl)
            {
            }
            column(IFSCodeCaption; IFSCodeCaptionLbl)
            {
            }
            column(BranchCaption; BranchCaptionLbl)
            {
            }
            column(NoteCaption; NoteCaptionLbl)
            {
            }
            column(ADVANCECaption; ADVANCECaptionLbl)
            {
            }
            column(FRIEGHTCaption; FRIEGHTCaptionLbl)
            {
            }
            column(INSURANCECaption; INSURANCECaptionLbl)
            {
            }
            column(PFCaption; PFCaptionLbl)
            {
            }
            column(ROUNDOFFCaption; ROUNDOFFCaptionLbl)
            {
            }
            column(TotalAmount; TotalAmount)
            {
            }
            column(AmtInWordsCaption; AmtInWordsCaptionLbl)
            {
            }
            column(POdateCaption; POdateCaptionLbl)
            {
            }
            column(Location_Code; Location1.Code)
            {
            }
            column(Location_Name; Location1.Name)
            {
            }
            column(Location_Name2; Location1."Name 2")
            {
            }
            column(Location_Contact; Location1.Contact)
            {
            }
            column(Location_Address; Location1.Address)
            {
            }
            column(Location_Address2; Location1."Address 2")
            {
            }
            column(Location_City; Location1.City)
            {
            }
            column(Location_PostCode; Location1."Post Code")
            {
            }
            column(Location_County; Location1.County)
            {
            }
            column(Location_CountryRegionCode; Location1."Country/Region Code")
            {
            }
            column(ShipmentMethodCode_SalesInvoiceHeader; SH."Shipment Method Code")
            {
            }
            column(DigitalSig; DigitalSig)
            {
            }
            column(GTCSPercentage; GTCSPercentage)
            {
            }
            column(GTCSAmount; GTCSAmount)
            {
            }
            column(QRCode; "QR Code")
            {
            }
            column(IRNHash_SalesInvoiceHeader; "IRN Hash")
            {
            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(TotalAmtInWords; TotalAmtInWords[1])
                    {
                    }
                    column(Rounding; RoundOff)
                    {
                    }
                    column(CompanyInfo1_Name; CompanyInfo1.Name)
                    {
                    }
                    column(CompanyInfo_DigitalSig; CompanyInfo1."Digital Signature")
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(DocumentCaptionCopyText; STRSUBSTNO(DocumentCaption(), CopyText))
                    {
                    }
                    column(CompanyInfo_GST_RegistrationNo; CompanyInfo."GST Registration No.")
                    {
                    }
                    column(Phone_CompanyInfo; CompanyInfo."Phone No.")
                    {
                    }
                    column(HomePage_CompanyInfo; CompanyInfo."Home Page 2")
                    {
                    }
                    column(LUTNo_CompanyInfo; CompanyInfo."LUT No.")
                    {
                    }
                    column(Customer_GST_RegistrationNo; Customer."GST Registration No.")
                    {
                    }
                    column(Customer_PAN; Customer."P.A.N. No.")
                    {
                    }
                    column(Customer_StateCode; Customer."State Code")
                    {
                    }
                    column(StateName; StateName)
                    {
                    }
                    column(GSTComponentCode1; CGSTLbl + ' Amount')
                    {
                    }
                    column(GSTComponentCode2; SGSTLbl + ' Amount')
                    {
                    }
                    column(GSTComponentCode3; IGSTLbl + ' Amount')
                    {
                    }
                    column(GSTComponentCode4; CessLbl + 'Amount')
                    {
                    }
                    column(GSTCompAmount1; ABS(CGSTAmt))
                    {
                    }
                    column(GSTCompAmount2; ABS(IGSTAmt))
                    {
                    }
                    column(GSTCompAmount3; ABS(SGSTAmt))
                    {
                    }
                    column(GSTCompAmount4; ABS(CessAmt))
                    {
                    }
                    column(GSTCompPer1; CGSTPer)
                    {
                    }
                    column(GSTCompPer2; IgstPer)
                    {
                    }
                    column(GSTCompPer3; SGSTPer)
                    {
                    }
                    column(IsGSTApplicable; IsGSTApplicable)
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(ShipToAddr1; ShipToAddr[1])
                    {
                    }
                    column(ShipToAddr2; ShipToAddr[2])
                    {
                    }
                    column(ShipToAddr3; ShipToAddr[3])
                    {
                    }
                    column(ShipToAddr4; ShipToAddr[4])
                    {
                    }
                    column(ShipToAddr5; ShipToAddr[5])
                    {
                    }
                    column(ShipToAddr6; ShipToAddr[6])
                    {
                    }
                    column(ShipToStateName; ShipToStateName)
                    {
                    }
                    column(ShipToAddress_State; ShipToAddress.State)
                    {
                    }
                    column(ShipToAddress_GSTIN; ShipToAddress."GST Registration No.")
                    {
                    }
                    column(PaymentTermsDescription; PaymentTerms.Description)
                    {
                    }
                    column(ShipmentMethodDescription; ShipmentMethod.Description)
                    {
                    }
                    column(CompanyInfoGSTIN; CompanyInfo."GST Registration No.")
                    {
                    }
                    column(CompanyInfoPAN; CompanyInfo."P.A.N. No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(CompanyInfoBankBranchNo; CompanyInfo."Bank Branch No.")
                    {
                    }
                    column(CompanyInfo_IFSC_Code; CompanyInfo."IFSC Code")
                    {
                    }
                    column(BillToCustNo_SalesInvHdr; "Sales Invoice Header"."Bill-to Customer No.")
                    {
                    }
                    column(PostingDate_SalesInvHdr; FORMAT("Sales Invoice Header"."Posting Date", 0, 4))
                    {
                    }
                    column(DocumentDate_SalesInvoiceHeader; FORMAT("Sales Invoice Header"."Document Date", 0, 4))
                    {
                    }
                    column(DueDate_SalesInvoiceHdr; FORMAT("Sales Invoice Header"."Due Date", 0, 4))
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(PricesInclVAT_SalesInvHdr; "Sales Invoice Header"."Prices Including VAT")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVATYesNo; FORMAT("Sales Invoice Header"."Prices Including VAT"))
                    {
                    }
                    column(PageCaption; PageCaptionCap)
                    {
                    }
                    column(Currency_SalesInvHdr; Currency)
                    {
                    }
                    column(NoOfPrint; NoOfPrint)
                    {
                    }
                    column(GTitle; GTitle)
                    {
                    }
                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(Item_Description2; Item."Description 2")
                        {
                        }
                        column(SL; SL)
                        {
                        }
                        column(LineType; LineType)
                        {
                        }
                        column(LineAmount_SalesInvLine; "Line Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(Desc_SalesInvLine; Description)
                        {
                        }
                        column(Desc_; Desc)
                        {
                        }
                        column(Desc1_; Desc1)
                        {
                        }
                        column(Desc2_; Desc2)
                        {
                        }
                        column(No_SalesInvLine; "No.")
                        {
                        }
                        column(Qty_SalesInvLine; Quantity)
                        {
                        }
                        column(UOM_SalesInvoiceLine; "Unit of Measure")
                        {
                        }
                        column(UnitPrice_SalesInvLine; "Unit Price")
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
                            AutoFormatType = 2;
                        }
                        column(LineDiscount_SalesInvLine; "Line Discount %")
                        {
                        }
                        column(LineDiscount_SalesInvLineAmount; "Line Discount Amount")
                        {
                        }
                        column(LineAmountGst; LineAmountGst)
                        {
                        }
                        column(Amt__SalesInvLine; "Sales Invoice Line".Amount)
                        {
                        }
                        column(SalesLineType; FORMAT("Sales Invoice Line".Type))
                        {
                        }
                        column(InvDiscountAmount; -"Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(TotalSubTotal; TotalSubTotal)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInvoiceDiscAmount; TotalInvoiceDiscountAmount)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(SalesInvoiceLineAmount; Amount)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(AmtInclVAT_SalesInvLine; AmountToCustomer())
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TaxAmount_SalesInvLine; 0)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxAmt; ServiceTaxAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(ChargesAmount; ChargesAmount)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(OtherTaxesAmount; OtherTaxesAmount + OtherCharges)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(InsuranceCharges; InsuranceCharges)
                        {
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(TotalAmountVAT; TotalAmountVAT)
                        {
                        }
                        column(LineNo_SalesInvLine; "Line No.")
                        {
                        }
                        column(SLNoCaption; SLNoCaptionLbl)
                        {
                        }
                        column(HSNCaption; HSNCaptionLbl)
                        {
                        }
                        column(GenDescCaption; GenDescCaptionLbl)
                        {
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(ASSESSABLEVALUECaption; ASSESSABLEVALUECaptionLbl)
                        {
                        }
                        column(Description_SalesInvLineCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(No_SalesInvoiceLineCaption; No_SalesInvoiceLineCaptionLbl)
                        {
                        }
                        column(Quantity_SalesInvoiceLineCaption; QtyCaptionLbl)
                        {
                        }
                        column(UOM_SalesInvoiceLineCaption; UOMCaptionLbl)
                        {
                        }
                        column(ValueCaption; ValueCaptionLbl)
                        {
                        }
                        column(IGSTCaption; IGSTCaptionLbl)
                        {
                        }
                        column(CGSTCaption; CGSTCaptionLbl)
                        {
                        }
                        column(SGSTCaption; SGSTCaptionLbl)
                        {
                        }
                        column(LineTotalCaption; LineTotalCaptionLbl)
                        {
                        }
                        column(PercentageCaption; PercentageCaptionLbl)
                        {
                        }
                        column(ShipmentCaption; ShipmentCaptionLbl)
                        {
                        }
                        column(HSNSACCode_SalesInvoiceLine; "Sales Invoice Line"."HSN/SAC Code")
                        {
                        }
                        column(CrossReferenceNo_SalesInvoiceLine; "Sales Invoice Line"."Item Reference No.")
                        {
                        }
                        column(TotalGSTAmount_SalesInvoiceLine; CGSTAmt + SGSTAmt + IGSTAmt + CessAmt)
                        {
                        }
                        column(GSTJurisdictionType_SalesInvoiceLine; GSTJurisdiction)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            // if "Sales Invoice Line"."No." = '' then
                            //     CurrReport.Skip();
                            IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::Item THEN
                                SL += 1;
                            CLEAR(LineType);
                            LineType := "Sales Invoice Line".Type.AsInteger();
                            PostedShipmentDate := 0D;
                            IF Quantity <> 0 THEN
                                PostedShipmentDate := FindPostedShipmentDate();

                            IF (Type = Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "No." := '';

                            CLEAR(Item);
                            IF "Sales Invoice Line"."No." <> '' THEN
                                IF Item.GET("Sales Invoice Line"."No.") THEN;

                            IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::"G/L Account" THEN BEGIN
                                IF "Sales Invoice Line".Description = 'Paisa Roundoff' THEN BEGIN
                                    TotalSubTotal += 0;
                                    Item."Description 2" := '';
                                END ELSE
                                    TotalSubTotal += "Sales Invoice Line"."Line Amount"
                            END ELSE
                                TotalSubTotal += "Sales Invoice Line"."Line Amount";

                            TotalInvoiceDiscountAmount -= "Inv. Discount Amount";
                            //TotalAmount += Amount;
                            TotalAmountVAT += "Amount Including VAT" - Amount;
                            // TotalAmountInclVAT += "Amount Including VAT";
                            TotalPaymentDiscountOnVAT += -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT");
                            TotalAmountInclVAT += AmountToCustomer();

                            GetSalesGSTAmount("Sales Invoice Header", "Sales Invoice Line");

                            IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::"G/L Account" THEN
                                IF "Sales Invoice Line".Description = 'Paisa Roundoff' THEN
                                    RoundOff := "Sales Invoice Line"."Line Amount";

                            CLEAR(Desc);
                            CLEAR(Desc1);
                            CLEAR(Desc2);
                            CLEAR(SalesShipmentHeader1);
                            CLEAR(SalesInvoiceLine1);
                            IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::" " THEN BEGIN
                                IF "Sales Invoice Line"."No." = '' THEN BEGIN
                                    SalesInvoiceLine1.RESET();
                                    SalesInvoiceLine1.SETRANGE(SalesInvoiceLine1."Document No.", "Sales Invoice Header"."No.");
                                    SalesInvoiceLine1.SETFILTER(SalesInvoiceLine1."Line No.", '>%1', "Sales Invoice Line"."Line No.");
                                    IF SalesInvoiceLine1.FINDFIRST() THEN
                                        IF SalesShipmentHeader1.GET(SalesInvoiceLine1."Shipment No.") THEN BEGIN
                                            Desc := "Sales Invoice Line".Description;
                                            SalesOrder.RESET();
                                            SalesOrder.SETFILTER(SalesOrder."No.", SalesShipmentHeader1."Order No.");
                                            IF SalesOrder.FINDFIRST() THEN BEGIN
                                                Desc1 := 'PO No.:' + '' + SalesShipmentHeader1."External Document No.";
                                                Desc2 := 'PO Date.:' + FORMAT(SalesOrder."Document Date");
                                            END ELSE
                                                Desc1 := 'PO No.:' + '' + SalesShipmentHeader1."External Document No.";
                                        END;
                                END;
                            end ELSE
                                Desc := "Sales Invoice Line".Description;
                            LineAMtToCustomer += AmountToCustomer();
                        end;

                        trigger OnPreDataItem()
                        begin
                            SalesShipmentBuffer.RESET();
                            SalesShipmentBuffer.DELETEALL();
                            FirstValueEntryNo := 0;
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) AND (Amount = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK();
                            SETRANGE("Line No.", 0, "Line No.");
                            SL := 0;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number > 1 THEN BEGIN
                        CopyText := Text003;
                        OutputNo += 1;
                    END;

                    IF NoOfPrint THEN BEGIN
                        CLEAR(GTitle);
                        IF OutputNo = 1 THEN
                            GTitle := 'ORIGINAL FOR BUYER';
                        IF OutputNo = 2 THEN
                            GTitle := 'DUPLICATE FOR TRANSPORTER';
                        IF OutputNo = 3 THEN
                            GTitle := 'TRIPLICATE FOR TRANSPORTER';
                        IF OutputNo = 4 THEN
                            GTitle := 'EXTRA';
                    END;

                    TotalSubTotal := 0;
                    TotalInvoiceDiscountAmount := 0;
                    TotalAmountVAT := 0;
                    TotalAmountInclVAT := 0;
                    TotalPaymentDiscountOnVAT := 0;
                    TotalExciseAmt := 0;
                    TotalTaxAmt := 0;
                    ServiceTaxAmount := 0;
                    ServiceTaxeCessAmount := 0;
                    ServiceTaxSHECessAmount := 0;
                    ServiceTaxSBCAmount := 0;
                    KKCessAmount := 0;

                    OtherTaxesAmount := 0;
                    ChargesAmount := 0;
                    InsuranceCharges := 0;
                    OtherCharges := 0;
                    AppliedServiceTaxSHECessAmt := 0;
                    AppliedServiceTaxECessAmt := 0;
                    AppliedServiceTaxAmt := 0;
                    AppliedServiceTaxSBCAmt := 0;
                    AppliedKKCessAmt := 0;
                    ServiceTaxSHECessAmt := 0;
                    ServiceTaxECessAmt := 0;
                    ServiceTaxAmt := 0;
                    ServiceTaxSBCAmt := 0;
                    KKCessAmt := 0;
                    TotalTCSAmount := 0;
                end;

                trigger OnPostDataItem()
                begin
                    IF NOT CurrReport.PREVIEW THEN
                        SalesInvCountPrinted.RUN("Sales Invoice Header");
                end;

                trigger OnPreDataItem()
                begin
                    IF NoOfPrint THEN//SE-E969
                        NoOfCopies := 3;//SE-E969
                    NoOfLoops := ABS(NoOfCopies) + Cust."Invoice Copies" + 1;
                    IF NoOfLoops <= 0 THEN
                        NoOfLoops := 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            var
                States: Record State;
                NumToWords: Codeunit AmountToWords;
            begin
                //CurrReport.LANGUAGE := LanguageVar.get("Language Code");
                IsGSTApplicable := CheckGSTDoc("Sales Invoice Line");
                Customer.GET("Bill-to Customer No.");
                States.RESET();
                IF States.GET(Customer."State Code") THEN
                    StateName := States.Description;
                ShipToAddress.RESET();
                IF ShipToAddress.GET("Sales Invoice Header"."Sell-to Customer No.", "Sales Invoice Header"."Ship-to Code") THEN BEGIN
                    States.RESET();
                    IF States.GET(ShipToAddress.State) THEN
                        ShipToStateName := States.Description;
                END;
                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                    FormatAddr.Company(CompanyAddr, CompanyInfo);

                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                IF "Order No." = '' THEN
                    OrderNoText := ''
                ELSE
                    OrderNoText := FIELDCAPTION("Order No.");
                IF "Salesperson Code" = '' THEN BEGIN
                    SalesPurchPerson.INIT();
                    SalesPersonText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Salesperson Code");
                    SalesPersonText := Text000;
                END;
                IF "Your Reference" = '' THEN
                    ReferenceText := ''
                ELSE
                    ReferenceText := FIELDCAPTION("Your Reference");
                IF "VAT Registration No." = '' THEN
                    VATNoText := ''
                ELSE
                    VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                    GLSetup.TESTFIELD("LCY Code");
                    TotalText := STRSUBSTNO(Text001, GLSetup."LCY Code");
                    TotalInclVATText := STRSUBSTNO(Text13700, GLSetup."LCY Code");
                    TotalExclVATText := STRSUBSTNO(Text13701, GLSetup."LCY Code");
                END ELSE BEGIN
                    TotalText := STRSUBSTNO(Text001, "Currency Code");
                    TotalInclVATText := STRSUBSTNO(Text13700, "Currency Code");
                    TotalExclVATText := STRSUBSTNO(Text13701, "Currency Code");
                END;
                FormatAddr.SalesInvBillTo(CustAddr, "Sales Invoice Header");
                IF NOT Cust.GET("Bill-to Customer No.") THEN
                    CLEAR(Cust);

                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT()
                ELSE BEGIN
                    PaymentTerms.GET("Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Language Code");
                END;
                IF "Shipment Method Code" = '' THEN
                    ShipmentMethod.INIT()
                ELSE BEGIN
                    ShipmentMethod.GET("Shipment Method Code");
                    ShipmentMethod.TranslateDescription(ShipmentMethod, "Language Code");
                END;
                FormatAddr.SalesInvShipTo(ShipToAddr, CustAddr, "Sales Invoice Header");

                GetLineFeeNoteOnReportHist("No.");

                TotalAmount := "Sales Invoice Header".AmountToCustomer();
                NumToWords.InitTextVariable();
                NumToWords.FormatNoText(TotalAmtInWords, TotalAmount, "Sales Invoice Header"."Currency Code");

                CLEAR(Currency);
                IF "Sales Invoice Header"."Currency Code" = '' THEN
                    Currency := 'INR'
                ELSE
                    Currency := "Sales Invoice Header"."Currency Code";
                IF "Sales Invoice Header"."Location Code" <> '' THEN
                    IF NOT Location1.GET("Sales Invoice Header"."Location Code") THEN
                        Location1.INIT();

                CLEAR(SalesShipmentHeader);
                CLEAR(SH);
                SalesInvoiceLine.RESET();
                SalesInvoiceLine.SETRANGE(SalesInvoiceLine."Document No.", "Sales Invoice Header"."No.");
                SalesInvoiceLine.SETFILTER(SalesInvoiceLine.Type, '%1', SalesInvoiceLine.Type::Item);
                IF SalesInvoiceLine.FINDFIRST() THEN
                    IF SalesShipmentHeader.GET(SalesInvoiceLine."Shipment No.") THEN
                        IF SH.GET(SH."Document Type"::Order, SalesShipmentHeader."Order No.") THEN;
                CLEAR(SACode);
                IF "Sales Invoice Header"."Shipping Agent Code" <> '' THEN
                    SACode := "Sales Invoice Header"."Shipping Agent Code"
                ELSE
                    SACode := SH."Shipping Agent Code";


                CLEAR(GSTJurisdiction);
                SalesInvoiceLine2.RESET();
                SalesInvoiceLine2.SETFILTER(SalesInvoiceLine2."Document No.", "Sales Invoice Header"."No.");
                SalesInvoiceLine2.SETRANGE(SalesInvoiceLine2.Type, SalesInvoiceLine2.Type::Item);
                IF SalesInvoiceLine2.FINDFIRST() THEN BEGIN
                    IF SalesInvoiceLine2."GST Jurisdiction Type" = SalesInvoiceLine2."GST Jurisdiction Type"::Interstate THEN
                        GSTJurisdiction := 'Interstate';
                    IF SalesInvoiceLine2."GST Jurisdiction Type" = SalesInvoiceLine2."GST Jurisdiction Type"::Intrastate THEN
                        GSTJurisdiction := 'Intrastate';
                END;

                CLEAR(GTCSPercentage);
                CLEAR(GTCSAmount);
                GrecTCS.RESET();
                GrecTCS.SETRANGE("Document No.", "Sales Invoice Header"."No.");
                IF GrecTCS.FINDFIRST() THEN
                    IF GrecTCS."Document Type" = GrecTCS."Document Type"::Invoice THEN BEGIN
                        GTCSPercentage := GrecTCS."TCS %";
                        GTCSAmount := GrecTCS."TCS Amount Including Surcharge";
                    END;

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
                group(Options)
                {
                    Caption = 'Options';
                    field("No. of Print"; NoOfPrint)
                    {
                        Caption = 'No. of Print';
                        ToolTip = 'Specifies whether to print the invoice multiple times.';
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            //SE-E969
                            IF (NoOfPrint) THEN
                                ControlBool := TRUE;
                            IF (NoOfCopies > 0) THEN
                                ERROR('No. of Copy have value');
                            //SE-E969
                        end;
                    }
                    field("Digital Signature"; DigitalSig)
                    {
                        Caption = 'Digital Signature';
                        ToolTip = 'Specifies whether to print the digital signature on the invoice.';
                        ApplicationArea = All;
                    }
                    field(NoOfCopies; NoOfCopies)
                    {
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies the number of copies to print for the invoice.';
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            //SE-E969
                            IF (ControlBool) AND (NoOfCopies > 0) THEN
                                ERROR('No. of print is enable.');
                            //SE-E969
                        end;
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies whether to show internal information on the invoice.';
                        ApplicationArea = All;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies whether to log interaction for this report.';
                        ApplicationArea = All;
                    }
                    field(DisplayAsmInformation; DisplayAssemblyInformation)
                    {
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies whether to display assembly components on the invoice.';
                        ApplicationArea = All;
                    }
                    field(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
                    {
                        Caption = 'Show Additional Fee Note';
                        ToolTip = 'Specifies whether to display additional fee notes on the invoice.';
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := TRUE;
            CLEAR(NoOfPrint);//SE-E969
            CLEAR(DigitalSig);//SE-E969
            CLEAR(ControlBool);//SE-E969
            CLEAR(GTitle);//SE-E969
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction();
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        GLSetup.GET();
        CompanyInfo.GET();
        SalesSetup.GET();
        CompanyInfo.VerifyAndSetPaymentInfo();
        CompanyInfo1.GET();
        CompanyInfo1.CALCFIELDS(Picture);
        CompanyInfo1.CALCFIELDS("Digital Signature");
    end;

    trigger OnPreReport()
    begin
        IF NOT CurrReport.USEREQUESTPAGE THEN
            InitLogInteraction();
    end;

    var
#pragma warning disable
        LanguageVar: Record Language;
        Text000: Label 'Salesperson';
        Text001: Label 'GRAND TOTAL %1';
        Text003: Label ' COPY';
        Text004: Label 'Sales - Invoice%1';
        PageCaptionCap: Label 'Page %1 of %2';
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";

        Customer: Record "Customer";
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        SalesSetup: Record "Sales & Receivables Setup";
        Cust: Record Customer;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        CurrExchRate: Record "Currency Exchange Rate";
        TempPostedAsmLine: Record "Posted Assembly Line" temporary;
        TempLineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist." temporary;
        SalesInvCountPrinted: Codeunit "Sales Inv.-Printed";
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit SegManagement;
        SalesShipmentBuffer: Record "Sales SHipment Buffer" temporary;
        GSTCompAmount: array[20] of Decimal;
        GSTCompPer: array[20] of Decimal;
        GSTComponentCode: array[20] of Code[10];
        PostedShipmentDate: Date;
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        OrderNoText: Text[80];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        i: Integer;
        NextEntryNo: Integer;
        FirstValueEntryNo: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        Text008: Label 'Local Currency';
        VALExchRate: Text[50];
        Text009: Label 'Exchange rate: %1/%2';
        CalculatedExchRate: Decimal;
        Text010: Label 'Sales - Prepayment Invoice %1';
        OutputNo: Integer;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        TotalPaymentDiscountOnVAT: Decimal;
        ChargesAmount: Decimal;
        OtherTaxesAmount: Decimal;
        Text13700: Label 'Total %1 Incl. Taxes';
        Text13701: Label 'Total %1 Excl. Taxes';
        SupplementaryText: Text[30];
        Text16500: Label 'Supplementary Invoice';
        ServiceTaxAmt: Decimal;
        ServiceTaxECessAmt: Decimal;
        AppliedServiceTaxAmt: Decimal;
        AppliedServiceTaxECessAmt: Decimal;
        ServiceTaxSHECessAmt: Decimal;
        AppliedServiceTaxSHECessAmt: Decimal;
        TotalTaxAmt: Decimal;
        TotalExciseAmt: Decimal;
        TotalTCSAmount: Decimal;
        ServiceTaxAmount: Decimal;
        ServiceTaxeCessAmount: Decimal;
        ServiceTaxSHECessAmount: Decimal;
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        BankDetailsCaptionLbl: Label 'BANK DETAILS';
        BankNameCaptionLbl: Label 'Bank Name';
        BankAccNoCaptionLbl: Label 'Account #';
        IFSCodeCaptionLbl: Label 'IFS Code';
        BranchCaptionLbl: Label 'Branch';
        InvoiceNoCaptionLbl: Label 'Invoice No.';
        PostingDateCaptionLbl: Label 'Invoice Date';
        UnitPriceCaptionLbl: Label 'Unit Price';
        DiscountCaptionLbl: Label 'Discount %';
        AmountCaptionLbl: Label 'Amt';
        LineDiscountCaptionLbl: Label 'Line Discount Amount';
        SubtotalCaptionLbl: Label 'Subtotal';
        ChargesAmountCaptionLbl: Label 'Charges Amount';
        OtherTaxesAmountCaptionLbl: Label 'Other Taxes Amount';
        LineAmountCaptionLbl: Label 'Line Amount';
        ShipToAddressCaptionLbl: Label 'Ship-to Address';
        ServiceTaxRegistrationNo: Code[20];
        InvDiscountAmountCaptionLbl: Label 'Invoice Discount Amount';
        VATPercentageCaptionLbl: Label 'VAT %';
        TotalCaptionLbl: Label 'Total';
        PaymentTermsCaptionLbl: Label 'Payment Terms';
        ShipmentMethodCaptionLbl: Label 'Shipment Method';
        EMailCaptionLbl: Label 'E-Mail';
        DocumentDateCaptionLbl: Label 'Document Date';
        DisplayAdditionalFeeNote: Boolean;
        ServiceTaxSBCAmount: Decimal;
        ServiceTaxSBCAmt: Decimal;
        AppliedServiceTaxSBCAmt: Decimal;
        KKCessAmount: Decimal;
        KKCessAmt: Decimal;
        AppliedKKCessAmt: Decimal;
        IsGSTApplicable: Boolean;
        J: Integer;
        ShipToAddress: Record "Ship-to Address";
        StateName: Text[50];
        ShipToStateName: Text[50];
        StateCaptionLbl: Label 'State';
        CodeCaptionLbl: Label 'Code';
        GSTRegistrationCaptionLbl: Label 'GST#';
        PANCaptionLbl: Label 'PAN#';
        LUTCaptionlbl: Label 'LUT#';
        GSTINCaptionLbl: Label 'GSTIN';
        CustomerIDCaptionLbl: Label 'Customer ID';
        CustomerPOCaptionLbl: Label 'Customer PO';
        PACKINGMARKSCaptionLbl: Label 'Packing Marks';
        PackingDetailsCaptionLbl: Label 'Packing Details';
        WeightCaptionLbl: Label 'WEIGHT(KG)';
        GCaptionLbl: Label 'G';
        NCaptionLbl: Label 'N';
        ModeOfShipmentCaptionLbl: Label 'Mode Of Shipment';
        TRANSPORTERCaptionLbl: Label 'Transporter';
        CurrencyCaptionLbl: Label 'Currency';
        IncoTermsCaptionLbl: Label 'Incoterms';
        TrackingCaptionLbl: Label 'Tracking #';
        DELIVERYDATECaptionLbl: Label 'Delivery Date';
        PhoneCaptionLbl: Label 'Phone: ';
        WebCaptionLbl: Label 'Web: ';
        TaxInvoiceCaptionLbl: Label 'Tax Invoice';
        BillToCaptionLbl: Label 'BILL TO:';
        ShipToCaptionLbl: Label 'SHIP TO:';
        SLNoCaptionLbl: Label 'SL#';
        SL: Integer;
        GenDescCaptionLbl: Label 'General Description';
        HSNCaptionLbl: Label 'HSN# / SCA';
        UOMCaptionLbl: Label 'UOM';
        QtyCaptionLbl: Label 'Qty';
        ValueCaptionLbl: Label 'Value';
        ASSESSABLEVALUECaptionLbl: Label 'Assessable Value';
        IGSTCaptionLbl: Label 'IGST';
        CGSTCaptionLbl: Label 'CGST';
        SGSTCaptionLbl: Label 'SGST';
        LineTotalCaptionLbl: Label 'Line Total';
        PercentageCaptionLbl: Label '%';
        ShipmentCaptionLbl: Label 'Shipment';
        NoteCaptionLbl: Label 'Note: It is a computer generated document. Signature not required.';
        ADVANCECaptionLbl: Label 'ADVANCE';
        FRIEGHTCaptionLbl: Label 'FRIEGHT';
        INSURANCECaptionLbl: Label 'INSURANCE';
        PFCaptionLbl: Label 'GST AMOUNT';
        ROUNDOFFCaptionLbl: Label 'ROUND OFF';
        TotalAmtInWords: array[2] of Text[250];
        AmtInWordsCaptionLbl: Label 'Total Invoice amount in words';
        Currency: Code[10];
        InsuranceCharges: Decimal;
        OtherCharges: Decimal;
        LineType: Integer;
        POdateCaptionLbl: Label 'PO Date';
        Location1: Record Location;
        ShipFromCaptionLbl: Label 'SHIP FROM:';
        No_SalesInvoiceLineCaptionLbl: Label 'Article No';
        LineAmountGst: Decimal;
        RoundOff: Decimal;
        Item: Record Item;
        LineTotalCaptionLbl1: Label 'Line Total';
        CustomerReferencenoCaptionLbl: Label 'Customer Reference No.';
        SalesInvoiceLine: Record "Sales Invoice Line";
        SH: Record "Sales Header";
        SalesShipmentHeader: Record "Sales Shipment Header";
        Desc: Text[50];
        SalesInvoiceLine1: Record "Sales Invoice Line";
        SalesShipmentHeader1: Record "Sales Shipment Header";
        Desc1: Text[50];
        SACode: Code[10];
        GTitle: Text[30];
        NoOfPrint: Boolean;
        DigitalSig: Boolean;
        ControlBool: Boolean;
        SalesInvoiceLine2: Record "Sales Invoice Line";
        GSTJurisdiction: Text;
        SalesOrder: Record "Sales Header";
        Desc2: Text[50];
        GrecTCS: Record "TCS Entry";
        GTCSPercentage: Decimal;
        GTCSAmount: Decimal;
        LineAMtToCustomer: Decimal;
        CGSTAmt, CGSTPer : Decimal;
        SGSTAmt, SGSTPer : Decimal;
        IGSTAmt, IGSTPer : Decimal;
        CessAmt, CessPer : Decimal;
        CGSTLbl: Label 'CGST';
        SGSTLbl: Label 'SGST';
        IGSTLbl: Label 'IGST';
        CessLbl: Label 'CESS';
#Pragma warning restore AL0433

    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractionTemplateCode(4) <> '';
    end;

    procedure FindPostedShipmentDate(): Date
    var
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentBuffer2: Record "Sales Shipment Buffer" temporary;
    begin
        NextEntryNo := 1;
        IF "Sales Invoice Line"."Shipment No." <> '' THEN
            IF SalesShipmentHeader.GET("Sales Invoice Line"."Shipment No.") THEN
                EXIT(SalesShipmentHeader."Posting Date");

        IF "Sales Invoice Header"."Order No." = '' THEN
            EXIT("Sales Invoice Header"."Posting Date");

        CASE "Sales Invoice Line".Type OF
            "Sales Invoice Line".Type::Item:
                GenerateBufferFromValueEntry("Sales Invoice Line");
            "Sales Invoice Line".Type::"G/L Account", "Sales Invoice Line".Type::Resource,
          "Sales Invoice Line".Type::"Charge (Item)", "Sales Invoice Line".Type::"Fixed Asset":
                GenerateBufferFromShipment("Sales Invoice Line");
            "Sales Invoice Line".Type::" ":
                EXIT(0D);
        END;

        SalesShipmentBuffer.RESET();
        SalesShipmentBuffer.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
        SalesShipmentBuffer.SETRANGE("Line No.", "Sales Invoice Line"."Line No.");
        IF SalesShipmentBuffer.FIND('-') THEN BEGIN
            SalesShipmentBuffer2 := SalesShipmentBuffer;
            IF SalesShipmentBuffer.NEXT() = 0 THEN BEGIN
                SalesShipmentBuffer.GET(
                  SalesShipmentBuffer2."Document No.", SalesShipmentBuffer2."Line No.", SalesShipmentBuffer2."Entry No.");
                SalesShipmentBuffer.DELETE();
                EXIT(SalesShipmentBuffer2."Posting Date");
            END;
            SalesShipmentBuffer.CALCSUMS(Quantity);
            IF SalesShipmentBuffer.Quantity <> "Sales Invoice Line".Quantity THEN BEGIN
                SalesShipmentBuffer.DELETEALL();
                EXIT("Sales Invoice Header"."Posting Date");
            END;
        END ELSE
            EXIT("Sales Invoice Header"."Posting Date");
    end;


    procedure GenerateBufferFromValueEntry(SalesInvoiceLine2: Record "Sales Invoice Line")
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := SalesInvoiceLine2."Quantity (Base)";
        ValueEntry.SETCURRENTKEY("Document No.");
        ValueEntry.SETRANGE("Document No.", SalesInvoiceLine2."Document No.");
        ValueEntry.SETRANGE("Posting Date", "Sales Invoice Header"."Posting Date");
        ValueEntry.SETRANGE("Item Charge No.", '');
        ValueEntry.SETFILTER("Entry No.", '%1..', FirstValueEntryNo);
        IF ValueEntry.FIND('-') THEN
            REPEAT
                IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN BEGIN
                    IF SalesInvoiceLine2."Qty. per Unit of Measure" <> 0 THEN
                        Quantity := ValueEntry."Invoiced Quantity" / SalesInvoiceLine2."Qty. per Unit of Measure"
                    ELSE
                        Quantity := ValueEntry."Invoiced Quantity";
                    AddBufferEntry(
                      SalesInvoiceLine2,
                      -Quantity,
                      ItemLedgerEntry."Posting Date");
                    TotalQuantity := TotalQuantity + ValueEntry."Invoiced Quantity";
                END;
                FirstValueEntryNo := ValueEntry."Entry No." + 1;
            UNTIL (ValueEntry.NEXT() = 0) OR (TotalQuantity = 0);
    end;


    procedure GenerateBufferFromShipment(SalesInvoiceLine: Record "Sales Invoice Line")
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine2: Record "Sales Invoice Line";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := 0;
        SalesInvoiceHeader.SETCURRENTKEY("Order No.");
        SalesInvoiceHeader.SETFILTER("No.", '..%1', "Sales Invoice Header"."No.");
        SalesInvoiceHeader.SETRANGE("Order No.", "Sales Invoice Header"."Order No.");
        IF SalesInvoiceHeader.FIND('-') THEN
            REPEAT
                SalesInvoiceLine2.SETRANGE("Document No.", SalesInvoiceHeader."No.");
                SalesInvoiceLine2.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
                SalesInvoiceLine2.SETRANGE(Type, SalesInvoiceLine.Type);
                SalesInvoiceLine2.SETRANGE("No.", SalesInvoiceLine."No.");
                SalesInvoiceLine2.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
                IF SalesInvoiceLine2.FIND('-') THEN
                    REPEAT
                        TotalQuantity := TotalQuantity + SalesInvoiceLine2.Quantity;
                    UNTIL SalesInvoiceLine2.NEXT() = 0;
            UNTIL SalesInvoiceHeader.NEXT() = 0;

        SalesShipmentLine.SETCURRENTKEY("Order No.", "Order Line No.");
        SalesShipmentLine.SETRANGE("Order No.", "Sales Invoice Header"."Order No.");
        SalesShipmentLine.SETRANGE("Order Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SETRANGE(Type, SalesInvoiceLine.Type);
        SalesShipmentLine.SETRANGE("No.", SalesInvoiceLine."No.");
        SalesShipmentLine.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
        SalesShipmentLine.SETFILTER(Quantity, '<>%1', 0);

        IF SalesShipmentLine.FIND('-') THEN
            REPEAT
                IF "Sales Invoice Header"."Get Shipment Used" THEN
                    CorrectShipment(SalesShipmentLine);
                IF ABS(SalesShipmentLine.Quantity) <= ABS(TotalQuantity - SalesInvoiceLine.Quantity) THEN
                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity
                ELSE BEGIN
                    IF ABS(SalesShipmentLine.Quantity) > ABS(TotalQuantity) THEN
                        SalesShipmentLine.Quantity := TotalQuantity;
                    Quantity :=
                      SalesShipmentLine.Quantity - (TotalQuantity - SalesInvoiceLine.Quantity);

                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity;
                    SalesInvoiceLine.Quantity := SalesInvoiceLine.Quantity - Quantity;

                    IF SalesShipmentHeader.GET(SalesShipmentLine."Document No.") THEN
                        AddBufferEntry(
                          SalesInvoiceLine,
                          Quantity,
                          SalesShipmentHeader."Posting Date");
                END;
            UNTIL (SalesShipmentLine.NEXT() = 0) OR (TotalQuantity = 0);
    end;


    procedure CorrectShipment(var SalesShipmentLine: Record "Sales Shipment Line")
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
    begin
        SalesInvoiceLine.SETCURRENTKEY("Shipment No.", "Shipment Line No.");
        SalesInvoiceLine.SETRANGE("Shipment No.", SalesShipmentLine."Document No.");
        SalesInvoiceLine.SETRANGE("Shipment Line No.", SalesShipmentLine."Line No.");
        IF SalesInvoiceLine.FIND('-') THEN
            REPEAT
                SalesShipmentLine.Quantity := SalesShipmentLine.Quantity - SalesInvoiceLine.Quantity;
            UNTIL SalesInvoiceLine.NEXT() = 0;
    end;


    procedure AddBufferEntry(SalesInvoiceLine: Record "Sales Invoice Line"; QtyOnShipment: Decimal; PostingDate: Date)
    begin
        SalesShipmentBuffer.SETRANGE("Document No.", SalesInvoiceLine."Document No.");
        SalesShipmentBuffer.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentBuffer.SETRANGE("Posting Date", PostingDate);
        IF SalesShipmentBuffer.FIND('-') THEN BEGIN
            SalesShipmentBuffer.Quantity := SalesShipmentBuffer.Quantity + QtyOnShipment;
            SalesShipmentBuffer.MODIFY();
            EXIT;
        END;

        WITH SalesShipmentBuffer DO BEGIN
            "Document No." := SalesInvoiceLine."Document No.";
            "Line No." := SalesInvoiceLine."Line No.";
            "Entry No." := NextEntryNo;
            Type := SalesInvoiceLine.Type;
            "No." := SalesInvoiceLine."No.";
            Quantity := QtyOnShipment;
            "Posting Date" := PostingDate;
            INSERT();
            NextEntryNo := NextEntryNo + 1
        END;
    end;

    local procedure DocumentCaption(): Text[250]
    begin
        IF "Sales Invoice Header"."Prepayment Invoice" THEN
            EXIT(Text010);
        EXIT(Text004);
    end;


    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; DisplayAsmInfo: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;


    procedure CollectAsmInformation()
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        PostedAsmHeader: Record "Posted Assembly Header";
        PostedAsmLine: Record "Posted Assembly Line";
        SalesShipmentLine: Record "Sales Shipment Line";
    begin
        TempPostedAsmLine.DELETEALL();
        IF "Sales Invoice Line".Type <> "Sales Invoice Line".Type::Item THEN
            EXIT;
        WITH ValueEntry DO BEGIN
            SETCURRENTKEY("Document No.");
            SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
            SETRANGE("Document Type", "Document Type"::"Sales Invoice");
            SETRANGE("Document Line No.", "Sales Invoice Line"."Line No.");
            SETRANGE(Adjustment, FALSE);
            IF NOT FINDSET() THEN
                EXIT;
        END;
        REPEAT
            IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN
                IF ItemLedgerEntry."Document Type" = ItemLedgerEntry."Document Type"::"Sales Shipment" THEN BEGIN
                    SalesShipmentLine.GET(ItemLedgerEntry."Document No.", ItemLedgerEntry."Document Line No.");
                    IF SalesShipmentLine.AsmToShipmentExists(PostedAsmHeader) THEN BEGIN
                        PostedAsmLine.SETRANGE("Document No.", PostedAsmHeader."No.");
                        IF PostedAsmLine.FINDSET() THEN
                            REPEAT
                                TreatAsmLineBuffer(PostedAsmLine);
                            UNTIL PostedAsmLine.NEXT() = 0;
                    END;
                END;
        UNTIL ValueEntry.NEXT() = 0;
    end;


    procedure TreatAsmLineBuffer(PostedAsmLine: Record "Posted Assembly Line")
    begin
        CLEAR(TempPostedAsmLine);
        TempPostedAsmLine.SETRANGE(Type, PostedAsmLine.Type);
        TempPostedAsmLine.SETRANGE("No.", PostedAsmLine."No.");
        TempPostedAsmLine.SETRANGE("Variant Code", PostedAsmLine."Variant Code");
        TempPostedAsmLine.SETRANGE(Description, PostedAsmLine.Description);
        TempPostedAsmLine.SETRANGE("Unit of Measure Code", PostedAsmLine."Unit of Measure Code");
        IF TempPostedAsmLine.FINDFIRST() THEN BEGIN
            TempPostedAsmLine.Quantity += PostedAsmLine.Quantity;
            TempPostedAsmLine.MODIFY();
        END ELSE BEGIN
            CLEAR(TempPostedAsmLine);
            TempPostedAsmLine := PostedAsmLine;
            TempPostedAsmLine.INSERT();
        END;
    end;


    procedure GetUOMText(UOMCode: Code[10]): Text[10]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        IF NOT UnitOfMeasure.GET(UOMCode) THEN
            EXIT(UOMCode);
        EXIT(UnitOfMeasure.Description);
    end;


    procedure BlanksForIndent(): Text[10]
    begin
        EXIT(PADSTR('', 2, ' '));
    end;

    local procedure GetLineFeeNoteOnReportHist(SalesInvoiceHeaderNo: Code[20])
    var
        LineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist.";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Customer: Record Customer;
    begin
        TempLineFeeNoteOnReportHist.DELETEALL();
        CustLedgerEntry.SETRANGE("Document Type", CustLedgerEntry."Document Type"::Invoice);
        CustLedgerEntry.SETRANGE("Document No.", SalesInvoiceHeaderNo);
        IF NOT CustLedgerEntry.FINDFIRST() THEN
            EXIT;

        IF NOT Customer.GET(CustLedgerEntry."Customer No.") THEN
            EXIT;

        LineFeeNoteOnReportHist.SETRANGE("Cust. Ledger Entry No", CustLedgerEntry."Entry No.");
        LineFeeNoteOnReportHist.SETRANGE("Language Code", Customer."Language Code");
        IF LineFeeNoteOnReportHist.FINDSET() THEN BEGIN
            REPEAT
                TempLineFeeNoteOnReportHist.INIT();
                TempLineFeeNoteOnReportHist.COPY(LineFeeNoteOnReportHist);
                TempLineFeeNoteOnReportHist.INSERT();
            UNTIL LineFeeNoteOnReportHist.NEXT() = 0;
        END ELSE BEGIN
            LineFeeNoteOnReportHist.SETRANGE("Language Code", LanguageVar.Code);
            IF LineFeeNoteOnReportHist.FINDSET() THEN
                REPEAT
                    TempLineFeeNoteOnReportHist.INIT();
                    TempLineFeeNoteOnReportHist.COPY(LineFeeNoteOnReportHist);
                    TempLineFeeNoteOnReportHist.INSERT();
                UNTIL LineFeeNoteOnReportHist.NEXT() = 0;
        END;
    end;

    local procedure CheckGSTDoc(SalesLine: Record "Sales Invoice Line"): Boolean
    var
        TaxTransactionValue: Record "Tax Transaction Value";
    begin
        TaxTransactionValue.Reset();
        TaxTransactionValue.SetRange("Tax Record ID", SalesLine.RecordId);
        TaxTransactionValue.SetRange("Tax Type", 'GST');
        if not TaxTransactionValue.IsEmpty then
            exit(true);
    end;

    local procedure GetSalesGSTAmount(SalesInvoiceHeader: Record "Sales Invoice Header";
    SalesInvoiceLine: Record "Sales Invoice Line")
    var
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
    begin
        Clear(IGSTAmt);
        Clear(CGSTAmt);
        Clear(SGSTAmt);
        Clear(CessAmt);
        Clear(IGSTPer);
        Clear(CGSTPer);
        Clear(SGSTPer);
        Clear(CessPer);
        DetailedGSTLedgerEntry.Reset();
        DetailedGSTLedgerEntry.SetRange("Document No.", SalesInvoiceLine."Document No.");
        DetailedGSTLedgerEntry.SetRange("Document Line No.", SalesInvoiceLine."Line No.");
        DetailedGSTLedgerEntry.SetRange("Entry Type", DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
        if DetailedGSTLedgerEntry.FindSet() then
            repeat
                if (DetailedGSTLedgerEntry."GST Component Code" = CGSTLbl) And (SalesInvoiceHeader."Currency Code" <> '') then Begin
                    CGSTAmt += Round((Abs(DetailedGSTLedgerEntry."GST Amount") * SalesInvoiceHeader."Currency Factor"), GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"));
                    CGSTPer := DetailedGSTLedgerEntry."GST %";
                End else
                    if (DetailedGSTLedgerEntry."GST Component Code" = CGSTLbl) then begin
                        CGSTAmt += Abs(DetailedGSTLedgerEntry."GST Amount");
                        CGSTPer := DetailedGSTLedgerEntry."GST %";
                    end;

                if (DetailedGSTLedgerEntry."GST Component Code" = SGSTLbl) And (SalesInvoiceHeader."Currency Code" <> '') then begin
                    SGSTAmt += Round((Abs(DetailedGSTLedgerEntry."GST Amount") * SalesInvoiceHeader."Currency Factor"), GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"));
                    SGSTPer := DetailedGSTLedgerEntry."GST %";
                end else
                    if (DetailedGSTLedgerEntry."GST Component Code" = SGSTLbl) then begin
                        SGSTAmt += Abs(DetailedGSTLedgerEntry."GST Amount");
                        SGSTPer := DetailedGSTLedgerEntry."GST %";
                    end;

                if (DetailedGSTLedgerEntry."GST Component Code" = IGSTLbl) And (SalesInvoiceHeader."Currency Code" <> '') then begin
                    IGSTAmt += Round((Abs(DetailedGSTLedgerEntry."GST Amount") * SalesInvoiceHeader."Currency Factor"), GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"));
                    IGSTPer := DetailedGSTLedgerEntry."GST %";
                end else
                    if (DetailedGSTLedgerEntry."GST Component Code" = IGSTLbl) then begin
                        IGSTAmt += Abs(DetailedGSTLedgerEntry."GST Amount");
                        IGSTPer := DetailedGSTLedgerEntry."GST %";
                    end;
                if (DetailedGSTLedgerEntry."GST Component Code" = CessLbl) And (SalesInvoiceHeader."Currency Code" <> '') then begin
                    CessAmt += Round((Abs(DetailedGSTLedgerEntry."GST Amount") * SalesInvoiceHeader."Currency Factor"), GetGSTRoundingPrecision(DetailedGSTLedgerEntry."GST Component Code"));
                    CessPer := DetailedGSTLedgerEntry."GST %";
                end
                else
                    if (DetailedGSTLedgerEntry."GST Component Code" = CessLbl) then begin
                        CessAmt += Abs(DetailedGSTLedgerEntry."GST Amount");
                        CessPer := DetailedGSTLedgerEntry."GST %";
                    end;
            until DetailedGSTLedgerEntry.Next() = 0;
    end;

    procedure GetGSTRoundingPrecision(ComponentName: Code[30]): Decimal
    var
        TaxComponent: Record "Tax Component";
        GSTSetup: Record "GST Setup";
        GSTRoundingPrecision: Decimal;
    begin
        if not GSTSetup.Get() then
            exit;
        GSTSetup.TestField("GST Tax Type");

        TaxComponent.SetRange("Tax Type", GSTSetup."GST Tax Type");
        TaxComponent.SetRange(Name, ComponentName);
        TaxComponent.FindFirst();
        if TaxComponent."Rounding Precision" <> 0 then
            GSTRoundingPrecision := TaxComponent."Rounding Precision"
        else
            GSTRoundingPrecision := 1;
        exit(GSTRoundingPrecision);
    end;
}

