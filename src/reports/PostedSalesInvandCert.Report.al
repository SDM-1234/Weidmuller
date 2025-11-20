namespace WM.WeidmullerDEV;

// report 50019 "Posted Sales Inv and Cert."
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './PostedSalesInvandCert.rdlc';

//     Caption = 'Sales - Invoice';
//     Permissions = TableData 7190 = rimd;
//     PreviewMode = PrintLayout;

//     dataset
//     {
//         dataitem("Sales Invoice Header"; "Sales Invoice Header")
//         {
//             DataItemTableView = SORTING("No.");
//             RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
//             RequestFilterHeading = 'Posted Sales Invoice';
//             column(BillToCustNo_SalesInvHdrCaption; "Sales Invoice Header".FIELDCAPTION("Bill-to Customer No."))
//             {
//             }
//             column(PricesInclVAT_SalesInvHdrCaption; "Sales Invoice Header".FIELDCAPTION("Prices Including VAT"))
//             {
//             }
//             column(BillToCustomerNo_SalesInvHdr; "Sales Invoice Header"."Bill-to Customer No.")
//             {
//             }
//             column(ExtDocNo_SalesInvHdr; SH."PO No.")
//             {
//             }
//             column(ShippingAgentCode_SalesInvoiceHeader; SACode)
//             {
//             }
//             column(No_SalesInvHdr; "No.")
//             {
//             }
//             column(CustomerReferencenoCaption; CustomerReferencenoCaptionLbl)
//             {
//             }
//             column(LineTotalCaption1; LineTotalCaptionLbl1)
//             {
//             }
//             column(TotalNoofBoxes_SalesInvoiceHeader; "Sales Invoice Header"."Total No of Boxes")
//             {
//             }
//             column(TotalWeight_SalesInvoiceHeader; "Sales Invoice Header"."Total Weight")
//             {
//             }
//             column(ShipFromCaption; ShipFromCaptionLbl)
//             {
//             }
//             column(InvDiscountAmountCaption; InvDiscountAmountCaptionLbl)
//             {
//             }
//             column(TotalCaption; TotalCaptionLbl)
//             {
//             }
//             column(PaymentTermsCaption; PaymentTermsCaptionLbl)
//             {
//             }
//             column(ShipmentMethodCaption; ShipmentMethodCaptionLbl)
//             {
//             }
//             column(StateCaption; StateCaptionLbl)
//             {
//             }
//             column(CodeCaption; CodeCaptionLbl)
//             {
//             }
//             column(GSTRegistrationCaption; GSTRegistrationCaptionLbl)
//             {
//             }
//             column(PANCaption; PANCaptionLbl)
//             {
//             }
//             column(GSTINCaption; GSTINCaptionLbl)
//             {
//             }
//             column(LUTCaptionlbl; LUTCaptionlbl)
//             {
//             }
//             column(CustomerIDCaption; CustomerIDCaptionLbl)
//             {
//             }
//             column(CustomerPOCaption; CustomerPOCaptionLbl)
//             {
//             }
//             column(PACKINGMARKSCaption; PACKINGMARKSCaptionLbl)
//             {
//             }
//             column(PackingDetailsCaption; PackingDetailsCaptionLbl)
//             {
//             }
//             column(WeightCaption; WeightCaptionLbl)
//             {
//             }
//             column(GCaption; GCaptionLbl)
//             {
//             }
//             column(NCaption; NCaptionLbl)
//             {
//             }
//             column(ModeOfShipmentCaption; ModeOfShipmentCaptionLbl)
//             {
//             }
//             column(TRANSPORTERCaption; TRANSPORTERCaptionLbl)
//             {
//             }
//             column(CurrencyCaption; CurrencyCaptionLbl)
//             {
//             }
//             column(IncoTermsCaption; IncoTermsCaptionLbl)
//             {
//             }
//             column(TrackingCaption; TrackingCaptionLbl)
//             {
//             }
//             column(DELIVERYDATECaption; DELIVERYDATECaptionLbl)
//             {
//             }
//             column(PhoneCaption; PhoneCaptionLbl)
//             {
//             }
//             column(WebCaption; WebCaptionLbl)
//             {
//             }
//             column(TaxInvoiceCaption; TaxInvoiceCaptionLbl)
//             {
//             }
//             column(BillToCaption; BillToCaptionLbl)
//             {
//             }
//             column(ShipToCaption; ShipToCaptionLbl)
//             {
//             }
//             column(InvoiceNoCaption; InvoiceNoCaptionLbl)
//             {
//             }
//             column(PostingDateCaption; PostingDateCaptionLbl)
//             {
//             }
//             column(BankDetailsCaption; BankDetailsCaptionLbl)
//             {
//             }
//             column(BankNameCaption; BankNameCaptionLbl)
//             {
//             }
//             column(BankAccNoCaption; BankAccNoCaptionLbl)
//             {
//             }
//             column(IFSCodeCaption; IFSCodeCaptionLbl)
//             {
//             }
//             column(BranchCaption; BranchCaptionLbl)
//             {
//             }
//             column(NoteCaption; NoteCaptionLbl)
//             {
//             }
//             column(ADVANCECaption; ADVANCECaptionLbl)
//             {
//             }
//             column(FRIEGHTCaption; FRIEGHTCaptionLbl)
//             {
//             }
//             column(INSURANCECaption; INSURANCECaptionLbl)
//             {
//             }
//             column(PFCaption; PFCaptionLbl)
//             {
//             }
//             column(ROUNDOFFCaption; ROUNDOFFCaptionLbl)
//             {
//             }
//             column(TotalAmount; TotalAmount)
//             {
//             }
//             column(AmtInWordsCaption; AmtInWordsCaptionLbl)
//             {
//             }
//             column(POdateCaption; POdateCaptionLbl)
//             {
//             }
//             column(Location_Code; Location1.Code)
//             {
//             }
//             column(Location_Name; Location1.Name)
//             {
//             }
//             column(Location_Name2; Location1."Name 2")
//             {
//             }
//             column(Location_Contact; Location1.Contact)
//             {
//             }
//             column(Location_Address; Location1.Address)
//             {
//             }
//             column(Location_Address2; Location1."Address 2")
//             {
//             }
//             column(Location_City; Location1.City)
//             {
//             }
//             column(Location_PostCode; Location1."Post Code")
//             {
//             }
//             column(Location_County; Location1.County)
//             {
//             }
//             column(Location_CountryRegionCode; Location1."Country/Region Code")
//             {
//             }
//             column(ShipmentMethodCode_SalesInvoiceHeader; SH."Shipment Method Code")
//             {
//             }
//             column(DigitalSig; DigitalSig)
//             {
//             }
//             dataitem(CopyLoop; Integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 dataitem(PageLoop; Integer)
//                 {
//                     DataItemTableView = SORTING(Number)
//                                         WHERE(Number = CONST(1));
//                     column(TotalAmtInWords; TotalAmtInWords[1])
//                     {
//                     }
//                     column(Rounding; RoundOff)
//                     {
//                     }
//                     column(CompanyInfo1_Name; CompanyInfo1.Name)
//                     {
//                     }
//                     column(CompanyInfo_DigitalSig; CompanyInfo1."Digital Signature")
//                     {
//                     }
//                     column(CompanyInfo1Picture; CompanyInfo1.Picture)
//                     {
//                     }
//                     column(DocumentCaptionCopyText; STRSUBSTNO(DocumentCaption, CopyText))
//                     {
//                     }
//                     column(CompanyInfo_GST_RegistrationNo; CompanyInfo."GST Registration No.")
//                     {
//                     }
//                     column(Phone_CompanyInfo; CompanyInfo."Phone No.")
//                     {
//                     }
//                     column(HomePage_CompanyInfo; CompanyInfo."Home Page")
//                     {
//                     }
//                     column(LUTNo_CompanyInfo; CompanyInfo."LUT No.")
//                     {
//                     }
//                     column(Customer_GST_RegistrationNo; Customer."GST Registration No.")
//                     {
//                     }
//                     column(Customer_PAN; Customer."P.A.N. No.")
//                     {
//                     }
//                     column(Customer_StateCode; Customer."State Code")
//                     {
//                     }
//                     column(StateName; StateName)
//                     {
//                     }
//                     column(GSTComponentCode1; GSTComponentCode[1] + ' Amount')
//                     {
//                     }
//                     column(GSTComponentCode2; GSTComponentCode[2] + ' Amount')
//                     {
//                     }
//                     column(GSTComponentCode3; GSTComponentCode[3] + ' Amount')
//                     {
//                     }
//                     column(GSTComponentCode4; GSTComponentCode[4] + 'Amount')
//                     {
//                     }
//                     column(GSTCompAmount1; ABS(GSTCompAmount[1]))
//                     {
//                     }
//                     column(GSTCompAmount2; ABS(GSTCompAmount[2]))
//                     {
//                     }
//                     column(GSTCompAmount3; ABS(GSTCompAmount[3]))
//                     {
//                     }
//                     column(GSTCompAmount4; ABS(GSTCompAmount[4]))
//                     {
//                     }
//                     column(GSTCompPer1; ABS(GSTCompPer[1]))
//                     {
//                     }
//                     column(GSTCompPer2; ABS(GSTCompPer[2]))
//                     {
//                     }
//                     column(GSTCompPer3; ABS(GSTCompPer[3]))
//                     {
//                     }
//                     column(IsGSTApplicable; IsGSTApplicable)
//                     {
//                     }
//                     column(CustAddr1; CustAddr[1])
//                     {
//                     }
//                     column(CompanyAddr1; CompanyAddr[1])
//                     {
//                     }
//                     column(CustAddr2; CustAddr[2])
//                     {
//                     }
//                     column(CompanyAddr2; CompanyAddr[2])
//                     {
//                     }
//                     column(CustAddr3; CustAddr[3])
//                     {
//                     }
//                     column(CompanyAddr3; CompanyAddr[3])
//                     {
//                     }
//                     column(CustAddr4; CustAddr[4])
//                     {
//                     }
//                     column(CompanyAddr4; CompanyAddr[4])
//                     {
//                     }
//                     column(CustAddr5; CustAddr[5])
//                     {
//                     }
//                     column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
//                     {
//                     }
//                     column(CustAddr6; CustAddr[6])
//                     {
//                     }
//                     column(CustAddr7; CustAddr[7])
//                     {
//                     }
//                     column(CustAddr8; CustAddr[8])
//                     {
//                     }
//                     column(ShipToAddr1; ShipToAddr[1])
//                     {
//                     }
//                     column(ShipToAddr2; ShipToAddr[2])
//                     {
//                     }
//                     column(ShipToAddr3; ShipToAddr[3])
//                     {
//                     }
//                     column(ShipToAddr4; ShipToAddr[4])
//                     {
//                     }
//                     column(ShipToAddr5; ShipToAddr[5])
//                     {
//                     }
//                     column(ShipToAddr6; ShipToAddr[6])
//                     {
//                     }
//                     column(ShipToStateName; ShipToStateName)
//                     {
//                     }
//                     column(ShipToAddress_State; ShipToAddress.State)
//                     {
//                     }
//                     column(ShipToAddress_GSTIN; ShipToAddress."GST Registration No.")
//                     {
//                     }
//                     column(PaymentTermsDescription; PaymentTerms.Description)
//                     {
//                     }
//                     column(ShipmentMethodDescription; ShipmentMethod.Description)
//                     {
//                     }
//                     column(CompanyInfoGSTIN; CompanyInfo."GST Registration No.")
//                     {
//                     }
//                     column(CompanyInfoPAN; CompanyInfo."P.A.N. No.")
//                     {
//                     }
//                     column(CompanyInfoBankName; CompanyInfo."Bank Name")
//                     {
//                     }
//                     column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
//                     {
//                     }
//                     column(CompanyInfoBankBranchNo; CompanyInfo."Bank Branch No.")
//                     {
//                     }
//                     column(CompanyInfo_IFSC_Code; CompanyInfo."IFSC Code")
//                     {
//                     }
//                     column(BillToCustNo_SalesInvHdr; "Sales Invoice Header"."Bill-to Customer No.")
//                     {
//                     }
//                     column(PostingDate_SalesInvHdr; FORMAT("Sales Invoice Header"."Posting Date", 0, 4))
//                     {
//                     }
//                     column(DocumentDate_SalesInvoiceHeader; FORMAT("Sales Invoice Header"."Document Date", 0, 4))
//                     {
//                     }
//                     column(DueDate_SalesInvoiceHdr; FORMAT("Sales Invoice Header"."Due Date", 0, 4))
//                     {
//                     }
//                     column(CompanyAddr5; CompanyAddr[5])
//                     {
//                     }
//                     column(CompanyAddr6; CompanyAddr[6])
//                     {
//                     }
//                     column(PricesInclVAT_SalesInvHdr; "Sales Invoice Header"."Prices Including VAT")
//                     {
//                     }
//                     column(OutputNo; OutputNo)
//                     {
//                     }
//                     column(PricesInclVATYesNo; FORMAT("Sales Invoice Header"."Prices Including VAT"))
//                     {
//                     }
//                     column(PageCaption; PageCaptionCap)
//                     {
//                     }
//                     column(Currency_SalesInvHdr; Currency)
//                     {
//                     }
//                     column(NoOfPrint; NoOfPrint)
//                     {
//                     }
//                     column(GTitle; GTitle)
//                     {
//                     }
//                     dataitem("Sales Invoice Line"; "Sales Invoice Line")
//                     {
//                         DataItemLink = "Document No." = FIELD("No.");
//                         DataItemLinkReference = "Sales Invoice Header";
//                         DataItemTableView = SORTING("Document No.", "Line No.");
//                         column(Item_Description2; Item."Description 2")
//                         {
//                         }
//                         column(SL; SL)
//                         {
//                         }
//                         column(LineType; LineType)
//                         {
//                         }
//                         column(LineAmount_SalesInvLine; "Line Amount")
//                         {
//                             AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
//                             AutoFormatType = 1;
//                         }
//                         column(Desc_SalesInvLine; Description)
//                         {
//                         }
//                         column(Desc_; Desc)
//                         {
//                         }
//                         column(Desc1_; Desc1)
//                         {
//                         }
//                         column(Desc2_; Desc2)
//                         {
//                         }
//                         column(No_SalesInvLine; "No.")
//                         {
//                         }
//                         column(Qty_SalesInvLine; Quantity)
//                         {
//                         }
//                         column(UOM_SalesInvoiceLine; "Unit of Measure")
//                         {
//                         }
//                         column(UnitPrice_SalesInvLine; "Unit Price")
//                         {
//                             AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
//                             AutoFormatType = 2;
//                         }
//                         column(LineDiscount_SalesInvLine; "Line Discount %")
//                         {
//                         }
//                         column(LineDiscount_SalesInvLineAmount; "Line Discount Amount")
//                         {
//                         }
//                         column(LineAmountGst; LineAmountGst)
//                         {
//                         }
//                         column(Amt__SalesInvLine; "Sales Invoice Line".Amount)
//                         {
//                         }
//                         column(SalesLineType; FORMAT("Sales Invoice Line".Type))
//                         {
//                         }
//                         column(InvDiscountAmount; -"Inv. Discount Amount")
//                         {
//                             AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
//                             AutoFormatType = 1;
//                         }
//                         column(TotalSubTotal; TotalSubTotal)
//                         {
//                             AutoFormatExpression = "Sales Invoice Header"."Currency Code";
//                             AutoFormatType = 1;
//                         }
//                         column(TotalInvoiceDiscAmount; TotalInvoiceDiscountAmount)
//                         {
//                             AutoFormatExpression = "Sales Invoice Header"."Currency Code";
//                             AutoFormatType = 1;
//                         }
//                         column(TotalText; TotalText)
//                         {
//                         }
//                         column(SalesInvoiceLineAmount; Amount)
//                         {
//                             AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
//                             AutoFormatType = 1;
//                         }
//                         column(AmtInclVAT_SalesInvLine; AmounttoCustomer())
//                         {
//                             AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
//                             AutoFormatType = 1;
//                         }
//                         column(TotalInclVATText; TotalInclVATText)
//                         {
//                         }
//                         column(TotalAmountInclVAT; TotalAmountInclVAT)
//                         {
//                             AutoFormatExpression = "Sales Invoice Header"."Currency Code";
//                             AutoFormatType = 1;
//                         }
//                         column(TaxAmount_SalesInvLine; 0)
//                         {
//                         }
//                         column(ServiceTaxAmt; ServiceTaxAmt)
//                         {
//                             AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
//                             AutoFormatType = 1;
//                         }
//                         column(ChargesAmount; ChargesAmount)
//                         {
//                             AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
//                             AutoFormatType = 1;
//                         }
//                         column(OtherTaxesAmount; OtherTaxesAmount + OtherCharges)
//                         {
//                             AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode();
//                             AutoFormatType = 1;
//                         }
//                         column(InsuranceCharges; InsuranceCharges)
//                         {
//                         }
//                         column(TotalExclVATText; TotalExclVATText)
//                         {
//                         }
//                         column(TotalAmountVAT; TotalAmountVAT)
//                         {
//                         }
//                         column(LineNo_SalesInvLine; "Line No.")
//                         {
//                         }
//                         column(SLNoCaption; SLNoCaptionLbl)
//                         {
//                         }
//                         column(HSNCaption; HSNCaptionLbl)
//                         {
//                         }
//                         column(GenDescCaption; GenDescCaptionLbl)
//                         {
//                         }
//                         column(UnitPriceCaption; UnitPriceCaptionLbl)
//                         {
//                         }
//                         column(AmountCaption; AmountCaptionLbl)
//                         {
//                         }
//                         column(SubtotalCaption; SubtotalCaptionLbl)
//                         {
//                         }
//                         column(ASSESSABLEVALUECaption; ASSESSABLEVALUECaptionLbl)
//                         {
//                         }
//                         column(Description_SalesInvLineCaption; FIELDCAPTION(Description))
//                         {
//                         }
//                         column(No_SalesInvoiceLineCaption; No_SalesInvoiceLineCaptionLbl)
//                         {
//                         }
//                         column(Quantity_SalesInvoiceLineCaption; QtyCaptionLbl)
//                         {
//                         }
//                         column(UOM_SalesInvoiceLineCaption; UOMCaptionLbl)
//                         {
//                         }
//                         column(ValueCaption; ValueCaptionLbl)
//                         {
//                         }
//                         column(IGSTCaption; IGSTCaptionLbl)
//                         {
//                         }
//                         column(CGSTCaption; CGSTCaptionLbl)
//                         {
//                         }
//                         column(SGSTCaption; SGSTCaptionLbl)
//                         {
//                         }
//                         column(LineTotalCaption; LineTotalCaptionLbl)
//                         {
//                         }
//                         column(PercentageCaption; PercentageCaptionLbl)
//                         {
//                         }
//                         column(ShipmentCaption; ShipmentCaptionLbl)
//                         {
//                         }
//                         column(HSNSACCode_SalesInvoiceLine; "Sales Invoice Line"."HSN/SAC Code")
//                         {
//                         }
//                         column(CrossReferenceNo_SalesInvoiceLine; "Sales Invoice Line"."Item Reference No.")
//                         {
//                         }
//                         column(TotalGSTAmount_SalesInvoiceLine; "Sales Invoice Line".GstAmount())
//                         {
//                         }
//                         column(GSTJurisdictionType_SalesInvoiceLine; GSTJurisdiction)
//                         {
//                         }
//                         column(Cert_Ln; Cert_Ln)
//                         {
//                         }
//                         column(Cert_Qty; Cert_Qty)
//                         {
//                         }
//                         column(Cert_Desc; Cert_Desc)
//                         {
//                         }
//                         column(Cert_Article; Cert_Article)
//                         {
//                         }
//                         column(Cert_Disp; Cert_Disp)
//                         {
//                         }

//                         trigger OnAfterGetRecord()
//                         begin
//                             IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::Item THEN
//                                 SL += 1;
//                             CLEAR(LineType);
//                             LineType := "Sales Invoice Line".Type.AsInteger();
//                             PostedShipmentDate := 0D;
//                             IF Quantity <> 0 THEN
//                                 PostedShipmentDate := FindPostedShipmentDate;

//                             IF (Type = Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
//                                 "No." := '';

//                             CLEAR(Item);
//                             IF "Sales Invoice Line"."No." <> '' THEN
//                                 IF Item.GET("Sales Invoice Line"."No.") THEN;
//                             VATAmountLine.INIT;
//                             VATAmountLine."VAT Identifier" := "VAT Identifier";
//                             VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
//                             VATAmountLine."Tax Group Code" := "Tax Group Code";
//                             VATAmountLine."VAT %" := "VAT %";
//                             VATAmountLine."VAT Base" := Amount;
//                             VATAmountLine."Amount Including VAT" := "Amount Including VAT";
//                             VATAmountLine."Line Amount" := "Line Amount";
//                             IF "Allow Invoice Disc." THEN
//                                 VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
//                             VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
//                             VATAmountLine.InsertLine;

//                             //TotalTCSAmount += "Total TDS/TCS Incl. SHE CESS";
//                             IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::"G/L Account" THEN BEGIN
//                                 IF "Sales Invoice Line".Description = 'Paisa Roundoff' THEN BEGIN
//                                     TotalSubTotal += 0;
//                                     Item."Description 2" := '';
//                                 END ELSE
//                                     TotalSubTotal += "Sales Invoice Line"."Line Amount"
//                             END ELSE
//                                 TotalSubTotal += "Sales Invoice Line"."Line Amount";

//                             TotalInvoiceDiscountAmount -= "Inv. Discount Amount";
//                             //TotalAmount += Amount;
//                             TotalAmountVAT += "Amount Including VAT" - Amount;
//                             // TotalAmountInclVAT += "Amount Including VAT";
//                             TotalPaymentDiscountOnVAT += -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT");
//                             // TotalAmountInclVAT += "Amount To Customer";
//                             // TotalExciseAmt += "Excise Amount";
//                             // TotalTaxAmt += "Tax Amount";
//                             // ServiceTaxAmount += "Service Tax Amount";
//                             // ServiceTaxeCessAmount += "Service Tax eCess Amount";
//                             // ServiceTaxSHECessAmount += "Service Tax SHE Cess Amount";
//                             // ServiceTaxSBCAmount += "Service Tax SBC Amount";
//                             // KKCessAmount += "KK Cess Amount";

//                             CLEAR(GSTCompAmount);
//                             CLEAR(GSTComponentCode);
//                             CLEAR(GSTCompPer);
//                             IF IsGSTApplicable AND (Type <> Type::" ") THEN BEGIN
//                                 J := 0;
//                                 GSTComponent.RESET;
//                                 //GSTComponent.SETRANGE("GST Jurisdiction Type","GST Jurisdiction Type");
//                                 IF GSTComponent.FINDSET THEN
//                                     REPEAT
//                                         J += 1;
//                                         GSTComponentCode[J] := GSTComponent.Code;
//                                         DetailedGSTLedgerEntry.RESET;
//                                         DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type", "Document Type", "Document No.", "Document Line No.");
//                                         DetailedGSTLedgerEntry.SETRANGE("Transaction Type", DetailedGSTLedgerEntry."Transaction Type"::Sales);
//                                         DetailedGSTLedgerEntry.SETRANGE("Document No.", "Document No.");
//                                         DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
//                                         DetailedGSTLedgerEntry.SETRANGE("GST Component Code", GSTComponentCode[J]);
//                                         IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
//                                             REPEAT
//                                                 GSTCompAmount[J] := DetailedGSTLedgerEntry."GST Amount";
//                                                 GSTCompPer[J] := DetailedGSTLedgerEntry."GST %";
//                                             UNTIL DetailedGSTLedgerEntry.NEXT = 0;
//                                         END;
//                                     UNTIL GSTComponent.NEXT = 0;
//                             END;

//                             // StructureLineDetails.RESET;
//                             // StructureLineDetails.SETRANGE(Type, StructureLineDetails.Type::Sale);
//                             // StructureLineDetails.SETRANGE("Document Type", StructureLineDetails."Document Type"::Invoice);
//                             // StructureLineDetails.SETRANGE("Invoice No.", "Document No.");
//                             // StructureLineDetails.SETRANGE("Item No.", "No.");
//                             // StructureLineDetails.SETRANGE("Line No.", "Line No.");
//                             // IF StructureLineDetails.FIND('-') THEN
//                             //     REPEAT
//                             //         IF NOT StructureLineDetails."Payable to Third Party" THEN BEGIN
//                             //             IF (StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges) AND
//                             //                (StructureLineDetails."Tax/Charge Group" = 'FREIGHT') THEN
//                             //                 ChargesAmount := ChargesAmount + ABS(StructureLineDetails.Amount)
//                             //             ELSE
//                             //                 IF (StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges) AND
//                             //               (StructureLineDetails."Tax/Charge Group" = 'INSURANCE') THEN
//                             //                     InsuranceCharges := InsuranceCharges + ABS(StructureLineDetails.Amount)
//                             //                 ELSE
//                             //                     OtherCharges := OtherCharges + ABS(StructureLineDetails.Amount);
//                             //             IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Other Taxes" THEN
//                             //                 OtherTaxesAmount := OtherTaxesAmount + ABS(StructureLineDetails.Amount);
//                             //         END;
//                             //     UNTIL StructureLineDetails.NEXT = 0;

//                             IF "Sales Invoice Header"."Transaction No. Serv. Tax" <> 0 THEN BEGIN
//                                 ServiceTaxEntry.RESET;
//                                 ServiceTaxEntry.SETRANGE(Type, ServiceTaxEntry.Type::Sale);
//                                 ServiceTaxEntry.SETRANGE("Document Type", ServiceTaxEntry."Document Type"::Invoice);
//                                 ServiceTaxEntry.SETRANGE("Document No.", "Document No.");
//                                 IF ServiceTaxEntry.FINDFIRST THEN BEGIN

//                                     IF "Sales Invoice Header"."Currency Code" <> '' THEN BEGIN
//                                         ServiceTaxEntry."Service Tax Amount" :=
//                                           ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
//                                           "Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code",
//                                           ServiceTaxEntry."Service Tax Amount", "Sales Invoice Header"."Currency Factor"));
//                                         ServiceTaxEntry."eCess Amount" :=
//                                           ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
//                                           "Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code",
//                                           ServiceTaxEntry."eCess Amount", "Sales Invoice Header"."Currency Factor"));
//                                         ServiceTaxEntry."SHE Cess Amount" :=
//                                           ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
//                                           "Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code",
//                                           ServiceTaxEntry."SHE Cess Amount", "Sales Invoice Header"."Currency Factor"));
//                                         ServiceTaxEntry."Service Tax SBC Amount" :=
//                                           ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
//                                           "Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code",
//                                           ServiceTaxEntry."Service Tax SBC Amount", "Sales Invoice Header"."Currency Factor"));
//                                         ServiceTaxEntry."KK Cess Amount" :=
//                                           ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
//                                           "Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code",
//                                           ServiceTaxEntry."KK Cess Amount", "Sales Invoice Header"."Currency Factor"));
//                                     END;

//                                     ServiceTaxAmt := ABS(ServiceTaxEntry."Service Tax Amount");
//                                     ServiceTaxECessAmt := ABS(ServiceTaxEntry."eCess Amount");
//                                     ServiceTaxSHECessAmt := ABS(ServiceTaxEntry."SHE Cess Amount");
//                                     ServiceTaxSBCAmt := ABS(ServiceTaxEntry."Service Tax SBC Amount");
//                                     KKCessAmt := ABS(ServiceTaxEntry."KK Cess Amount");
//                                     AppliedServiceTaxAmt := ServiceTaxAmount - ABS(ServiceTaxEntry."Service Tax Amount");
//                                     AppliedServiceTaxECessAmt := ServiceTaxeCessAmount - ABS(ServiceTaxEntry."eCess Amount");
//                                     AppliedServiceTaxSHECessAmt := ServiceTaxSHECessAmount - ABS(ServiceTaxEntry."SHE Cess Amount");
//                                     AppliedServiceTaxSBCAmt := ServiceTaxSBCAmount - ABS(ServiceTaxEntry."Service Tax SBC Amount");
//                                     AppliedKKCessAmt := KKCessAmount - ABS(ServiceTaxEntry."KK Cess Amount");
//                                 END ELSE BEGIN
//                                     AppliedServiceTaxAmt := ServiceTaxAmount;
//                                     AppliedServiceTaxECessAmt := ServiceTaxeCessAmount;
//                                     AppliedServiceTaxSHECessAmt := ServiceTaxSHECessAmount;
//                                     AppliedServiceTaxSBCAmt := ServiceTaxSBCAmount;
//                                     AppliedKKCessAmt := KKCessAmount;
//                                 END;
//                             END ELSE BEGIN
//                                 ServiceTaxAmt := ServiceTaxAmount;
//                                 ServiceTaxECessAmt := ServiceTaxeCessAmount;
//                                 ServiceTaxSHECessAmt := ServiceTaxSHECessAmount;
//                                 ServiceTaxSBCAmt := ServiceTaxSBCAmount;
//                                 KKCessAmt := KKCessAmount
//                             END;


//                             IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::"G/L Account" THEN BEGIN
//                                 IF "Sales Invoice Line".Description = 'Paisa Roundoff' THEN
//                                     RoundOff := "Sales Invoice Line"."Line Amount";
//                             END;

//                             CLEAR(Desc);
//                             CLEAR(Desc1);
//                             CLEAR(Desc2);
//                             CLEAR(SalesShipmentHeader1);
//                             CLEAR(SalesInvoiceLine1);
//                             IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::" " THEN BEGIN
//                                 IF "Sales Invoice Line"."No." = '' THEN BEGIN
//                                     SalesInvoiceLine1.RESET;
//                                     SalesInvoiceLine1.SETRANGE(SalesInvoiceLine1."Document No.", "Sales Invoice Header"."No.");
//                                     SalesInvoiceLine1.SETFILTER(SalesInvoiceLine1."Line No.", '>%1', "Sales Invoice Line"."Line No.");
//                                     IF SalesInvoiceLine1.FINDFIRST THEN BEGIN
//                                         IF SalesShipmentHeader1.GET(SalesInvoiceLine1."Shipment No.") THEN BEGIN
//                                             Desc := "Sales Invoice Line".Description;
//                                             //ZE_LIJO 17/7/2019
//                                             //++
//                                             SalesOrder.RESET;
//                                             SalesOrder.SETFILTER(SalesOrder."No.", SalesShipmentHeader1."Order No.");
//                                             IF SalesOrder.FINDFIRST THEN BEGIN
//                                                 Desc1 := 'PO No.:' + '' + SalesShipmentHeader1."External Document No.";
//                                                 Desc2 := 'PO Date.:' + FORMAT(SalesOrder."Document Date");
//                                             END ELSE BEGIN
//                                                 Desc1 := 'PO No.:' + '' + SalesShipmentHeader1."External Document No.";
//                                             END;
//                                             //--
//                                         END;
//                                     END;
//                                 END;
//                             END ELSE
//                                 Desc := "Sales Invoice Line".Description;

//                             //ZE_LIJO 02.08.2019
//                             //++
//                             ValueforCertTable;
//                             //--
//                         end;

//                         trigger OnPreDataItem()
//                         begin
//                             VATAmountLine.DELETEALL;
//                             SalesShipmentBuffer.RESET;
//                             SalesShipmentBuffer.DELETEALL;
//                             FirstValueEntryNo := 0;
//                             MoreLines := FIND('+');
//                             WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) AND (Amount = 0) DO
//                                 MoreLines := NEXT(-1) <> 0;
//                             IF NOT MoreLines THEN
//                                 CurrReport.BREAK;
//                             SETRANGE("Line No.", 0, "Line No.");
//                             CurrReport.CREATETOTALS("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount", "Excise Amount", "Tax Amount",
//                             //   "Service Tax Amount", "Service Tax eCess Amount", "Amount To Customer", "Service Tax SBC Amount");
//                             // CurrReport.CREATETOTALS("KK Cess Amount");
//                             // CurrReport.CREATETOTALS("Service Tax SHE Cess Amount");
//                             SL := 0;
//                         end;
//                     }
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     IF Number > 1 THEN BEGIN
//                         CopyText := Text003;
//                         OutputNo += 1;
//                     END;
//                     CurrReport.PAGENO := 1;

//                     //SE-E969
//                     IF NoOfPrint THEN BEGIN
//                         CLEAR(GTitle);
//                         IF OutputNo = 1 THEN
//                             GTitle := 'ORIGINAL FOR BUYER';
//                         IF OutputNo = 2 THEN
//                             GTitle := 'DUPLICATE FOR TRANSPORTER';
//                         IF OutputNo = 3 THEN
//                             GTitle := 'TRIPLICATE FOR TRANSPORTER';
//                         IF OutputNo = 4 THEN
//                             GTitle := 'EXTRA';
//                     END;
//                     //SE-E969

//                     TotalSubTotal := 0;
//                     TotalInvoiceDiscountAmount := 0;
//                     //TotalAmount := 0;
//                     TotalAmountVAT := 0;
//                     TotalAmountInclVAT := 0;
//                     TotalPaymentDiscountOnVAT := 0;
//                     TotalExciseAmt := 0;
//                     TotalTaxAmt := 0;
//                     ServiceTaxAmount := 0;
//                     ServiceTaxeCessAmount := 0;
//                     ServiceTaxSHECessAmount := 0;
//                     ServiceTaxSBCAmount := 0;
//                     KKCessAmount := 0;

//                     OtherTaxesAmount := 0;
//                     ChargesAmount := 0;
//                     InsuranceCharges := 0;
//                     OtherCharges := 0;
//                     AppliedServiceTaxSHECessAmt := 0;
//                     AppliedServiceTaxECessAmt := 0;
//                     AppliedServiceTaxAmt := 0;
//                     AppliedServiceTaxSBCAmt := 0;
//                     AppliedKKCessAmt := 0;
//                     ServiceTaxSHECessAmt := 0;
//                     ServiceTaxECessAmt := 0;
//                     ServiceTaxAmt := 0;
//                     ServiceTaxSBCAmt := 0;
//                     KKCessAmt := 0;
//                     TotalTCSAmount := 0;
//                 end;

//                 trigger OnPostDataItem()
//                 begin
//                     IF NOT CurrReport.PREVIEW THEN
//                         SalesInvCountPrinted.RUN("Sales Invoice Header");
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     IF NoOfPrint THEN//SE-E969
//                         NoOfCopies := 3;//SE-E969
//                     NoOfLoops := ABS(NoOfCopies) + Cust."Invoice Copies" + 1;
//                     IF NoOfLoops <= 0 THEN
//                         NoOfLoops := 1;
//                     CopyText := '';
//                     SETRANGE(Number, 1, NoOfLoops);
//                     OutputNo := 1;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             var
//                 SalesInvLine: Record "113";
//                 Location: Record "14";
//                 States: Record "13762";
//                 TotalAmttoCustomer: Decimal;
//                 NumToWords: Report "1401";
//             begin
//                 CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");
//                 IsGSTApplicable := GSTManagement.IsGSTApplicable(Structure);
//                 Customer.GET("Bill-to Customer No.");
//                 States.RESET;
//                 IF States.GET(Customer."State Code") THEN
//                     StateName := States.Description;
//                 ShipToAddress.RESET;
//                 IF ShipToAddress.GET("Sales Invoice Header"."Sell-to Customer No.", "Sales Invoice Header"."Ship-to Code") THEN BEGIN
//                     States.RESET;
//                     IF States.GET(ShipToAddress.State) THEN
//                         ShipToStateName := States.Description;
//                 END;
//                 IF RespCenter.GET("Responsibility Center") THEN BEGIN
//                     FormatAddr.RespCenter(CompanyAddr, RespCenter);
//                     CompanyInfo."Phone No." := RespCenter."Phone No.";
//                     CompanyInfo."Fax No." := RespCenter."Fax No.";
//                 END ELSE
//                     FormatAddr.Company(CompanyAddr, CompanyInfo);

//                 DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

//                 IF "Order No." = '' THEN
//                     OrderNoText := ''
//                 ELSE
//                     OrderNoText := FIELDCAPTION("Order No.");
//                 IF "Salesperson Code" = '' THEN BEGIN
//                     SalesPurchPerson.INIT;
//                     SalesPersonText := '';
//                 END ELSE BEGIN
//                     SalesPurchPerson.GET("Salesperson Code");
//                     SalesPersonText := Text000;
//                 END;
//                 IF "Your Reference" = '' THEN
//                     ReferenceText := ''
//                 ELSE
//                     ReferenceText := FIELDCAPTION("Your Reference");
//                 IF "VAT Registration No." = '' THEN
//                     VATNoText := ''
//                 ELSE
//                     VATNoText := FIELDCAPTION("VAT Registration No.");
//                 IF "Currency Code" = '' THEN BEGIN
//                     GLSetup.TESTFIELD("LCY Code");
//                     TotalText := STRSUBSTNO(Text001, GLSetup."LCY Code");
//                     TotalInclVATText := STRSUBSTNO(Text13700, GLSetup."LCY Code");
//                     TotalExclVATText := STRSUBSTNO(Text13701, GLSetup."LCY Code");
//                 END ELSE BEGIN
//                     TotalText := STRSUBSTNO(Text001, "Currency Code");
//                     TotalInclVATText := STRSUBSTNO(Text13700, "Currency Code");
//                     TotalExclVATText := STRSUBSTNO(Text13701, "Currency Code");
//                 END;
//                 FormatAddr.SalesInvBillTo(CustAddr, "Sales Invoice Header");
//                 IF NOT Cust.GET("Bill-to Customer No.") THEN
//                     CLEAR(Cust);

//                 IF "Payment Terms Code" = '' THEN
//                     PaymentTerms.INIT
//                 ELSE BEGIN
//                     PaymentTerms.GET("Payment Terms Code");
//                     PaymentTerms.TranslateDescription(PaymentTerms, "Language Code");
//                 END;
//                 IF "Shipment Method Code" = '' THEN
//                     ShipmentMethod.INIT
//                 ELSE BEGIN
//                     ShipmentMethod.GET("Shipment Method Code");
//                     ShipmentMethod.TranslateDescription(ShipmentMethod, "Language Code");
//                 END;
//                 FormatAddr.SalesInvShipTo(ShipToAddr, "Sales Invoice Header");
//                 /*ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";
//                 FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
//                   IF ShipToAddr[i] <> CustAddr[i] THEN
//                     ShowShippingAddr := TRUE;*/

//                 GetLineFeeNoteOnReportHist("No.");

//                 SupplementaryText := '';
//                 SalesInvLine.SETRANGE("Document No.", "No.");
//                 SalesInvLine.SETRANGE(Supplementary, TRUE);
//                 IF SalesInvLine.FINDFIRST THEN
//                     SupplementaryText := Text16500;

//                 IF Location.GET("Location Code") THEN
//                     ServiceTaxRegistrationNo := Location."Service Tax Registration No."
//                 ELSE
//                     ServiceTaxRegistrationNo := CompanyInfo."Service Tax Registration No.";

//                 /*TotalAmttoCustomer :=0 ;
//                 SalesInvLine.RESET;
//                 SalesInvLine.SETRANGE("Document No.","Sales Invoice Header"."No.");
//                 SalesInvLine.SETFILTER(Quantity,'>%1',0);
//                 IF SalesInvLine.FINDSET THEN REPEAT
//                   TotalAmttoCustomer += SalesInvLine."Amount To Customer";
//                 UNTIL(SalesInvLine.NEXT = 0);*/

//                 "Sales Invoice Header".CALCFIELDS("Amount to Customer");
//                 TotalAmount := "Sales Invoice Header"."Amount to Customer";
//                 NumToWords.InitTextVariable;
//                 //TotalAmttoCustomer:=ROUND(TotalAmount,GLSetup."Inv. Rounding Precision (LCY)");
//                 NumToWords.FormatNoText(TotalAmtInWords, TotalAmount, "Sales Invoice Header"."Currency Code");

//                 CLEAR(Currency);
//                 IF "Sales Invoice Header"."Currency Code" = '' THEN
//                     Currency := 'INR'
//                 ELSE
//                     Currency := "Sales Invoice Header"."Currency Code";
//                 IF "Sales Invoice Header"."Location Code" <> '' THEN
//                     IF NOT Location1.GET("Sales Invoice Header"."Location Code") THEN
//                         Location1.INIT;

//                 CLEAR(SalesShipmentHeader);
//                 CLEAR(SH);
//                 SalesInvoiceLine.RESET;
//                 SalesInvoiceLine.SETRANGE(SalesInvoiceLine."Document No.", "Sales Invoice Header"."No.");
//                 SalesInvoiceLine.SETFILTER(SalesInvoiceLine.Type, '%1', SalesInvoiceLine.Type::Item);
//                 IF SalesInvoiceLine.FINDFIRST THEN BEGIN
//                     IF SalesShipmentHeader.GET(SalesInvoiceLine."Shipment No.") THEN
//                         IF SH.GET(SH."Document Type"::Order, SalesShipmentHeader."Order No.") THEN;
//                 END;
//                 CLEAR(SACode);
//                 IF "Sales Invoice Header"."Shipping Agent Code" <> '' THEN
//                     SACode := "Sales Invoice Header"."Shipping Agent Code"
//                 ELSE
//                     SACode := SH."Shipping Agent Code";


//                 //ZE_LIJO 12/7/2019
//                 //++
//                 CLEAR(GSTJurisdiction);
//                 SalesInvoiceLine2.RESET;
//                 SalesInvoiceLine2.SETFILTER(SalesInvoiceLine2."Document No.", "Sales Invoice Header"."No.");
//                 SalesInvoiceLine2.SETRANGE(SalesInvoiceLine2.Type, SalesInvoiceLine2.Type::Item);
//                 IF SalesInvoiceLine2.FINDFIRST THEN BEGIN
//                     IF SalesInvoiceLine2."GST Jurisdiction Type" = SalesInvoiceLine2."GST Jurisdiction Type"::Interstate THEN
//                         GSTJurisdiction := 'Interstate';
//                     IF SalesInvoiceLine2."GST Jurisdiction Type" = SalesInvoiceLine2."GST Jurisdiction Type"::Intrastate THEN
//                         GSTJurisdiction := 'Intrastate';
//                 END;
//                 //--

//             end;
//         }
//     }

//     requestpage
//     {
//         SaveValues = true;

//         layout
//         {
//             area(content)
//             {
//                 group(Options)
//                 {
//                     Caption = 'Options';
//                     field("No. of Print"; NoOfPrint)
//                     {
//                         Caption = 'No. of Print';

//                         trigger OnValidate()
//                         begin
//                             //SE-E969
//                             IF (NoOfPrint) THEN
//                                 ControlBool := TRUE;
//                             IF (NoOfCopies > 0) THEN
//                                 ERROR('No. of Copy have value');
//                             //SE-E969
//                         end;
//                     }
//                     field("Digital Signature"; DigitalSig)
//                     {
//                         Caption = 'Digital Signature';
//                     }
//                     field(NoOfCopies; NoOfCopies)
//                     {
//                         Caption = 'No. of Copies';

//                         trigger OnValidate()
//                         begin
//                             //SE-E969
//                             IF (ControlBool) AND (NoOfCopies > 0) THEN
//                                 ERROR('No. of print is enable.');
//                             //SE-E969
//                         end;
//                     }
//                     field(ShowInternalInfo; ShowInternalInfo)
//                     {
//                         Caption = 'Show Internal Information';
//                     }
//                     field(LogInteraction; LogInteraction)
//                     {
//                         Caption = 'Log Interaction';
//                         Enabled = LogInteractionEnable;
//                     }
//                     field(DisplayAsmInformation; DisplayAssemblyInformation)
//                     {
//                         Caption = 'Show Assembly Components';
//                     }
//                     field(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
//                     {
//                         Caption = 'Show Additional Fee Note';
//                     }
//                 }
//             }
//         }

//         actions
//         {
//         }

//         trigger OnInit()
//         begin
//             LogInteractionEnable := TRUE;
//             CLEAR(NoOfPrint);//SE-E969
//             CLEAR(DigitalSig);//SE-E969
//             CLEAR(ControlBool);//SE-E969
//             CLEAR(GTitle);//SE-E969
//         end;

//         trigger OnOpenPage()
//         begin
//             InitLogInteraction;
//             LogInteractionEnable := LogInteraction;
//         end;
//     }

//     labels
//     {
//     }

//     trigger OnInitReport()
//     begin
//         GLSetup.GET;
//         CompanyInfo.GET;
//         SalesSetup.GET;
//         CompanyInfo.VerifyAndSetPaymentInfo;
//         CompanyInfo1.GET;
//         CompanyInfo1.CALCFIELDS(Picture);
//         CompanyInfo1.CALCFIELDS("Digital Signature");//SE-E969
//         //CLEAR(NoOfPrint);//SE-E969
//         //CLEAR(DigitalSig);//SE-E969
//     end;

//     trigger OnPreReport()
//     begin
//         IF NOT CurrReport.USEREQUESTPAGE THEN
//             InitLogInteraction;
//     end;

//     var
//         Text000: Label 'Salesperson';
//         Text001: Label 'GRAND TOTAL %1';
//         Text003: Label ' COPY';
//         Text004: Label 'Sales - Invoice%1';
//         PageCaptionCap: Label 'Page %1 of %2';
//         GLSetup: Record "98";
//         ShipmentMethod: Record "10";
//         PaymentTerms: Record "3";
//         SalesPurchPerson: Record "13";
//         CompanyInfo: Record "79";
//         CompanyInfo1: Record "79";
//         CompanyInfo2: Record "79";
//         CompanyInfo3: Record "79";
//         GSTComponent: Record "16405";
//         Customer: Record "18";
//         DetailedGSTLedgerEntry: Record "16419";
//         SalesSetup: Record "311";
//         Cust: Record "18";
//         VATAmountLine: Record "290" temporary;
//         DimSetEntry1: Record "480";
//         DimSetEntry2: Record "480";
//         RespCenter: Record "5714";
//         Language: Record "8";
//         CurrExchRate: Record "330";
//         TempPostedAsmLine: Record "911" temporary;
//         TempLineFeeNoteOnReportHist: Record "1053" temporary;
//         GSTManagement: Codeunit "16401";
//         SalesInvCountPrinted: Codeunit "315";
//         FormatAddr: Codeunit "365";
//         SegManagement: Codeunit "5051";
//         SalesShipmentBuffer: Record "7190" temporary;
//         GSTCompAmount: array[20] of Decimal;
//         GSTCompPer: array[20] of Decimal;
//         GSTComponentCode: array[20] of Code[10];
//         PostedShipmentDate: Date;
//         CustAddr: array[8] of Text[50];
//         ShipToAddr: array[8] of Text[50];
//         CompanyAddr: array[8] of Text[50];
//         OrderNoText: Text[80];
//         SalesPersonText: Text[30];
//         VATNoText: Text[80];
//         ReferenceText: Text[80];
//         TotalText: Text[50];
//         TotalExclVATText: Text[50];
//         TotalInclVATText: Text[50];
//         MoreLines: Boolean;
//         NoOfCopies: Integer;
//         NoOfLoops: Integer;
//         CopyText: Text[30];
//         ShowShippingAddr: Boolean;
//         i: Integer;
//         NextEntryNo: Integer;
//         FirstValueEntryNo: Integer;
//         DimText: Text[120];
//         OldDimText: Text[75];
//         ShowInternalInfo: Boolean;
//         Continue: Boolean;
//         LogInteraction: Boolean;
//         VALVATBaseLCY: Decimal;
//         VALVATAmountLCY: Decimal;
//         VALSpecLCYHeader: Text[80];
//         Text008: Label 'Local Currency';
//         VALExchRate: Text[50];
//         Text009: Label 'Exchange rate: %1/%2';
//         CalculatedExchRate: Decimal;
//         Text010: Label 'Sales - Prepayment Invoice %1';
//         OutputNo: Integer;
//         TotalSubTotal: Decimal;
//         TotalAmount: Decimal;
//         TotalAmountInclVAT: Decimal;
//         TotalAmountVAT: Decimal;
//         TotalInvoiceDiscountAmount: Decimal;
//         TotalPaymentDiscountOnVAT: Decimal;
//         ChargesAmount: Decimal;
//         OtherTaxesAmount: Decimal;
//         Text13700: Label 'Total %1 Incl. Taxes';
//         Text13701: Label 'Total %1 Excl. Taxes';
//         SupplementaryText: Text[30];
//         Text16500: Label 'Supplementary Invoice';
//         ServiceTaxEntry: Record "16473";
//         ServiceTaxAmt: Decimal;
//         ServiceTaxECessAmt: Decimal;
//         AppliedServiceTaxAmt: Decimal;
//         AppliedServiceTaxECessAmt: Decimal;
//         ServiceTaxSHECessAmt: Decimal;
//         AppliedServiceTaxSHECessAmt: Decimal;
//         TotalTaxAmt: Decimal;
//         TotalExciseAmt: Decimal;
//         TotalTCSAmount: Decimal;
//         ServiceTaxAmount: Decimal;
//         ServiceTaxeCessAmount: Decimal;
//         ServiceTaxSHECessAmount: Decimal;
//         [InDataSet]
//         LogInteractionEnable: Boolean;
//         DisplayAssemblyInformation: Boolean;
//         BankDetailsCaptionLbl: Label 'BANK DETAILS';
//         BankNameCaptionLbl: Label 'Bank Name';
//         BankAccNoCaptionLbl: Label 'Account #';
//         IFSCodeCaptionLbl: Label 'IFS Code';
//         BranchCaptionLbl: Label 'Branch';
//         InvoiceNoCaptionLbl: Label 'Invoice No.';
//         PostingDateCaptionLbl: Label 'Invoice Date';
//         UnitPriceCaptionLbl: Label 'Unit Price';
//         DiscountCaptionLbl: Label 'Discount %';
//         AmountCaptionLbl: Label 'Amt';
//         LineDiscountCaptionLbl: Label 'Line Discount Amount';
//         SubtotalCaptionLbl: Label 'Subtotal';
//         ChargesAmountCaptionLbl: Label 'Charges Amount';
//         OtherTaxesAmountCaptionLbl: Label 'Other Taxes Amount';
//         LineAmountCaptionLbl: Label 'Line Amount';
//         ShipToAddressCaptionLbl: Label 'Ship-to Address';
//         ServiceTaxRegistrationNo: Code[20];
//         InvDiscountAmountCaptionLbl: Label 'Invoice Discount Amount';
//         VATPercentageCaptionLbl: Label 'VAT %';
//         TotalCaptionLbl: Label 'Total';
//         PaymentTermsCaptionLbl: Label 'Payment Terms';
//         ShipmentMethodCaptionLbl: Label 'Shipment Method';
//         EMailCaptionLbl: Label 'E-Mail';
//         DocumentDateCaptionLbl: Label 'Document Date';
//         DisplayAdditionalFeeNote: Boolean;
//         ServiceTaxSBCAmount: Decimal;
//         ServiceTaxSBCAmt: Decimal;
//         AppliedServiceTaxSBCAmt: Decimal;
//         KKCessAmount: Decimal;
//         KKCessAmt: Decimal;
//         AppliedKKCessAmt: Decimal;
//         IsGSTApplicable: Boolean;
//         J: Integer;
//         ShipToAddress: Record "222";
//         StateName: Text[50];
//         ShipToStateName: Text[50];
//         StateCaptionLbl: Label 'State';
//         CodeCaptionLbl: Label 'Code';
//         GSTRegistrationCaptionLbl: Label 'GST#';
//         PANCaptionLbl: Label 'PAN#';
//         LUTCaptionlbl: Label 'LUT#';
//         GSTINCaptionLbl: Label 'GSTIN';
//         CustomerIDCaptionLbl: Label 'Customer ID';
//         CustomerPOCaptionLbl: Label 'Customer PO';
//         PACKINGMARKSCaptionLbl: Label 'Packing Marks';
//         PackingDetailsCaptionLbl: Label 'Packing Details';
//         WeightCaptionLbl: Label 'WEIGHT(KG)';
//         GCaptionLbl: Label 'G';
//         NCaptionLbl: Label 'N';
//         ModeOfShipmentCaptionLbl: Label 'Mode Of Shipment';
//         TRANSPORTERCaptionLbl: Label 'Transporter';
//         CurrencyCaptionLbl: Label 'Currency';
//         IncoTermsCaptionLbl: Label 'Incoterms';
//         TrackingCaptionLbl: Label 'Tracking #';
//         DELIVERYDATECaptionLbl: Label 'Delivery Date';
//         PhoneCaptionLbl: Label 'Phone: ';
//         WebCaptionLbl: Label 'Web: ';
//         TaxInvoiceCaptionLbl: Label 'Tax Invoice';
//         BillToCaptionLbl: Label 'BILL TO:';
//         ShipToCaptionLbl: Label 'SHIP TO:';
//         SLNoCaptionLbl: Label 'SL#';
//         SL: Integer;
//         GenDescCaptionLbl: Label 'General Description';
//         HSNCaptionLbl: Label 'HSN# / SCA';
//         UOMCaptionLbl: Label 'UOM';
//         QtyCaptionLbl: Label 'Qty';
//         ValueCaptionLbl: Label 'Value';
//         ASSESSABLEVALUECaptionLbl: Label 'Assessable Value';
//         IGSTCaptionLbl: Label 'IGST';
//         CGSTCaptionLbl: Label 'CGST';
//         SGSTCaptionLbl: Label 'SGST';
//         LineTotalCaptionLbl: Label 'Line Total';
//         PercentageCaptionLbl: Label '%';
//         ShipmentCaptionLbl: Label 'Shipment';
//         NoteCaptionLbl: Label 'Note: It is a computer generated document. Signature not required.';
//         ADVANCECaptionLbl: Label 'ADVANCE';
//         FRIEGHTCaptionLbl: Label 'FRIEGHT';
//         INSURANCECaptionLbl: Label 'INSURANCE';
//         PFCaptionLbl: Label 'GST AMOUNT';
//         ROUNDOFFCaptionLbl: Label 'ROUND OFF';
//         TotalAmtInWords: array[2] of Text[250];
//         AmtInWordsCaptionLbl: Label 'Total Invoice amount in words';
//         Currency: Code[10];
//         InsuranceCharges: Decimal;
//         OtherCharges: Decimal;
//         LineType: Integer;
//         POdateCaptionLbl: Label 'PO Date';
//         Location1: Record "14";
//         ShipFromCaptionLbl: Label 'SHIP FROM:';
//         No_SalesInvoiceLineCaptionLbl: Label 'Article No';
//         LineAmountGst: Decimal;
//         RoundOff: Decimal;
//         Item: Record "27";
//         LineTotalCaptionLbl1: Label 'Line Total';
//         CustomerReferencenoCaptionLbl: Label 'Customer Reference No.';
//         SalesInvoiceLine: Record "113";
//         SH: Record "36";
//         SalesShipmentHeader: Record "110";
//         Desc: Text[50];
//         SalesInvoiceLine1: Record "113";
//         SalesShipmentHeader1: Record "110";
//         Desc1: Text[50];
//         SACode: Code[10];
//         GTitle: Text[30];
//         NoOfPrint: Boolean;
//         DigitalSig: Boolean;
//         ControlBool: Boolean;
//         SalesInvoiceLine2: Record "113";
//         GSTJurisdiction: Text;
//         SalesOrder: Record "36";
//         Desc2: Text[50];
//         Cert_SalInvLn: Record "113";
//         Cert_Ln: Integer;
//         Cert_Qty: Decimal;
//         Cert_Desc: Text[250];
//         Cert_Article: Code[50];
//         Cert_Disp: Boolean;
//         Cert_SalInvLn1: Record "113";

//     procedure InitLogInteraction()
//     begin
//         LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
//     end;

//     procedure FindPostedShipmentDate(): Date
//     var
//         SalesShipmentHeader: Record "110";
//         SalesShipmentBuffer2: Record "7190" temporary;
//     begin
//         NextEntryNo := 1;
//         IF "Sales Invoice Line"."Shipment No." <> '' THEN
//             IF SalesShipmentHeader.GET("Sales Invoice Line"."Shipment No.") THEN
//                 EXIT(SalesShipmentHeader."Posting Date");

//         IF "Sales Invoice Header"."Order No." = '' THEN
//             EXIT("Sales Invoice Header"."Posting Date");

//         CASE "Sales Invoice Line".Type OF
//             "Sales Invoice Line".Type::Item:
//                 GenerateBufferFromValueEntry("Sales Invoice Line");
//             "Sales Invoice Line".Type::"G/L Account", "Sales Invoice Line".Type::Resource,
//           "Sales Invoice Line".Type::"Charge (Item)", "Sales Invoice Line".Type::"Fixed Asset":
//                 GenerateBufferFromShipment("Sales Invoice Line");
//             "Sales Invoice Line".Type::" ":
//                 EXIT(0D);
//         END;

//         SalesShipmentBuffer.RESET;
//         SalesShipmentBuffer.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
//         SalesShipmentBuffer.SETRANGE("Line No.", "Sales Invoice Line"."Line No.");
//         IF SalesShipmentBuffer.FIND('-') THEN BEGIN
//             SalesShipmentBuffer2 := SalesShipmentBuffer;
//             IF SalesShipmentBuffer.NEXT = 0 THEN BEGIN
//                 SalesShipmentBuffer.GET(
//                   SalesShipmentBuffer2."Document No.", SalesShipmentBuffer2."Line No.", SalesShipmentBuffer2."Entry No.");
//                 SalesShipmentBuffer.DELETE;
//                 EXIT(SalesShipmentBuffer2."Posting Date");
//             END;
//             SalesShipmentBuffer.CALCSUMS(Quantity);
//             IF SalesShipmentBuffer.Quantity <> "Sales Invoice Line".Quantity THEN BEGIN
//                 SalesShipmentBuffer.DELETEALL;
//                 EXIT("Sales Invoice Header"."Posting Date");
//             END;
//         END ELSE
//             EXIT("Sales Invoice Header"."Posting Date");
//     end;

//     [Scope('Internal')]
//     procedure GenerateBufferFromValueEntry(SalesInvoiceLine2: Record "113")
//     var
//         ValueEntry: Record "5802";
//         ItemLedgerEntry: Record "32";
//         TotalQuantity: Decimal;
//         Quantity: Decimal;
//     begin
//         TotalQuantity := SalesInvoiceLine2."Quantity (Base)";
//         ValueEntry.SETCURRENTKEY("Document No.");
//         ValueEntry.SETRANGE("Document No.", SalesInvoiceLine2."Document No.");
//         ValueEntry.SETRANGE("Posting Date", "Sales Invoice Header"."Posting Date");
//         ValueEntry.SETRANGE("Item Charge No.", '');
//         ValueEntry.SETFILTER("Entry No.", '%1..', FirstValueEntryNo);
//         IF ValueEntry.FIND('-') THEN
//             REPEAT
//                 IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN BEGIN
//                     IF SalesInvoiceLine2."Qty. per Unit of Measure" <> 0 THEN
//                         Quantity := ValueEntry."Invoiced Quantity" / SalesInvoiceLine2."Qty. per Unit of Measure"
//                     ELSE
//                         Quantity := ValueEntry."Invoiced Quantity";
//                     AddBufferEntry(
//                       SalesInvoiceLine2,
//                       -Quantity,
//                       ItemLedgerEntry."Posting Date");
//                     TotalQuantity := TotalQuantity + ValueEntry."Invoiced Quantity";
//                 END;
//                 FirstValueEntryNo := ValueEntry."Entry No." + 1;
//             UNTIL (ValueEntry.NEXT = 0) OR (TotalQuantity = 0);
//     end;

//     [Scope('Internal')]
//     procedure GenerateBufferFromShipment(SalesInvoiceLine: Record "113")
//     var
//         SalesInvoiceHeader: Record "112";
//         SalesInvoiceLine2: Record "113";
//         SalesShipmentHeader: Record "110";
//         SalesShipmentLine: Record "111";
//         TotalQuantity: Decimal;
//         Quantity: Decimal;
//     begin
//         TotalQuantity := 0;
//         SalesInvoiceHeader.SETCURRENTKEY("Order No.");
//         SalesInvoiceHeader.SETFILTER("No.", '..%1', "Sales Invoice Header"."No.");
//         SalesInvoiceHeader.SETRANGE("Order No.", "Sales Invoice Header"."Order No.");
//         IF SalesInvoiceHeader.FIND('-') THEN
//             REPEAT
//                 SalesInvoiceLine2.SETRANGE("Document No.", SalesInvoiceHeader."No.");
//                 SalesInvoiceLine2.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
//                 SalesInvoiceLine2.SETRANGE(Type, SalesInvoiceLine.Type);
//                 SalesInvoiceLine2.SETRANGE("No.", SalesInvoiceLine."No.");
//                 SalesInvoiceLine2.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
//                 IF SalesInvoiceLine2.FIND('-') THEN
//                     REPEAT
//                         TotalQuantity := TotalQuantity + SalesInvoiceLine2.Quantity;
//                     UNTIL SalesInvoiceLine2.NEXT = 0;
//             UNTIL SalesInvoiceHeader.NEXT = 0;

//         SalesShipmentLine.SETCURRENTKEY("Order No.", "Order Line No.");
//         SalesShipmentLine.SETRANGE("Order No.", "Sales Invoice Header"."Order No.");
//         SalesShipmentLine.SETRANGE("Order Line No.", SalesInvoiceLine."Line No.");
//         SalesShipmentLine.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
//         SalesShipmentLine.SETRANGE(Type, SalesInvoiceLine.Type);
//         SalesShipmentLine.SETRANGE("No.", SalesInvoiceLine."No.");
//         SalesShipmentLine.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
//         SalesShipmentLine.SETFILTER(Quantity, '<>%1', 0);

//         IF SalesShipmentLine.FIND('-') THEN
//             REPEAT
//                 IF "Sales Invoice Header"."Get Shipment Used" THEN
//                     CorrectShipment(SalesShipmentLine);
//                 IF ABS(SalesShipmentLine.Quantity) <= ABS(TotalQuantity - SalesInvoiceLine.Quantity) THEN
//                     TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity
//                 ELSE BEGIN
//                     IF ABS(SalesShipmentLine.Quantity) > ABS(TotalQuantity) THEN
//                         SalesShipmentLine.Quantity := TotalQuantity;
//                     Quantity :=
//                       SalesShipmentLine.Quantity - (TotalQuantity - SalesInvoiceLine.Quantity);

//                     TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity;
//                     SalesInvoiceLine.Quantity := SalesInvoiceLine.Quantity - Quantity;

//                     IF SalesShipmentHeader.GET(SalesShipmentLine."Document No.") THEN
//                         AddBufferEntry(
//                           SalesInvoiceLine,
//                           Quantity,
//                           SalesShipmentHeader."Posting Date");
//                 END;
//             UNTIL (SalesShipmentLine.NEXT = 0) OR (TotalQuantity = 0);
//     end;

//     [Scope('Internal')]
//     procedure CorrectShipment(var SalesShipmentLine: Record "111")
//     var
//         SalesInvoiceLine: Record "113";
//     begin
//         SalesInvoiceLine.SETCURRENTKEY("Shipment No.", "Shipment Line No.");
//         SalesInvoiceLine.SETRANGE("Shipment No.", SalesShipmentLine."Document No.");
//         SalesInvoiceLine.SETRANGE("Shipment Line No.", SalesShipmentLine."Line No.");
//         IF SalesInvoiceLine.FIND('-') THEN
//             REPEAT
//                 SalesShipmentLine.Quantity := SalesShipmentLine.Quantity - SalesInvoiceLine.Quantity;
//             UNTIL SalesInvoiceLine.NEXT = 0;
//     end;

//     [Scope('Internal')]
//     procedure AddBufferEntry(SalesInvoiceLine: Record "113"; QtyOnShipment: Decimal; PostingDate: Date)
//     begin
//         SalesShipmentBuffer.SETRANGE("Document No.", SalesInvoiceLine."Document No.");
//         SalesShipmentBuffer.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
//         SalesShipmentBuffer.SETRANGE("Posting Date", PostingDate);
//         IF SalesShipmentBuffer.FIND('-') THEN BEGIN
//             SalesShipmentBuffer.Quantity := SalesShipmentBuffer.Quantity + QtyOnShipment;
//             SalesShipmentBuffer.MODIFY;
//             EXIT;
//         END;

//         WITH SalesShipmentBuffer DO BEGIN
//             "Document No." := SalesInvoiceLine."Document No.";
//             "Line No." := SalesInvoiceLine."Line No.";
//             "Entry No." := NextEntryNo;
//             Type := SalesInvoiceLine.Type;
//             "No." := SalesInvoiceLine."No.";
//             Quantity := QtyOnShipment;
//             "Posting Date" := PostingDate;
//             INSERT;
//             NextEntryNo := NextEntryNo + 1
//         END;
//     end;

//     local procedure DocumentCaption(): Text[250]
//     begin
//         IF "Sales Invoice Header"."Prepayment Invoice" THEN
//             EXIT(Text010);
//         EXIT(Text004);
//     end;

//     [Scope('Internal')]
//     procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; DisplayAsmInfo: Boolean)
//     begin
//         NoOfCopies := NewNoOfCopies;
//         ShowInternalInfo := NewShowInternalInfo;
//         LogInteraction := NewLogInteraction;
//         DisplayAssemblyInformation := DisplayAsmInfo;
//     end;

//     [Scope('Internal')]
//     procedure CollectAsmInformation()
//     var
//         ValueEntry: Record "5802";
//         ItemLedgerEntry: Record "32";
//         PostedAsmHeader: Record "910";
//         PostedAsmLine: Record "911";
//         SalesShipmentLine: Record "111";
//     begin
//         TempPostedAsmLine.DELETEALL;
//         IF "Sales Invoice Line".Type <> "Sales Invoice Line".Type::Item THEN
//             EXIT;
//         WITH ValueEntry DO BEGIN
//             SETCURRENTKEY("Document No.");
//             SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
//             SETRANGE("Document Type", "Document Type"::"Sales Invoice");
//             SETRANGE("Document Line No.", "Sales Invoice Line"."Line No.");
//             SETRANGE(Adjustment, FALSE);
//             IF NOT FINDSET THEN
//                 EXIT;
//         END;
//         REPEAT
//             IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN
//                 IF ItemLedgerEntry."Document Type" = ItemLedgerEntry."Document Type"::"Sales Shipment" THEN BEGIN
//                     SalesShipmentLine.GET(ItemLedgerEntry."Document No.", ItemLedgerEntry."Document Line No.");
//                     IF SalesShipmentLine.AsmToShipmentExists(PostedAsmHeader) THEN BEGIN
//                         PostedAsmLine.SETRANGE("Document No.", PostedAsmHeader."No.");
//                         IF PostedAsmLine.FINDSET THEN
//                             REPEAT
//                                 TreatAsmLineBuffer(PostedAsmLine);
//                             UNTIL PostedAsmLine.NEXT = 0;
//                     END;
//                 END;
//         UNTIL ValueEntry.NEXT = 0;
//     end;

//     [Scope('Internal')]
//     procedure TreatAsmLineBuffer(PostedAsmLine: Record "911")
//     begin
//         CLEAR(TempPostedAsmLine);
//         TempPostedAsmLine.SETRANGE(Type, PostedAsmLine.Type);
//         TempPostedAsmLine.SETRANGE("No.", PostedAsmLine."No.");
//         TempPostedAsmLine.SETRANGE("Variant Code", PostedAsmLine."Variant Code");
//         TempPostedAsmLine.SETRANGE(Description, PostedAsmLine.Description);
//         TempPostedAsmLine.SETRANGE("Unit of Measure Code", PostedAsmLine."Unit of Measure Code");
//         IF TempPostedAsmLine.FINDFIRST THEN BEGIN
//             TempPostedAsmLine.Quantity += PostedAsmLine.Quantity;
//             TempPostedAsmLine.MODIFY;
//         END ELSE BEGIN
//             CLEAR(TempPostedAsmLine);
//             TempPostedAsmLine := PostedAsmLine;
//             TempPostedAsmLine.INSERT;
//         END;
//     end;

//     [Scope('Internal')]
//     procedure GetUOMText(UOMCode: Code[10]): Text[10]
//     var
//         UnitOfMeasure: Record "204";
//     begin
//         IF NOT UnitOfMeasure.GET(UOMCode) THEN
//             EXIT(UOMCode);
//         EXIT(UnitOfMeasure.Description);
//     end;

//     [Scope('Internal')]
//     procedure BlanksForIndent(): Text[10]
//     begin
//         EXIT(PADSTR('', 2, ' '));
//     end;

//     local procedure GetLineFeeNoteOnReportHist(SalesInvoiceHeaderNo: Code[20])
//     var
//         LineFeeNoteOnReportHist: Record "1053";
//         CustLedgerEntry: Record "21";
//         Customer: Record "18";
//     begin
//         TempLineFeeNoteOnReportHist.DELETEALL;
//         CustLedgerEntry.SETRANGE("Document Type", CustLedgerEntry."Document Type"::Invoice);
//         CustLedgerEntry.SETRANGE("Document No.", SalesInvoiceHeaderNo);
//         IF NOT CustLedgerEntry.FINDFIRST THEN
//             EXIT;

//         IF NOT Customer.GET(CustLedgerEntry."Customer No.") THEN
//             EXIT;

//         LineFeeNoteOnReportHist.SETRANGE("Cust. Ledger Entry No", CustLedgerEntry."Entry No.");
//         LineFeeNoteOnReportHist.SETRANGE("Language Code", Customer."Language Code");
//         IF LineFeeNoteOnReportHist.FINDSET THEN BEGIN
//             REPEAT
//                 TempLineFeeNoteOnReportHist.INIT;
//                 TempLineFeeNoteOnReportHist.COPY(LineFeeNoteOnReportHist);
//                 TempLineFeeNoteOnReportHist.INSERT;
//             UNTIL LineFeeNoteOnReportHist.NEXT = 0;
//         END ELSE BEGIN
//             LineFeeNoteOnReportHist.SETRANGE("Language Code", Language.GetUserLanguage);
//             IF LineFeeNoteOnReportHist.FINDSET THEN
//                 REPEAT
//                     TempLineFeeNoteOnReportHist.INIT;
//                     TempLineFeeNoteOnReportHist.COPY(LineFeeNoteOnReportHist);
//                     TempLineFeeNoteOnReportHist.INSERT;
//                 UNTIL LineFeeNoteOnReportHist.NEXT = 0;
//         END;
//     end;

//     local procedure ValueforCertTable()
//     begin
//         CLEAR(Cert_Article);
//         CLEAR(Cert_Desc);
//         CLEAR(Cert_Qty);
//         Cert_Disp := FALSE;
//         IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::Item THEN BEGIN
//             Cert_SalInvLn.RESET;
//             Cert_SalInvLn.SETFILTER(Cert_SalInvLn."Document No.", "Sales Invoice Line"."Document No.");
//             Cert_SalInvLn.SETFILTER(Cert_SalInvLn."No.", "Sales Invoice Line"."No.");
//             IF Cert_SalInvLn.FINDSET THEN
//                 REPEAT
//                     Cert_Qty += Cert_SalInvLn.Quantity;
//                     Cert_Desc := Cert_SalInvLn.Description;
//                     Cert_Article := Cert_SalInvLn."No.";
//                     Cert_Disp := TRUE;
//                 UNTIL Cert_SalInvLn.NEXT = 0;
//             Cert_SalInvLn1.RESET;
//             Cert_SalInvLn1.SETFILTER(Cert_SalInvLn1."Document No.", "Sales Invoice Line"."Document No.");
//             Cert_SalInvLn1.SETFILTER(Cert_SalInvLn1."No.", "Sales Invoice Line"."No.");
//             Cert_SalInvLn1.SETFILTER(Cert_SalInvLn1."Line No.", '<%1', "Sales Invoice Line"."Line No.");
//             IF Cert_SalInvLn1.FINDFIRST THEN BEGIN
//                 Cert_Disp := FALSE;
//             END ELSE BEGIN
//                 Cert_Ln += 1;
//             END;
//         END;
//     end;
// }
