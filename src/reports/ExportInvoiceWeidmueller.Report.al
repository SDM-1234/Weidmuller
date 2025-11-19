report 50009 "Export Invoice -Weidmueller"
{
    DefaultLayout = RDLC;
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;

    RDLCLayout = 'src/reportlayout/ExportInvoiceWeidmueller.rdl';


    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.")
                                ORDER(Ascending);
            RequestFilterFields = "No.";
            column(Sales_Invoice_Header_No_; "No.")
            {
            }
            column(Customer_No_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Customer No.")
            {
            }
            column(TotalIGSTAmount; TotalIGSTAmount)
            {
            }
            column(CurrencyCode_SalesInvoiceHeader; "Sales Invoice Header"."Currency Code")
            {
            }
            column(DigitalSig; DigitalSig)
            {
            }
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        ORDER(Ascending)
                                        WHERE(Number = CONST(1));
                    column(CompInfo_DigitalSig; CompInfo."Digital Signature")
                    {
                    }
                    column(COMPANYNAME; CompInfo.Name)
                    {
                    }
                    column(CompInfo_Address________CompInfo__Address_2______CompInfo_City___________CompInfo__Post_Code_; CompInfo.Address + ', ' + CompInfo."Address 2" + ',' + CompInfo.City + ' - ' + CompInfo."Post Code")
                    {
                    }
                    column(Picture_CompInfo; CompInfo.Picture)
                    {
                    }
                    column(LUTNo_CompInfo; CompInfo."LUT No.")
                    {
                    }
                    column(SalesPerson_Name; SalesPerson.Name)
                    {
                    }
                    column(SalesPerson__Phone_No__; SalesPerson."Phone No.")
                    {
                    }
                    column(PaymentDesc; PaymentDesc)
                    {
                    }
                    column(CustomerRec__PAN_No; CustomerRec."P.A.N. No.")
                    {
                    }
                    column(CustomerRec__GST_No; CustomerRec."GST Registration No.")
                    {
                    }
                    column(GSTPLace_Of_Supply; PlaceofSupply)
                    {
                    }
                    column(No_StateCode; StateCodeNo)
                    {
                    }
                    column(CustomerRec__L_S_T__No__; '')//CustomerRec."L.S.T. No."
                    {
                    }
                    column(Sales_Invoice_Header___External_Document_No__; "Sales Invoice Header"."External Document No.")
                    {
                    }
                    column(Sales_Invoice_Header___Bill_to_Address__________Sales_Invoice_Header___Bill_to_Address_2_; "Sales Invoice Header"."Bill-to Address" + ', ' + "Sales Invoice Header"."Bill-to Address 2")
                    {
                    }
                    column(Sales_Invoice_Header___Bill_to_City_______Cg_statedescrp_____________Sales_Invoice_Header___Bill_to_Post_Code_; "Sales Invoice Header"."Bill-to City" + ',' + Cg_statedescrp + ' - ' + "Sales Invoice Header"."Bill-to Post Code")
                    {
                    }
                    column(Sales_Invoice_Header___Shipment_Date_; "Sales Invoice Header"."Shipment Date")
                    {
                    }
                    column(OrderNo; "Sales Invoice Header"."Order No.")
                    {
                    }
                    column(Var_OrderNo; Var_OrderNo)
                    {
                    }
                    column(Lob; Lob)
                    {
                    }
                    column(Reg; Reg)
                    {
                    }
                    column(COMPANYNAME_Control1000000248; COMPANYNAME)
                    {
                    }
                    column(Address1________Address2_____City___________PinCode; Address1 + ', ' + Address2 + ',' + City + ' - ' + PinCode)
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Address__________Sales_Invoice_Header___Ship_to_Address_2_; "Sales Invoice Header"."Ship-to Address" + ' , ' + "Sales Invoice Header"."Ship-to Address 2")
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_City_______Cg_statedescrp________Sales_Invoice_Header___Ship_to_Post_Code_; "Sales Invoice Header"."Ship-to City" + ',' + Cg_statedescrp + '-' + "Sales Invoice Header"."Ship-to Post Code")
                    {
                    }
                    column(ProdlineDIM; ProdlineDIM)
                    {
                    }
                    column(in___CG_Curr2; 'in ' + CG_Curr2)
                    {
                    }
                    column(CG_Curr2; CG_Curr2)
                    {
                    }
                    column(CG_Billtophone; CG_Billtophone)
                    {
                    }
                    column(Cg_Shipment; Cg_Shipment)
                    {
                    }
                    column(Sales_Invoice_Header___Shipping_Agent_Code_; "Sales Invoice Header"."Shipping Agent Code")
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Name_2_; "Sales Invoice Header"."Ship-to Name 2")
                    {
                    }
                    column(Sales_Invoice_Header___Bill_to_Name_2_; "Sales Invoice Header"."Bill-to Name 2")
                    {
                    }
                    column(TxtCustNameval; TxtCustNameval)
                    {
                    }
                    column(TxtCustName; TxtCustName)
                    {
                    }
                    column(Sales_Invoice_Header___No__; "Sales Invoice Header"."No.")
                    {
                    }
                    column(Sales_Invoice_Header___Posting_Date_; "Sales Invoice Header"."Posting Date")
                    {
                    }
                    column(PageText; PageText)
                    {
                    }
                    column(NeftCode; NeftCode)
                    {
                    }
                    column(AccNo; AccNo)
                    {
                    }
                    column(BankName; BankName)
                    {
                    }
                    column(COMPANYNAME_Control1000000025; COMPANYNAME)
                    {
                    }
                    column(CompInfo_Address________CompInfo__Address_2______CompInfo_City___________CompInfo__Post_Code__Control1000000027; CompInfo.Address + ', ' + CompInfo."Address 2" + ',' + CompInfo.City + ' - ' + CompInfo."Post Code")
                    {
                    }
                    column(SalesPerson_Name_Control1000000059; SalesPerson.Name)
                    {
                    }
                    column(SalesPerson__Phone_No___Control1000000072; SalesPerson."Phone No.")
                    {
                    }
                    column(PaymentDesc_Control1000000075; PaymentDesc)
                    {
                    }
                    column(CustomerRec__T_I_N__No___Control1000000080; '')//CustomerRec."T.I.N. No."
                    {
                    }
                    column(CustomerRec__C_S_T__No___Control1000000081; '')//CustomerRec."C.S.T. No."
                    {
                    }
                    column(CustomerRec__L_S_T__No___Control1000000082; '')//CustomerRec."C.S.T. No."
                    {
                    }
                    column(Sales_Invoice_Header___External_Document_No___Control1000000088; "Sales Invoice Header"."External Document No.")
                    {
                    }
                    column(Sales_Invoice_Header___Bill_to_Address__________Sales_Invoice_Header___Bill_to_Address_2__Control1000000148; "Sales Invoice Header"."Bill-to Address" + ', ' + "Sales Invoice Header"."Bill-to Address 2")
                    {
                    }
                    column(DataItem1000000149; "Sales Invoice Header"."Bill-to City" + ',' + Cg_statedescrp + ' - ' + "Sales Invoice Header"."Bill-to Post Code")
                    {
                    }
                    column(Sales_Invoice_Header___Shipment_Date__Control1000000150; "Sales Invoice Header"."Shipment Date")
                    {
                    }
                    column(OrderNo_Control1000000154; OrderNo)
                    {
                    }
                    column(Lob_Control1000000155; Lob)
                    {
                    }
                    column(Reg_Control1000000156; Reg)
                    {
                    }
                    column(COMPANYNAME_Control1000000159; COMPANYNAME)
                    {
                    }
                    column(Address1________Address2_____City___________PinCode_Control1000000160; Address1 + ', ' + Address2 + ',' + City + ' - ' + PinCode)
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Address__________Sales_Invoice_Header___Ship_to_Address_2__Control1000000162; "Sales Invoice Header"."Ship-to Address" + ' , ' + "Sales Invoice Header"."Ship-to Address 2")
                    {
                    }
                    column(DataItem1000000165; "Sales Invoice Header"."Ship-to City" + ',' + Cg_statedescrp + '-' + "Sales Invoice Header"."Ship-to Post Code")
                    {
                    }
                    column(ProdlineDIM_Control1000000166; ProdlineDIM)
                    {
                    }
                    column(in___CG_Curr2_Control1000000167; 'in ' + CG_Curr2)
                    {
                    }
                    column(CG_Billtophone_Control1000000169; CG_Billtophone)
                    {
                    }
                    column(Cg_Shipment_Control1000000171; Cg_Shipment)
                    {
                    }
                    column(Sales_Invoice_Header___Shipping_Agent_Code__Control1000000174; "Sales Invoice Header"."Shipping Agent Code")
                    {
                    }
                    column(Sales_Invoice_Header___Ship_to_Name_2__Control1000000175; "Sales Invoice Header"."Ship-to Name 2")
                    {
                    }
                    column(Sales_Invoice_Header___Bill_to_Name_2__Control1000000176; "Sales Invoice Header"."Bill-to Name 2")
                    {
                    }
                    column(TxtCustNameval_Control1000000177; TxtCustNameval)
                    {
                    }
                    column(TxtCustName_Control1000000178; TxtCustName)
                    {
                    }
                    column(Sales_Invoice_Header___No___Control1000000181; "Sales Invoice Header"."No.")
                    {
                    }
                    column(Sales_Invoice_Header___Posting_Date__Control1000000183; "Sales Invoice Header"."Posting Date")
                    {
                    }
                    column(PageText_Control1000000184; PageText)
                    {
                    }
                    column(NeftCode_Control1000000187; NeftCode)
                    {
                    }
                    column(AccNo_Control1000000188; AccNo)
                    {
                    }
                    column(BankName_Control1000000189; BankName)
                    {
                    }
                    column(REMIT_TOCaption; REMIT_TOCaptionLbl)
                    {
                    }
                    column(Direct_Inquiries_to_your_Local_Nordson_OfficeCaption; Direct_Inquiries_to_your_Local_Nordson_OfficeCaptionLbl)
                    {
                    }
                    column(Phone__Caption; Phone__CaptionLbl)
                    {
                    }
                    column(Desp_TimeCaption; Desp_TimeCaptionLbl)
                    {
                    }
                    column(Payment_Terms__Caption; Payment_Terms__CaptionLbl)
                    {
                    }
                    column(Customer_GST_UID_Caption; GSTUID)
                    {
                    }
                    column(CST_No_Caption; CST_No_CaptionLbl)
                    {
                    }
                    column(LST_No_Caption; LST_No_CaptionLbl)
                    {
                    }
                    column(Customer_PO_No____RefCaption; Customer_PO_No____RefCaptionLbl)
                    {
                    }
                    column(PO_DateCaption; PO_DateCaptionLbl)
                    {
                    }
                    column(Our_Ref_Caption; Our_Ref_CaptionLbl)
                    {
                    }
                    column(Date_ShippedCaption; Date_ShippedCaptionLbl)
                    {
                    }
                    column(System_or_SpareCaption; System_or_SpareCaptionLbl)
                    {
                    }
                    column(S_NOCaption; S_NOCaptionLbl)
                    {
                    }
                    column(Part_NumberCaption; Part_NumberCaptionLbl)
                    {
                    }
                    column(DescriptionCaption; DescriptionCaptionLbl)
                    {
                    }
                    column(Quantity_ShippedCaption; Quantity_ShippedCaptionLbl)
                    {
                    }
                    column(UOMCaption; UOMCaptionLbl)
                    {
                    }
                    column(Unit_PriceCaption; Unit_PriceCaptionLbl)
                    {
                    }
                    column(Total_Caption; Total_CaptionLbl)
                    {
                    }
                    column(INVOICE_TOCaption; INVOICE_TOCaptionLbl)
                    {
                    }
                    column(LOB__Caption; LOB__CaptionLbl)
                    {
                    }
                    column(REG_Caption; REG_CaptionLbl)
                    {
                    }
                    column(TIN_NoCaption; TIN_NoCaptionLbl)
                    {
                    }
                    column(SHIP_TOCaption; SHIP_TOCaptionLbl)
                    {
                    }
                    column(Shipment_Method_Code_Caption; Shipment_Method_Code_CaptionLbl)
                    {
                    }
                    column(Phone_No___Caption; Phone_No___CaptionLbl)
                    {
                    }
                    column(Shipment_agent_code___Caption; Shipment_agent_code___CaptionLbl)
                    {
                    }
                    column(InvoiceCaption; InvoiceCaptionLbl)
                    {
                    }
                    column(No_Caption; No_CaptionLbl)
                    {
                    }
                    column(DateCaption; DateCaptionLbl)
                    {
                    }
                    column(Bank_Details_Caption; Bank_Details_CaptionLbl)
                    {
                    }
                    column(REMIT_TOCaption_Control1000000024; REMIT_TOCaption_Control1000000024Lbl)
                    {
                    }
                    column(Direct_Inquiries_to_your_Local_Nordson_OfficeCaption_Control1000000029; Direct_Inquiries_to_your_Local_Nordson_OfficeCaption_Control1000000029Lbl)
                    {
                    }
                    column(Phone__Caption_Control1000000071; Phone__Caption_Control1000000071Lbl)
                    {
                    }
                    column(Desp_TimeCaption_Control1000000073; Desp_TimeCaption_Control1000000073Lbl)
                    {
                    }
                    column(Payment_Terms__Caption_Control1000000074; Payment_Terms__Caption_Control1000000074Lbl)
                    {
                    }
                    column(Customer_Sales_Tax_No_Caption_Control1000000077; Customer_Sales_Tax_No_Caption_Control1000000077Lbl)
                    {
                    }
                    column(CST_No_Caption_Control1000000078; CST_No_Caption_Control1000000078Lbl)
                    {
                    }
                    column(LST_No_Caption_Control1000000079; LST_No_Caption_Control1000000079Lbl)
                    {
                    }
                    column(Customer_PO_No____RefCaption_Control1000000086; Customer_PO_No____RefCaption_Control1000000086Lbl)
                    {
                    }
                    column(PO_DateCaption_Control1000000110; PO_DateCaption_Control1000000110Lbl)
                    {
                    }
                    column(Our_Ref_Caption_Control1000000112; Our_Ref_Caption_Control1000000112Lbl)
                    {
                    }
                    column(Date_ShippedCaption_Control1000000127; Date_ShippedCaption_Control1000000127Lbl)
                    {
                    }
                    column(System_or_SpareCaption_Control1000000129; System_or_SpareCaption_Control1000000129Lbl)
                    {
                    }
                    column(PO_Item__Caption; PO_Item__CaptionLbl)
                    {
                    }
                    column(Part_NumberCaption_Control1000000136; Part_NumberCaption_Control1000000136Lbl)
                    {
                    }
                    column(DescriptionCaption_Control1000000137; DescriptionCaption_Control1000000137Lbl)
                    {
                    }
                    column(Quantity_ShippedCaption_Control1000000138; Quantity_ShippedCaption_Control1000000138Lbl)
                    {
                    }
                    column(UOMCaption_Control1000000139; UOMCaption_Control1000000139Lbl)
                    {
                    }
                    column(Unit_PriceCaption_Control1000000140; Unit_PriceCaption_Control1000000140Lbl)
                    {
                    }
                    column(Total_Caption_Control1000000141; Total_Caption_Control1000000141Lbl)
                    {
                    }
                    column(INVOICE_TOCaption_Control1000000147; INVOICE_TOCaption_Control1000000147Lbl)
                    {
                    }
                    column(LOB__Caption_Control1000000151; LOB__Caption_Control1000000151Lbl)
                    {
                    }
                    column(REG_Caption_Control1000000157; REG_Caption_Control1000000157Lbl)
                    {
                    }
                    column(TIN_NoCaption_Control1000000158; TIN_NoCaption_Control1000000158Lbl)
                    {
                    }
                    column(SHIP_TOCaption_Control1000000164; SHIP_TOCaption_Control1000000164Lbl)
                    {
                    }
                    column(Shipment_Method_Code_Caption_Control1000000170; Shipment_Method_Code_Caption_Control1000000170Lbl)
                    {
                    }
                    column(Phone_No___Caption_Control1000000172; Phone_No___Caption_Control1000000172Lbl)
                    {
                    }
                    column(Shipment_agent_code___Caption_Control1000000173; Shipment_agent_code___Caption_Control1000000173Lbl)
                    {
                    }
                    column(InvoiceCaption_Control1000000179; InvoiceCaption_Control1000000179Lbl)
                    {
                    }
                    column(No_Caption_Control1000000180; No_Caption_Control1000000180Lbl)
                    {
                    }
                    column(DateCaption_Control1000000182; DateCaption_Control1000000182Lbl)
                    {
                    }
                    column(Bank_Details_Caption_Control1000000190; Bank_Details_Caption_Control1000000190Lbl)
                    {
                    }
                    column(CopyLoop_Number; Number)
                    {
                    }
                    column(NoOfCopies; NoOfCopies)
                    {
                    }
                    column(NoOfLoops; NoOfLoops)
                    {
                    }
                    column(CompInfo_Name; CompInfo.Name)
                    {
                    }
                    column(TINNO_CompanyInfo; '')//CompInfo."T.I.N. No."
                    {
                    }
                    column(CSTNO_CompanyInfo; '')//CompInfo."C.S.T No."
                    {
                    }
                    column(ECCNO_CompanyInfo; '')//CompInfo."E.C.C. No."
                    {
                    }
                    column(PANNO_CompanyInfo; CompInfo."P.A.N. No.")
                    {
                    }
                    column(GST_RegistrationNo; CompInfo."GST Registration No.")
                    {
                    }
                    column(SERVICETAXREGNO_CompanyInfo; '')//CompInfo."Service Tax Registration No."
                    {
                    }
                    column(CIN_CompanyInfo; CompInfo.CIN)
                    {
                    }
                    column(ROUND_Disc_1_____; ROUND(Disc, 1, '='))
                    {
                    }
                    column(ROUND_InvAmt_1_____; ROUND(InvAmt, 1, '='))
                    {
                    }
                    column(ROUND_ExciseAmt_1_____; ROUND(ExciseAmt, 1, '='))
                    {
                    }
                    column(ROUND_eCessAmt_1_____; ROUND(eCessAmt, 1, '='))
                    {
                    }
                    column(TaxAmt; TaxAmt)
                    {
                    }
                    column(ROUND_PF_1_____; ROUND(PF, 1, '='))
                    {
                    }
                    column(ROUND_Freight_1_____; ROUND(Freight, 1, '='))
                    {
                    }
                    column(ROUND_Total_1_____; ROUND(Total, 1, '='))
                    {
                    }
                    column(ROUND_AdvAmt_1_____; ROUND(AdvAmt, 1, '='))
                    {
                    }
                    column(ROUND_Total_AdvAmt_1_____; ROUND(Total - AdvAmt, 1, '='))
                    {
                    }
                    column(AmtinWords_1____AmtinWords_2_; AmtinWords[1] + AmtinWords[2])
                    {
                    }
                    column(GSTAmtinWords_1____GSTAmtinWords_2_; GstAmtinWords[1])
                    {
                    }
                    column(Note; Note)
                    {
                    }
                    column(FormCaption; FormCaption)
                    {
                    }
                    column(ROUND_SHECessAmt_1_____; ROUND(SHECessAmt, 1, '='))
                    {
                    }
                    column(CG_Curr; CG_Curr)
                    {
                    }
                    column(DiscountCaption; DiscountCaption)
                    {
                    }
                    column(Text50000; '')//Text50000
                    {
                    }
                    column(CurrReport_PAGENO; CurrReport.PAGENO())
                    {
                    }
                    column(NORDSONCaption; NORDSONCaptionLbl)
                    {
                    }
                    column(Add___Packing___FarwardingCaption; Add___Packing___FarwardingCaptionLbl)
                    {
                    }
                    column(Add___Excise_DutyCaption; Add___Excise_DutyCaptionLbl)
                    {
                    }
                    column(Add___Ednl_Cess_2__on_EDCaption; Add___Ednl_Cess_2__on_EDCaptionLbl)
                    {
                    }
                    column(Add___FreightCaption; Add___FreightCaptionLbl)
                    {
                    }
                    column(TotalCaption; TotalCaptionLbl)
                    {
                    }
                    column(Less___Advance_ReceivedCaption; Less___Advance_ReceivedCaptionLbl)
                    {
                    }
                    column(BalanceCaption; BalanceCaptionLbl)
                    {
                    }
                    column(TIN_No_Caption; TIN_No_CaptionLbl)
                    {
                    }
                    column(CST_NO_Caption_Control1000000035; CST_NO_Caption_Control1000000035Lbl)
                    {
                    }
                    column(ECC_NO_Caption; ECC_NO_CaptionLbl)
                    {
                    }
                    column(PAN_NO_Caption; PAN_NO_CaptionLbl)
                    {
                    }
                    column(Serv__Tax_No_Caption; Serv__Tax_No_CaptionLbl)
                    {
                    }
                    column(For_NORDSON_INDIA_PRIVATE_LIMITEDCaption; For_NORDSON_INDIA_PRIVATE_LIMITEDCaptionLbl)
                    {
                    }
                    column(Authorised_SignatoryCaption; Authorised_SignatoryCaptionLbl)
                    {
                    }
                    column(Note_Caption; Note_CaptionLbl)
                    {
                    }
                    column(Add___SHE_Cess_1__on_EDCaption; Add___SHE_Cess_1__on_EDCaptionLbl)
                    {
                    }
                    column(InsuranceCaption; InsuranceCaptionLbl)
                    {
                    }
                    column(Page_No_Caption; Page_No_CaptionLbl)
                    {
                    }
                    column(CINCaption; CINCaptionLbl)
                    {
                    }
                    column(PageLoop_Number; Number)
                    {
                    }
                    column(Nordson_Regd__No_Caption; Nordson_Regd__No_CaptionLbl)
                    {
                    }
                    column(CGSTCaption; CGSTCaption)
                    {
                    }
                    column(SGSTCaption; SGSTCaption)
                    {
                    }
                    column(IGSTCaption; IGSTCaption)
                    {
                    }
                    column(RateCaption; RateCaption)
                    {
                    }
                    column(AmountCaption; AmountCaption)
                    {
                    }
                    column(HsnCodeCaption; HsnCodeCaption)
                    {
                    }
                    column(GSTTotalCAption; GSTTotalCAption)
                    {
                    }
                    column(GSTRegNoCaption; GSTRegNoCaption)
                    {
                    }
                    column(IECNoCaption; IECNoCaption)
                    {
                    }
                    column(GstinWordsCaption; GstinWordsCaption)
                    {
                    }
                    column(TAxSetoffCaption; TAxSetoffCaption)
                    {
                    }
                    column(BalanceTaxCaption; BalanceTaxCaption)
                    {
                    }
                    column(LineAmountTotalCaption; LineAmountTotalCaption)
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(TaxablevalueCaption; TaxablevalueCaption)
                    {
                    }
                    column(Note_value; Note_value)
                    {
                    }
                    column(PanCaption; PanCaption)
                    {
                    }
                    column(LUTCaption; LUTCaption)
                    {
                    }
                    column(NoOfPrint; NoOfPrint)
                    {
                    }
                    column(GTitle; GTitle)
                    {
                    }
                    column(NoteCaptionLbl; NoteCaptionLbl)
                    {
                    }
                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING("Document No.", "Line No.")
                                            ORDER(Ascending)
                                            WHERE(Quantity = FILTER(<> 0));
                        column(Sales_Invoice_Line__Sales_Invoice_Line___Unit_of_Measure_; "Sales Invoice Line"."Unit of Measure")
                        {
                        }
                        column(Sales_Invoice_Line__Sales_Invoice_Line___No__; "Sales Invoice Line"."No.")
                        {
                        }
                        column(Sales_Invoice_Line___Cross_Reference_No________Sales_Invoice_Line__Description; "Sales Invoice Line"."Item Reference No." + '-' + "Sales Invoice Line".Description)
                        {
                        }
                        column(Sales_Invoice_Line__Sales_Invoice_Line__Quantity; "Sales Invoice Line".Quantity)
                        {
                        }
                        column(Sales_Invoice_Line__Sales_Invoice_Line___Unit_Price_; ROUND("Sales Invoice Line"."Unit Price"))
                        {
                        }
                        column(Sales_Invoice_Line___Unit_Price___Sales_Invoice_Line__Quantity; "Sales Invoice Line"."Unit Price" * "Sales Invoice Line".Quantity)
                        {
                        }
                        column(Sales_Invoice_Line__Sales_Invoice_Line___Unit_of_Measure__Control1000000099; "Sales Invoice Line"."Unit of Measure")
                        {
                        }
                        column(SNo; SNo)
                        {
                        }
                        column(LineType; LineType)
                        {
                        }
                        column(Sales_Invoice_Line__Sales_Invoice_Line___No___Control1000000096; "Sales Invoice Line"."No.")
                        {
                        }
                        column(Sales_Invoice_Line__Sales_Invoice_Line__Description; "Sales Invoice Line".Description)
                        {
                        }
                        column(Sales_Invoice_Line__Sales_Invoice_Line__Quantity_Control1000000098; "Sales Invoice Line".Quantity)
                        {
                        }
                        column(Sales_Invoice_Line__Sales_Invoice_Line___Unit_Price__Control1000000100; "Sales Invoice Line"."Unit Price")
                        {
                        }
                        column(Sales_Invoice_Line___Unit_Price___Sales_Invoice_Line__Quantity_Control1000000101; "Sales Invoice Line"."Unit Price" * "Sales Invoice Line".Quantity)
                        {
                        }
                        column(Sales_Invoice_Line_Document_No_; "Document No.")
                        {
                        }
                        column(Sales_Invoice_Line_Line_No_; "Line No.")
                        {
                        }
                        column(CGSTRate; CGSTRate)
                        {
                        }
                        column(CGSTAmount; CGSTAmount)
                        {
                        }
                        column(SGSTRate; SGSTRate)
                        {
                        }
                        column(SGSTAmount; SGSTAmount)
                        {
                        }
                        column(IGSTRate; IGSTRate)
                        {
                        }
                        column(IGSTAmount; IGSTAmount)
                        {
                        }
                        column(TotalCGSTAmount; TotalCGSTAmount)
                        {
                        }
                        column(TotalSGSTAmount; TotalSGSTAmount)
                        {
                        }
                        column(TotalGST; TotalGST)
                        {
                        }
                        column(Sales_Invoice_Line_HSN_Code; "Sales Invoice Line"."HSN/SAC Code")
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF "Sales Invoice Line".Type = "Sales Invoice Line".Type::Item THEN
                                SNo := SNo + 1;
                            CLEAR(LineType);
                            LineType := "Sales Invoice Line".Type;

                            IF (("Sales Invoice Line".Description = 'Rounding Difference A/c')) THEN
                                CurrReport.SKIP();

                            Counter := Counter - 1;
                            Disc := Disc + "Sales Invoice Line"."Line Discount Amount";
                            InvAmt := InvAmt + ("Sales Invoice Line"."Unit Price" * "Sales Invoice Line".Quantity);

                            IF Counter <= 0 THEN BEGIN
                                CurrReport.NEWPAGE();
                                Counter := 11;
                            END;

                            IF Counter = 1 THEN
                                PrintLineBody := TRUE
                            ELSE
                                PrintLineBody := FALSE;

                            FooterPreseSection();

                        end;

                        trigger OnPreDataItem()
                        begin
                            //CurrReport.CREATETOTALS("Sales Invoice Line"."Tax Amount","Sales Invoice Line"."Line Discount Amount");
                            CLEAR(FrghtItemCharges);
                            CLEAR(Disc);
                            CLEAR(InvAmt);
                            CLEAR(ExciseAmt);
                            CLEAR(SHECessAmt);
                            CLEAR(eCessAmt);
                            //VATAmt := VATAmt + "Sales Invoice Line"."VAT Amount"; //Migration.230910.RK "VAT Amount" field not available
                            CLEAR(VATAmt);
                            CLEAR(CSTAmtForm);
                            CLEAR(CSTAmt);
                            CLEAR(SNo);
                        end;
                    }
                    dataitem(Integer; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            ORDER(Ascending);
                        column(Integer_Number; Number)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            IF Counter <= 0 THEN
                                CurrReport.BREAK()
                            ELSE
                                Counter := Counter - 1;
                        end;
                    }

                    trigger OnAfterGetRecord()
                    begin
                        HeaderPreSection1();
                        HeaderPresection2();
                        CompInfo.GET();
                        CompInfo.CALCFIELDS(Picture);
                    end;
                }
                dataitem(CustLedgEntry; "Cust. Ledger Entry")
                {
                    DataItemLink = "Customer No." = FIELD("Sell-to Customer No."),
                                   "Document No." = FIELD("No.");
                    DataItemLinkReference = "Sales Invoice Header";
                    DataItemTableView = SORTING("Entry No.")
                                        ORDER(Ascending)
                                        WHERE("Document Type" = CONST(Invoice));
                    dataitem(CustLedgEntry1; "Cust. Ledger Entry")
                    {
                        DataItemTableView = SORTING("Entry No.")
                                            ORDER(Ascending);
                        trigger OnPreDataItem()
                        begin
                            CustLedgEntry1.SETCURRENTKEY("Entry No.");
                            CustLedgEntry1.SETRANGE("Entry No.");

                            IF CustLedgEntry."Closed by Entry No." <> 0 THEN BEGIN
                                CustLedgEntry1."Entry No." := CustLedgEntry."Closed by Entry No.";
                                MARK(TRUE);
                            END;

                            CustLedgEntry1.SETCURRENTKEY("Closed by Entry No.");
                            CustLedgEntry1.SETRANGE("Closed by Entry No.", CustLedgEntry."Entry No.");
                            IF CustLedgEntry1.FIND('-') THEN
                                REPEAT
                                    CustLedgEntry1.MARK(TRUE);
                                UNTIL NEXT() = 0;

                            CustLedgEntry1.SETCURRENTKEY("Entry No.");
                            CustLedgEntry1.SETRANGE("Closed by Entry No.");
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    //IF Number > 1 THEN
                    // OutputNo += 1;

                    IF NoOfPrint THEN BEGIN //SE-E969
                        IF Number = 1 THEN
                            PageText := 'ORIGINAL FOR BUYER';
                        IF Number = 2 THEN
                            PageText := 'DUPLICATE FOR TRANSPORTER';
                        IF Number = 3 THEN
                            PageText := 'TRIPLICATE FOR ASSESSEE';
                        IF Number = 4 THEN
                            PageText := 'EXTRA';
                    END;//SE-E969


                    CLEAR(FrghtItemCharges);
                    CLEAR(Disc);
                    CLEAR(InvAmt);
                    CLEAR(ExciseAmt);
                    CLEAR(SHECessAmt);
                    CLEAR(eCessAmt);
                    CLEAR(VATAmt);
                    CLEAR(CSTAmtForm);
                    CLEAR(CSTAmt);
                end;

                trigger OnPreDataItem()
                begin
                    IF NoOfPrint THEN BEGIN
                        CustomerRec.RESET();
                        CustomerRec.SETRANGE(CustomerRec."No.", "Sales Invoice Header"."Sell-to Customer No.");
                        IF CustomerRec.FINDFIRST() THEN
                            NoOfCopies := 4;
                    END;

                    NoOfLoops := ABS(NoOfCopies) + 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin

                Counter := 11;

                IF "Sales Invoice Header"."Location Code" = 'TRADING' THEN
                    Trading := TRUE
                ELSE
                    Trading := FALSE;

                IF Trading THEN
                    Te := 'Spare'
                ELSE
                    Te := 'System';

                InvAmt := 0;
                Disc := 0;
                VATAmt := 0;
                CSTAmt := 0;
                CSTAmtForm := 0;
                PandF := 0;
                Freight := 0;
                AdvAmt := 0;
                SHECessAmt := 0;
                eCessAmt := 0;
                ExciseAmt := 0;
                TaxAmt := 0;
                FrghtItemCharges := 0;
                PF := 0;

                BankName := CompInfo."Bank Name";
                BankAddress := CompInfo."Bank Branch No.";
                AccNo := 'Account No.: ' + CompInfo."Bank Account No.";
                NeftCode := 'IFSC/RTGS/NEFT Code: ' + FORMAT(CompInfo."IFSC Code");
                SalesInvLine.SETRANGE(SalesInvLine."Document No.", "No.");
                SalesInvLine.SETRANGE(SalesInvLine.Type, "Sales Invoice Line".Type::"Charge (Item)");
                SalesInvLine.SETFILTER(SalesInvLine."No.", '=%1', 'FRT-OUT');
                IF SalesInvLine.FIND('-') THEN
                    REPEAT
                        Freight := SalesInvLine."Unit Price";
                    UNTIL (SalesInvLine.NEXT() = 0);

                CusLedgEntry.INIT();
                CusLedgEntry.RESET();
                CusLedgEntry.SETFILTER(CusLedgEntry."Document No.", "Sales Invoice Header"."No.");
                IF CusLedgEntry.FIND('-') THEN BEGIN
                    CusLedgEntry.CALCFIELDS(CusLedgEntry."Amount (LCY)", CusLedgEntry."Remaining Amt. (LCY)");
                    AdvAmt := (CusLedgEntry."Amount (LCY)" - CusLedgEntry."Remaining Amt. (LCY)");
                END ELSE
                    AdvAmt := 0;

                CG_recShipmentMethod.RESET();
                CG_recShipmentMethod.SETRANGE(CG_recShipmentMethod.Code, "Shipment Method Code");
                IF CG_recShipmentMethod.FIND('-') THEN
                    Cg_Shipment := CG_recShipmentMethod.Description;


                CustomerRec.RESET();
                CustomerRec.SETRANGE(CustomerRec."No.", "Bill-to Customer No.");
                IF CustomerRec.FIND('-') THEN
                    CG_Billtophone := CustomerRec."Phone No.";


                Cg_RecState.RESET();
                Cg_RecState.SETRANGE(Cg_RecState.Code, State);
                IF Cg_RecState.FIND('-') THEN
                    Cg_statedescrp := Cg_RecState.Description;


                CLEAR(Var_OrderNo);
                SalesInvoiceLine.RESET();
                SalesInvoiceLine.SETRANGE(SalesInvoiceLine."Document No.", "Sales Invoice Header"."No.");
                SalesInvoiceLine.SETFILTER(SalesInvoiceLine.Type, '%1', SalesInvoiceLine.Type::Item);
                IF SalesInvoiceLine.FINDFIRST() THEN
                    IF SalesShipmentHeader.GET(SalesInvoiceLine."Shipment No.") THEN
                        Var_OrderNo := SalesShipmentHeader."Order No.";

                CustomerRec.RESET();
                CustomerRec.SETRANGE(CustomerRec."No.", "Sell-to Customer No.");
                IF CustomerRec.FINDFIRST() THEN
                    StateCode := CustomerRec."State Code";
                States.RESET();
                States.SETRANGE(States.Code, StateCode);
                IF States.FINDFIRST() THEN
                    PlaceofSupply := States.Description;
                StateCodeNo := States.Code;

                IF ((CustomerRec."GST Registration Type" = CustomerRec."GST Registration Type"::UID) AND (CustomerRec."GST Customer Type" = CustomerRec."GST Customer Type"::Unregistered)) THEN
                    GSTUID := 'Customer UID No.'
                ELSE
                    GSTUID := 'Customer GST No.';

                TotalIGSTAmount := 0;
                DetailedGSTLedgerEntry.RESET();
                DetailedGSTLedgerEntry.SETFILTER(DetailedGSTLedgerEntry."Entry Type", '%1', DetailedGSTLedgerEntry."Entry Type"::"Initial Entry");
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."Document No.", "No.");
                DetailedGSTLedgerEntry.SETRANGE(DetailedGSTLedgerEntry."Document No.", "No.");
                IF DetailedGSTLedgerEntry.FINDSET() THEN
                    REPEAT
                        IF DetailedGSTLedgerEntry."GST Component Code" = 'IGST' THEN
                            IF DetailedGSTLedgerEntry."Currency Code" <> '' THEN
                                TotalIGSTAmount += ABS(ROUND(DetailedGSTLedgerEntry."GST Amount" * DetailedGSTLedgerEntry."Currency Factor", 0.01))
                            ELSE
                                TotalIGSTAmount += ABS(DetailedGSTLedgerEntry."GST Amount");

                    UNTIL DetailedGSTLedgerEntry.NEXT() = 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(NoOfPrint; NoOfPrint)
                {
                    Caption = 'No. of  Print';
                    ApplicationArea = All;
                }
                field(DigitalSig; DigitalSig)
                {
                    Caption = 'Digital Signature';
                    ApplicationArea = All;
                }
            }
        }


        trigger OnInit()
        begin
            CLEAR(NoOfPrint);
            CLEAR(DigitalSig);
        end;
    }

    trigger OnInitReport()
    begin
        //CompanyInfo1.CALCFIELDS("Digital Signature");//SE-E969
    end;

    trigger OnPreReport()
    begin
        InvAmt := 0;
        Disc := 0;
        VATAmt := 0;
        CSTAmt := 0;
        CSTAmtForm := 0;
        PandF := 0;
        Freight := 0;
        AdvAmt := 0;
        CompInfo.GET();
        CompInfo.CALCFIELDS("Digital Signature");
    end;

    var
        CusLedgEntry: Record "Cust. Ledger Entry";
        Trading: Boolean;
        CompInfo: Record "Company Information";
        SalesPerson: Record "Salesperson/Purchaser";
        PaymentTerms: Record "Payment Terms";
        PaymentDesc: Text[50];
        CustomerRec: Record "Customer";
        SNo: Integer;
        Counter: Integer;
        Disc: Decimal;
        InvAmt: Decimal;
        ExciseAmt: Decimal;
        SHECessAmt: Decimal;
        eCessAmt: Decimal;
        VATAmt: Decimal;
        CSTAmt: Decimal;
        CSTAmtForm: Decimal;
        //StrDetails: Record "13798";
        PandF: Decimal;
        Freight: Decimal;
        Total: Decimal;
        Check: Report "Check Report";
        AmtinWords: array[2] of Text[80];
        Te: Text[20];
        DetailCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        AdvAmt: Decimal;
        FrghtItemCharges: Decimal;
        Lob: Code[50];
        DimVal: Record "Dimension Value";
        Reg: Code[20];
        PF: Decimal;
        SalesInvLine: Record "Sales Invoice Line";
        OrderNo: Code[20];
        PrintLineBody: Boolean;
        Address1: Text[50];
        Address2: Text[50];
        City: Text[30];
        PinCode: Code[20];
        "--Ravi--": Integer;
        Note: Text[1024];
        VatPer: Decimal;
        VatCaption: Text[30];
        VatCaption1: Text[30];
        ProdlineDIM: Code[50];
        CG_Curr: Code[10];
        CG_Curr2: Text[10];
        Cg_Shipment: Text[100];
        CG_recShipmentMethod: Record "Shipment Method";
        CG_Billtophone: Text[30];
        Cg_RecState: Record State;
        Cg_statedescrp: Text[100];
        RecShipment: Record "Shipment Method";
        RecCustomer: Record Customer;
        TxtCustName: Text[200];
        TxtCustNameval: Text[200];
        TaxAreaLine: Record "Tax Area Line";
        TaxJurid: Record "Tax Jurisdiction";
        TaxJuriCode: Code[10];
        TaxDetail: Record "Tax Detail";
        Taxper: Text[30];
        FormCaption: Text[50];
        TaxAmt: Decimal;
        DiscountCaption: Text[30];
        NoteOptions: Option Nonote,Cformnote,Iformnote;
        PageText: Text[100];
        ReportCnt: Integer;
        BankName: Text[60];
        BankAddress: Text[60];
        NeftCode: Text[50];
        AccNo: Text[60];
        ECMS: Boolean;
        Cust2: Record Customer;
        Code1: Code[10];
        Code2: Code[10];
        Code3: Code[10];
        Cust: Record Customer;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[10];
        REMIT_TOCaptionLbl: Label 'REMIT TO';
        Direct_Inquiries_to_your_Local_Nordson_OfficeCaptionLbl: Label 'Direct Inquiries to your Local Weidmueller Office';
        Phone__CaptionLbl: Label 'Phone :';
        Desp_TimeCaptionLbl: Label 'Desp Time';
        Payment_Terms__CaptionLbl: Label 'Payment Terms :';
        Customer_Sales_Tax_No_CaptionLbl: Label 'Customer GST No.';
        CST_No_CaptionLbl: Label 'Place of Supply:';
        LST_No_CaptionLbl: Label 'LST No.';
        Customer_PO_No____RefCaptionLbl: Label 'Customer PO No. / Ref';
        PO_DateCaptionLbl: Label 'PO Date';
        Our_Ref_CaptionLbl: Label 'Our Ref.';
        Date_ShippedCaptionLbl: Label 'Date Shipped';
        System_or_SpareCaptionLbl: Label 'System or Spare';
        S_NOCaptionLbl: Label 'S.No';
        Part_NumberCaptionLbl: Label 'Part Number';
        DescriptionCaptionLbl: Label 'Description';
        Quantity_ShippedCaptionLbl: Label 'Qty';
        UOMCaptionLbl: Label 'UOM';
        Unit_PriceCaptionLbl: Label 'Unit Price';
        Total_CaptionLbl: Label 'Total ';
        INVOICE_TOCaptionLbl: Label 'BILL TO';
        LOB__CaptionLbl: Label 'LOB :';
        REG_CaptionLbl: Label 'REG:';
        TIN_NoCaptionLbl: Label 'TIN No';
        SHIP_TOCaptionLbl: Label 'SHIP TO';
        Shipment_Method_Code_CaptionLbl: Label 'Shipment Method Code:';
        Phone_No___CaptionLbl: Label 'Phone No. :';
        Shipment_agent_code___CaptionLbl: Label 'Shipment agent code : ';
        InvoiceCaptionLbl: Label 'EXPORT INVOICE';
        No_CaptionLbl: Label 'No.';
        DateCaptionLbl: Label 'Date';
        Bank_Details_CaptionLbl: Label 'Bank Details:';
        REMIT_TOCaption_Control1000000024Lbl: Label 'REMIT TO';
        Direct_Inquiries_to_your_Local_Nordson_OfficeCaption_Control1000000029Lbl: Label 'Direct Inquiries to your Local Weidmueller Office';
        Phone__Caption_Control1000000071Lbl: Label 'Phone :';
        Desp_TimeCaption_Control1000000073Lbl: Label 'Desp Time';
        Payment_Terms__Caption_Control1000000074Lbl: Label 'Payment Terms :';
        Customer_Sales_Tax_No_Caption_Control1000000077Lbl: Label 'Customer Sales Tax No.';
        CST_No_Caption_Control1000000078Lbl: Label 'CST No.';
        LST_No_Caption_Control1000000079Lbl: Label 'LST No.';
        Customer_PO_No____RefCaption_Control1000000086Lbl: Label 'Customer PO No. / Ref';
        PO_DateCaption_Control1000000110Lbl: Label 'PO Date';
        Our_Ref_Caption_Control1000000112Lbl: Label 'Our Ref.';
        Date_ShippedCaption_Control1000000127Lbl: Label 'Date Shipped';
        System_or_SpareCaption_Control1000000129Lbl: Label 'System or Spare';
        PO_Item__CaptionLbl: Label 'PO Item #';
        Part_NumberCaption_Control1000000136Lbl: Label 'Part Number';
        DescriptionCaption_Control1000000137Lbl: Label 'Description';
        Quantity_ShippedCaption_Control1000000138Lbl: Label 'Qty Shipped';
        UOMCaption_Control1000000139Lbl: Label 'UOM';
        Unit_PriceCaption_Control1000000140Lbl: Label 'Unit Price';
        Total_Caption_Control1000000141Lbl: Label 'Total ';
        INVOICE_TOCaption_Control1000000147Lbl: Label 'INVOICE TO';
        LOB__Caption_Control1000000151Lbl: Label 'LOB :';
        REG_Caption_Control1000000157Lbl: Label 'REG:';
        TIN_NoCaption_Control1000000158Lbl: Label 'TIN No';
        SHIP_TOCaption_Control1000000164Lbl: Label 'SHIP TO';
        Shipment_Method_Code_Caption_Control1000000170Lbl: Label 'Shipment Method Code:';
        Phone_No___Caption_Control1000000172Lbl: Label 'Phone No. :';
        Shipment_agent_code___Caption_Control1000000173Lbl: Label 'Shipment agent code : ';
        InvoiceCaption_Control1000000179Lbl: Label 'EXPORT INVOICE';
        No_Caption_Control1000000180Lbl: Label 'No.';
        DateCaption_Control1000000182Lbl: Label 'Date';
        Bank_Details_Caption_Control1000000190Lbl: Label 'Bank Details:';
        NORDSONCaptionLbl: Label 'NORDSON';
        Add___Packing___FarwardingCaptionLbl: Label 'Add : Packing & Farwarding';
        Add___Excise_DutyCaptionLbl: Label 'Add : Excise Duty';
        Add___Ednl_Cess_2__on_EDCaptionLbl: Label 'Add : Ednl.Cess 2% on ED';
        Add___FreightCaptionLbl: Label 'Add : Freight';
        TotalCaptionLbl: Label 'Total';
        Less___Advance_ReceivedCaptionLbl: Label 'Less : Advance Received';
        BalanceCaptionLbl: Label 'Balance';
        TIN_No_CaptionLbl: Label 'TIN No.';
        CST_NO_Caption_Control1000000035Lbl: Label 'CST NO.';
        ECC_NO_CaptionLbl: Label 'ECC NO.';
        PAN_NO_CaptionLbl: Label 'PAN NO.';
        Serv__Tax_No_CaptionLbl: Label 'Serv. Tax No.';
        For_NORDSON_INDIA_PRIVATE_LIMITEDCaptionLbl: Label 'For WEIDMUELLER INDIA PRIVATE LIMITED';
        Authorised_SignatoryCaptionLbl: Label 'Authorized Signatory';
        Note_CaptionLbl: Label 'Note:';
        Add___SHE_Cess_1__on_EDCaptionLbl: Label 'Add : SHE Cess 1% on ED';
        InsuranceCaptionLbl: Label 'Insurance';
        Page_No_CaptionLbl: Label 'Page No.';
        CINCaptionLbl: Label 'CIN';
        //PostedDocumentDimension: Record Document Dim;
        Nordson_Regd__No_CaptionLbl: Label 'Nordson Regd. No.';
        CGSTCaption: Label 'CGST';
        SGSTCaption: Label 'SGST';
        RateCaption: Label 'Rate%';
        AmountCaption: Label 'Amount';
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        CGSTRate: Decimal;
        CGSTAmount: Decimal;
        SGSTRate: Decimal;
        SGSTAmount: Decimal;
        IGSTRate: Decimal;
        IGSTAmount: Decimal;
        INsuranceCharges: Decimal;
        OtherCharges: Decimal;
        PnFCharges: Decimal;
        TotalCGSTAmount: Decimal;
        TotalSGSTAmount: Decimal;
        TotalIGSTAmount: Decimal;
        IGSTCaption: Label 'IGST';
        HsnCodeCaption: Label 'HSN Code';
        GSTTotalCAption: Label 'GST Total:';
        TotalGST: Decimal;
        GSTRegNoCaption: Label 'GST Reg No.';
        IECNoCaption: Label 'IEC NO.';
        GstinWordsCaption: Label 'GST Value In Words:';
        GstAmtinWords: array[2] of Text[80];

        NoToWords: Codeunit AmountToWords;

        TAxSetoffCaption: Label 'Tax Set off on Advance';
        BalanceTaxCaption: Label 'Balance Tax';
        LineAmountTotalCaption: Label 'Amount';
        States: Record State;
        PlaceofSupply: Text;
        StateCode: Code[20];
        StateCodeNo: Code[10];
        GSTUID: Text[20];
        OutputNo: Integer;
        SalesInvHeader: Record "Sales Invoice Header";
        TaxablevalueCaption: Label 'Taxable Value';
        SalesShipmentHeader: Record "Sales Shipment Header";
        Var_OrderNo: Code[20];
        SalesInvoiceLine: Record "Sales Invoice Line";
        Note_value: Label 'General Terms and Condition as per Quote sent';
        Panno: Code[20];
        PanCaption: Label 'P.A.N. No.';
        LineType: Integer;
        LUTCaption: Label 'LUT No.';
        GTitle: Text[30];
        NoOfPrint: Boolean;
        DigitalSig: Boolean;
        ControlBool: Boolean;
        NoteCaptionLbl: Label 'Note: It is a computer generated document. Signature not required.';

        LineAMtToCustomer: Decimal;
        CGSTAmt, CGSTPer : Decimal;
        SGSTAmt, SGSTPer : Decimal;
        IGSTAmt, IGSTPer : Decimal;
        CessAmt, CessPer : Decimal;
        CGSTLbl: Label 'CGST';
        SGSTLbl: Label 'SGST';
        IGSTLbl: Label 'IGST';
        CessLbl: Label 'CESS';


    procedure GetReportCount(RprtCnt: Integer)
    begin
        ReportCnt := RprtCnt;
    end;

    procedure HeaderPreSection1()
    begin
        CompInfo.GET();
        /*SalesInvLine.INIT;
        SalesInvLine.RESET;
        SalesInvLine.SETFILTER(SalesInvLine."Document No.","Sales Invoice Header"."No.");
        SalesInvLine.SETFILTER(SalesInvLine.Type,'=%1',SalesInvLine.Type::Item);
        IF SalesInvLine.FIND('-') THEN BEGIN
          REPEAT
            OrderNo := SalesInvLine."Order No.";
          UNTIL SalesInvLine.NEXT = 0;
        END;*/

        // PSV 28 Dec For Advance Payment

        // PSV 29 Dec
        // PostedDocumentDimension.INIT;
        // PostedDocumentDimension.RESET;
        // PostedDocumentDimension.SETRANGE(PostedDocumentDimension."Dimension Set ID", "Sales Invoice Header"."Dimension Set ID");
        // PostedDocumentDimension.SETFILTER(PostedDocumentDimension."Dimension Code", 'LOB');
        // IF PostedDocumentDimension.FIND('-') THEN BEGIN
        //     DimVal.INIT;
        //     DimVal.RESET;
        //     DimVal.SETFILTER(DimVal.Code, PostedDocumentDimension."Dimension Value Code");
        //     IF DimVal.FIND('-') THEN BEGIN
        //         Lob := DimVal.Name;
        //     END ELSE
        //         Lob := '';
        // END ELSE
        //     Lob := '';

        // PostedDocumentDimension.INIT;
        // PostedDocumentDimension.RESET;
        // PostedDocumentDimension.SETRANGE(PostedDocumentDimension."Dimension Set ID", "Sales Invoice Header"."Dimension Set ID");
        // PostedDocumentDimension.SETFILTER(PostedDocumentDimension."Dimension Code", 'REGION');
        // IF PostedDocumentDimension.FIND('-') THEN BEGIN
        //     DimVal.INIT;
        //     DimVal.RESET;
        //     DimVal.SETFILTER(DimVal.Code, PostedDocumentDimension."Dimension Value Code");
        //     IF DimVal.FIND('-') THEN BEGIN
        //         Reg := DimVal.Name;
        //     END ELSE
        //         Reg := '';
        // END ELSE
        //     Reg := '';



        // // PSV 29 Dec
        // //BSIL_PS.00 Begin
        // PostedDocumentDimension.INIT;
        // PostedDocumentDimension.RESET;
        // PostedDocumentDimension.SETRANGE(PostedDocumentDimension."Dimension Set ID", "Sales Invoice Header"."Dimension Set ID");
        // PostedDocumentDimension.SETFILTER(PostedDocumentDimension."Dimension Code", 'PRODLINE');
        // IF PostedDocumentDimension.FIND('-') THEN BEGIN
        //     DimVal.INIT;
        //     DimVal.RESET;
        //     DimVal.SETFILTER(DimVal.Code, PostedDocumentDimension."Dimension Value Code");
        //     IF DimVal.FIND('-') THEN BEGIN
        //         ProdlineDIM := DimVal.Name;
        //     END ELSE
        //         ProdlineDIM := '';
        // END ELSE
        //     ProdlineDIM := '';
        // //BSIL_PS.00 End


        IF "Sales Invoice Header"."Salesperson Code" <> '' THEN
            SalesPerson.GET("Sales Invoice Header"."Salesperson Code");
        PaymentDesc := '';
        IF "Sales Invoice Header"."Payment Terms Code" <> '' THEN
            IF PaymentTerms.GET("Sales Invoice Header"."Payment Terms Code") THEN
                PaymentDesc := PaymentTerms.Description;

        CustomerRec.GET("Sales Invoice Header"."Sell-to Customer No.");

        IF "Sales Invoice Header"."Currency Code" = '' THEN
            CG_Curr2 := 'Rupees'
        ELSE
            CG_Curr2 := "Sales Invoice Header"."Currency Code";

        RecCustomer.RESET();
        RecCustomer.SETRANGE(RecCustomer."No.", "Sales Invoice Header"."Bill-to Customer No.");
        IF RecCustomer.FIND('-') THEN BEGIN
            IF RecCustomer.Name = '' THEN
                TxtCustName := "Sales Invoice Header"."Bill-to Name"
            ELSE
                TxtCustName := RecCustomer.Name;
        END;

        IF "Sales Invoice Header"."Ship-to Code" <> '' THEN
            TxtCustNameval := "Sales Invoice Header"."Ship-to Name"
        ELSE BEGIN
            RecCustomer.RESET();
            RecCustomer.SETRANGE(RecCustomer."No.", "Sales Invoice Header"."Sell-to Customer No.");
            IF RecCustomer.FIND('-') THEN BEGIN
                IF RecCustomer.Name = '' THEN
                    TxtCustNameval := "Sales Invoice Header"."Sell-to Customer Name"
                ELSE
                    TxtCustNameval := RecCustomer.Name;
            END
        END;

    end;

    procedure HeaderPresection2()
    begin

        CompInfo.GET();
        /*
        SalesInvLine.INIT;
        SalesInvLine.RESET;
        SalesInvLine.SETFILTER(SalesInvLine."Document No.","Sales Invoice Header"."No.");
        SalesInvLine.SETFILTER(SalesInvLine.Type,'=%1',SalesInvLine.Type::Item);
        IF SalesInvLine.FIND('-') THEN BEGIN
          REPEAT
            OrderNo := SalesInvLine."Order No.";
          UNTIL SalesInvLine.NEXT = 0;
        END;
        */

        /*         PostedDocumentDimension.INIT;
                PostedDocumentDimension.RESET;
                PostedDocumentDimension.SETRANGE(PostedDocumentDimension."Dimension Set ID", "Sales Invoice Header"."Dimension Set ID");
                PostedDocumentDimension.SETFILTER(PostedDocumentDimension."Dimension Code", 'LOB');
                IF PostedDocumentDimension.FIND('-') THEN BEGIN
                    DimVal.INIT;
                    DimVal.RESET;
                    DimVal.SETFILTER(DimVal.Code, PostedDocumentDimension."Dimension Value Code");
                    IF DimVal.FIND('-') THEN BEGIN
                        Lob := DimVal.Name;
                    END ELSE
                        Lob := '';
                END ELSE
                    Lob := '';

                PostedDocumentDimension.INIT;
                PostedDocumentDimension.RESET;
                PostedDocumentDimension.SETRANGE(PostedDocumentDimension."Dimension Set ID", "Sales Invoice Header"."Dimension Set ID");
                PostedDocumentDimension.SETFILTER(PostedDocumentDimension."Dimension Code", 'REGION');
                IF PostedDocumentDimension.FIND('-') THEN BEGIN
                    DimVal.INIT;
                    DimVal.RESET;
                    DimVal.SETFILTER(DimVal.Code, PostedDocumentDimension."Dimension Value Code");
                    IF DimVal.FIND('-') THEN BEGIN
                        Reg := DimVal.Name;
                    END ELSE
                        Reg := '';
                END ELSE
                    Reg := '';



                // PSV 29 Dec
                //BSIL_PS.00 Begin
                PostedDocumentDimension.INIT;
                PostedDocumentDimension.RESET;
                PostedDocumentDimension.SETRANGE(PostedDocumentDimension."Dimension Set ID", "Sales Invoice Header"."Dimension Set ID");
                PostedDocumentDimension.SETFILTER(PostedDocumentDimension."Dimension Code", 'PRODLINE');
                IF PostedDocumentDimension.FIND('-') THEN BEGIN
                    DimVal.INIT;
                    DimVal.RESET;
                    DimVal.SETFILTER(DimVal.Code, PostedDocumentDimension."Dimension Value Code");
                    IF DimVal.FIND('-') THEN BEGIN
                        ProdlineDIM := DimVal.Name;
                    END ELSE
                        ProdlineDIM := '';
                END ELSE
                    ProdlineDIM := '';
                //BSIL_PS.00 End
         */

        IF "Sales Invoice Header"."Salesperson Code" <> '' THEN
            SalesPerson.GET("Sales Invoice Header"."Salesperson Code");
        PaymentDesc := '';
        IF "Sales Invoice Header"."Payment Terms Code" <> '' THEN
            IF PaymentTerms.GET("Sales Invoice Header"."Payment Terms Code") THEN
                PaymentDesc := PaymentTerms.Description;

        CustomerRec.GET("Sales Invoice Header"."Sell-to Customer No.");

        IF "Sales Invoice Header"."Currency Code" = '' THEN
            CG_Curr2 := 'Rupees'
        ELSE
            CG_Curr2 := "Sales Invoice Header"."Currency Code";

        RecCustomer.RESET();
        RecCustomer.SETRANGE(RecCustomer."No.", "Sales Invoice Header"."Bill-to Customer No.");
        IF RecCustomer.FIND('-') THEN BEGIN
            IF RecCustomer.Name = '' THEN
                TxtCustName := "Sales Invoice Header"."Bill-to Name"
            ELSE
                TxtCustName := RecCustomer.Name;
        END;

        IF "Sales Invoice Header"."Ship-to Code" <> '' THEN
            TxtCustNameval := "Sales Invoice Header"."Ship-to Name"
        ELSE BEGIN
            RecCustomer.RESET();
            RecCustomer.SETRANGE(RecCustomer."No.", "Sales Invoice Header"."Sell-to Customer No.");
            IF RecCustomer.FIND('-') THEN BEGIN
                IF RecCustomer.Name = '' THEN
                    TxtCustNameval := "Sales Invoice Header"."Sell-to Customer Name"
                ELSE
                    TxtCustNameval := RecCustomer.Name;
            END
        END;

    end;

    procedure FooterPreseSection()
    begin
        CASE NoteOptions OF
            NoteOptions::Cformnote:
                Note := 'Please note that Form C is due to be furnished by you before ___________ ,' +
                 ' failing which you shall be liable to pay the difference in CST.';
            NoteOptions::Iformnote:
                Note := 'Please note that Form I is due to be furnished by you before ____________ ,' +
               ' failing which you shall be liable to pay the CST@ Full Rate.';
            ELSE
                Note := '';
        END;

        GetSalesGSTAmount("Sales Invoice Header", "Sales Invoice Line");


        Freight := Freight + FrghtItemCharges;
        //TaxAmt += "Sales Invoice Line".GetGSTAmounts;


        //Total := InvAmt - Disc + PF + ExciseAmt + eCessAmt + VATAmt + CSTAmtForm + CSTAmt + Freight+SHECessAmt;
        Total := InvAmt - Disc + PF + Freight;
        Check.InitTextVariable();

        Check.FormatNoText(AmtinWords, ROUND(Total, 1, '='), "Sales Invoice Header"."Currency Code");


        TotalGST := CGSTAmt + SGSTAmt + IGSTAmt + CessAmt;
        GstAmtinWords[1] := '';
        NoToWords.InitTextVariable();
        NoToWords.FormatNoText(GstAmtinWords, TotalGST, '');


        VatCaption1 := 'Add : VAT ';
        SalesInvLine.RESET();
        SalesInvLine.SETFILTER("Document No.", '=%1', "Sales Invoice Header"."No.");
        IF SalesInvLine.FIND('-') THEN BEGIN
            REPEAT
                IF (SalesInvLine."VAT %" <> 0) THEN BEGIN
                    VatCaption := STRSUBSTNO('%1', SalesInvLine."VAT %");
                    VatCaption1 := 'Add : VAT ' + VatCaption + ' %';
                END;
            UNTIL SalesInvLine.NEXT() = 0;
        END;

        IF "Sales Invoice Header"."Currency Code" = '' THEN
            CG_Curr := ''
        ELSE
            CG_Curr := "Sales Invoice Header"."Currency Code" + ':-  ';

        IF ROUND(Disc, 1, '=') <> 0 THEN
            DiscountCaption := 'Less : Discount';
    end;

    local procedure GetSalesGSTAmount(SalesInvoiceHeader: Record "Sales Invoice Header"; SalesInvoiceLine: Record "Sales Invoice Line")
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

}

