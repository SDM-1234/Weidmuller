namespace WM.WeidmullerDEV;

using Microsoft.Finance.Currency;
using Microsoft.Foundation.Company;
using Microsoft.Foundation.PaymentTerms;
using Microsoft.Foundation.Shipping;
using Microsoft.Inventory.Location;
using Microsoft.Purchases.Archive;
using Microsoft.Purchases.Comment;
using Microsoft.Purchases.Document;
using Microsoft.Purchases.Vendor;
using System.Utilities;
    
report 50018 "Purchase Order-Bulk"
{
    // Project: Weidmuller
    // ********************************************************************************************************************************
    // Developer: ZiniosEdge
    // ********************************************************************************************************************************
    // -+------+---------+--------+---------+----+--------------------------------------
    // T|ID_RIC|MOD  REL |DATE    |SEARCH   |Developer|DESCRIPTION
    // -+------+---------+--------+---------+----+--------------------------------------
    // ?|ZE    |         |25.07.19|ZE_LIJO  |LIJO     | GST Calculation is added.
    //  |                                             |
    DefaultLayout = RDLC;
    RDLCLayout = 'src/reportlayout/PurchaseOrderBulk.rdl';

    PreviewMode = Normal;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            column(PurchOrderCaption; PurchOrderCaption)
            {
            }
            column(Desc; Desc)
            {
            }
            column(Desc2; Desc2)
            {
            }
            column(JobWork; JobWork)
            {
            }
            column(PurchHdrNo; "Purchase Header"."No.")
            {
            }
            column(Continued; ContinuedCaptionLbl)
            {
            }
            column(Payment_Terms_Code_Purchase_Header; "Payment Terms Code")
            {
            }
            column(No_Purchase_Header; PurchaseHeadNo)
            {
            }
            column(Order_Date_Purchase_Header; "Purchase Header"."Document Date")
            {
            }
            column(Description_Payment_Terms; PaymentTerms.Description)
            {
            }
            column(TINNO_CompanyInfo; '')//need to map
            {
            }
            column(CSTNO_CompanyInfo; '')//need to map
            {
            }
            column(CompInfo_GST; CompanyInfo."GST Registration No.")
            {
            }
            column(Picture_CompanyInfo; CompanyInfo.Picture)
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
            column(HomePage_CompanyInfo; CompanyInfo."Home Page")
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
            column(Phone_No_Vendor; Vendor."Phone No.")
            {
            }
            column(GST_No_Vendor; Vendor."GST Registration No.")
            {
            }
            column(Name_BuyfromVendor; "Buy-from Vendor Name")
            {
            }
            column(Name2_BuyfromVendor; "Buy-from Vendor Name 2")
            {
            }
            column(Address_BuyfromVendor; "Buy-from Address")
            {
            }
            column(Address2_BuyfromVendor; "Buy-from Address 2")
            {
            }
            column(City_BuyfromVendor; "Buy-from City")
            {
            }
            column(Contact_BuyfromVendor; "Buy-from Contact")
            {
            }
            column(PostCode_BuyfromVendor; "Buy-from Post Code")
            {
            }
            column(Country_BuyfromVendor; "Buy-from County")
            {
            }
            column(Approvedbylblcaption; Approvedbylblcaption)
            {
            }
            column(Initiatedbylblcaption; Initiatedbylblcaption)
            {
            }
            column(PURCHASEORDERlblCaption; PURCHASEORDERlblCaption)
            {
            }
            column(DatelblCaption; DatelblCaption)
            {
            }
            column(CSTNOlblCaption; CSTNOlblCaption)
            {
            }
            column(TINNOlblCaption; TINNOlblCaption)
            {
            }
            column(PurchaseordernolblCaption; PurchaseordernolblCaption)
            {
            }
            column(PaymentlblCaption; PaymentlblCaption)
            {
            }
            column(ReflblCaption; ReflblCaption)
            {
            }
            column(TermslblCaption; TermslblCaption)
            {
            }
            column(DeliverylblCaption; DeliverylblCaption)
            {
            }
            column(TolblCaption; TolblCaption)
            {
            }
            column(text001; text001)
            {
            }
            column(slnolblCaption; slnolblCaption)
            {
            }
            column(QTYlblCaption; QTYlblCaption)
            {
            }
            column(UNITlblCaption; UNITlblCaption)
            {
            }
            column(DESCRIPTIONlblCaption; DESCRIPTIONlblCaption)
            {
            }
            column(UNITRATElblCaption; UNITRATElblCaption)
            {
            }
            column(AMOUNTlblCaption; AMOUNTlblCaption)
            {
            }
            column(TotallblCaption; TotallblCaption)
            {
            }
            column(SubTotallblCaption; SubTotallblCaption)
            {
            }
            column(INRlblCaption; INRlblCaption)
            {
            }
            column(TermsDescription; TermsDescription)
            {
            }
            column(DeliveryDescription; DeliveryDescription)
            {
            }
            column(DelyAddresslblCaption; DelyAddresslblCaption)
            {
            }
            column(Name_Location; Name_Location)
            {
            }
            column(Name2_Location; Name2_Location)
            {
            }
            column(Address_Location; Address_Location)
            {
            }
            column(Address2_Location; Address2_Location)
            {
            }
            column(City_Location; City_Location)
            {
            }
            column(PostCode_Location; PostCode_Location)
            {
            }
            column(Country_Location; Country_Location)
            {
            }
            column(CurrencyCode; CurrencyCode)
            {
            }
            column(CurrencyCaption; CurrencyCaption)
            {
            }
            column(SplPackagingChargCaption; SplPackagingChargeslblCaption)
            {
            }
            column(InsuranceChargesCaption; InsuranceChargeslblCaption)
            {
            }
            column(CarriagecostCaption; CarriagecostlblCaption)
            {
            }
            column(PackingCharges; PackingCharges)
            {
            }
            column(InsuranceCharges; InsuranceCharges)
            {
            }
            column(carriagecost; carriagecost)
            {
            }
            column(Billing_Caption; BillingLblCaption)
            {
            }
            column(CurrencyCaptionlbl; CurrencyCaptionlbl)
            {
            }
            column(ForWeidmullerCaptionlbl; ForWeidmullerCaptionlbl)
            {
            }
            column(TaxesExtraCaptionlbl; TaxesExtraCaptionlbl)
            {
            }
            column(TotalvalueofPOCaptionlbl; TotalvalueofPOCaptionlbl)
            {
            }
            column(AmendmentNoCaptionlbl; AmendmentNoCaptionlbl)
            {
            }
            column(VendorCaptionlbl; VendorCaptionlbl)
            {
            }
            column(RefernceQuoteNoCaptionlbl; RefernceQuoteNoCaptionlbl)
            {
            }
            column(ProductCaptionlbl; ProductCaptionlbl)
            {
            }
            column(text002; text002)
            {
            }
            column(text003; text003)
            {
            }
            column(CINCaption; CINCaption)
            {
            }
            column(TCaption; Tcaption)
            {
            }
            column(GSTnoCaption; GSTnoCaption)
            {
            }
            column(Phonecaption; Phonecaption)
            {
            }
            column(CurrencyDesc; CurrencyDesc)
            {
            }
            column(DeliveryDate; "Purchase Header"."Posting Date")
            {
            }
            column(TermsofDelivery; Shipmentcode)
            {
            }
            column(text004; text004)
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
                                    ORDER(Ascending);
                column(Structure; Tax)
                {
                }
                column(Text5; Text5)
                {
                }
                column(Tax5; Tax5)
                {
                }
                column(Tax14; Tax14)
                {
                }
                column(HSNSACCode_PurchaseLine; "Purchase Line"."HSN/SAC Code")
                {
                }
                column(Tax_Amount; Amount)//Need to Change RSF
                {
                }
                column(Tax_Percentage; "Prepayment %")//Need to Change RSF
                {
                }
                column(SNo; SNo)
                {
                }
                column(No_PurchaseLine; "No.")
                {
                }
                column(Quantity_Purchase_Line; Quantity)
                {
                }
                column(Description_Purchase_Line; Description)
                {
                }
                column(Unit_Cost_Purchase_Line; "Unit Cost")
                {
                }
                column(Amount_Purchase_Line; Amount)
                {
                }
                column(TotalAmount; TotalAmount)
                {
                }
                column(GSTAmt; GSTAmt)
                {
                }
                column(LnTotal; LnTotal)
                {
                }
                column(TotalLines; TotalLines)
                {
                }
                column(UOM_Purchase_Line; "Unit of Measure")
                {
                }
                column(UnitofMeasureCode_PurchaseLine; "Unit of Measure Code")
                {
                }
                column(Line_NO_PurchaseLine; "Line No.")
                {
                }
                column(Comnt; Comnt)
                {
                }
                column(Description2_PurchLn; "Purchase Line"."Description 2")
                {
                }
                column(GST_PurchLn; "Purchase Line"."GST Credit")//Need to Change RSF
                {
                }
                column(HSNSACCode_PurchLn; "Purchase Line"."HSN/SAC Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    SNo := SNo + 1;
                    //ZE_LIJO 25.07.2019
                    //++
                    //TotalAmount := TotalAmount + "Purchase Line".Amount;
                    LnTotal := LnTotal + "Purchase Line".Amount;
                    GSTAmt := GSTAmt + "Purchase Line".GetGSTAmounts();
                    TotalAmount := TotalAmount + "Purchase Line".Amount + "Purchase Line".GetGSTAmounts();

                    //--
                    TotalLines := 0;
                    PurchLn.RESET();
                    PurchLn.SETFILTER(PurchLn."Document No.", "Purchase Header"."No.");
                    IF PurchLn.FINDSET() THEN
                        REPEAT
                            TotalLines += 1;
                        UNTIL PurchLn.NEXT() = 0;

                    IF tempint >= loopint THEN BEGIN
                        CurrReport.BREAK();
                        tempint := 0;
                    END;
                    tempint := tempint + 1;

                end;

                trigger OnPreDataItem()
                begin
                    SNo := 0;

                    //ZE_LIJO 25.07.2019
                    //++
                    LnTotal := 0;
                    GSTAmt := 0;
                    TotalAmount := 0;
                    //--
                end;
            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    ORDER(Ascending);
                column(space; space)
                {
                }

                trigger OnPreDataItem()
                begin
                    SETRANGE(Number, 1, loopint - tempint);
                    space := '1';
                end;
            }

            trigger OnAfterGetRecord()
            var
                PurchCommentLine: Record "Purch. Comment Line";
            begin
                PurchCommentLine.RESET();
                PurchCommentLine.SETRANGE(PurchCommentLine."Document Type", "Document Type");
                PurchCommentLine.SETRANGE(PurchCommentLine."No.", "No.");
                CommentCounter := PurchCommentLine.COUNT;
                tempint := CommentCounter;

                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT()
                ELSE BEGIN
                    PaymentTerms.GET("Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Purchase Header"."Language Code");
                END;

                IF "Shipment Method Code" = '' THEN
                    ShipmentMethod.INIT()
                ELSE BEGIN
                    ShipmentMethod.GET("Shipment Method Code");
                    ShipmentMethod.TranslateDescription(ShipmentMethod, "Purchase Header"."Language Code");
                    Shipmentcode := ShipmentMethod.Description;
                END;

                IF Vendor.GET("Purchase Header"."Buy-from Vendor No.") THEN;

                Loc.RESET();
                Loc.SETRANGE(Code, "Purchase Header"."Location Code");
                IF Loc.FINDFIRST() THEN BEGIN
                    Name_Location := Loc.Name;
                    Name2_Location := Loc."Name 2";
                    Address_Location := Loc.Address;
                    Address2_Location := Loc."Address 2";
                    City_Location := Loc.City;
                    PostCode_Location := Loc."Post Code";
                    Country_Location := Loc."Country/Region Code";
                END;

                IF "Purchase Header"."Currency Code" = '' THEN BEGIN
                    CurrencyCode := 'INR';
                    CurrencyCaption := 'INR';
                END;
                IF "Purchase Header"."Currency Code" = 'USD' THEN BEGIN
                    CurrencyCode := "Purchase Header"."Currency Code";
                    CurrencyCaption := 'USD';
                END;
                IF "Purchase Header"."Currency Code" = 'EUR' THEN BEGIN
                    CurrencyCode := "Purchase Header"."Currency Code";
                    CurrencyCaption := 'EURO';
                END;


                PurchCommentLine.RESET();
                PurchCommentLine.SETRANGE(PurchCommentLine."Document Type", "Document Type");
                PurchCommentLine.SETRANGE(PurchCommentLine."No.", "No.");
                IF PurchCommentLine.FINDSET() THEN
                    REPEAT
                        Comnt := Comnt + '<BR>' + PurchCommentLine.Comment;
                    UNTIL PurchCommentLine.NEXT() = 0;

                //SE
                PurchaseHeaderArchive.SETRANGE(PurchaseHeaderArchive."No.", "Purchase Header"."No.");
                IF PurchaseHeaderArchive.FINDLAST() THEN
                    PurchaseHeadNo := "Purchase Header"."No." + ' - R ' + FORMAT(PurchaseHeaderArchive."Version No.")
                ELSE
                    PurchaseHeadNo := "Purchase Header"."No.";

                //SE

                Currency.RESET();
                Currency.SETRANGE(Currency.Code, "Currency Code");
                IF Currency.FINDFIRST() THEN
                    CurrencyDesc := Currency.Description;
            end;

            trigger OnPreDataItem()
            begin
                loopint := 15;

                IF JobWork THEN BEGIN
                    Desc := 'Article No';
                    Desc2 := 'Description';
                    PurchOrderCaption := 'PURCHASE ORDER (JOB WORK)';
                END ELSE BEGIN
                    Desc := 'Description';
                    Desc2 := 'Description 2';
                    PurchOrderCaption := 'PURCHASE ORDER';

                END
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
                field("Job Work"; JobWork)
                {
                    ApplicationArea = all;
                    ToolTip = 'JobWork';
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

    trigger OnInitReport()
    begin
        CompanyInfo.GET();
        CompanyInfo.CALCFIELDS(Picture)
    end;

    var
        CompanyInfo: Record "Company Information";
        Currency: Record Currency;
        Loc: Record Location;
        PaymentTerms: Record "Payment Terms";
        PurchaseHeaderArchive: Record "Purchase Header Archive";
        PurchLn: Record "Purchase Line";
        ShipmentMethod: Record "Shipment Method";
        //StructureOrderDetails: Record "13794";// Commented By RSF
        Vendor: Record Vendor;
        JobWork: Boolean;
        CurrencyCode: Code[20];
        PurchaseHeadNo: Code[50];
        carriagecost: Decimal;
        GSTAmt: Decimal;
        InsuranceCharges: Decimal;
        LnTotal: Decimal;
        PackingCharges: Decimal;
        Tax14: Decimal;
        Tax5: Decimal;
        TotalAmount: Decimal;
        TotalLines: Decimal;
        CommentCounter: Integer;
        loopint: Integer;
        SNo: Integer;
        tempint: Integer;
        Address2_Location: Text;
        Address_Location: Text;
        City_Location: Text;
        Comnt: Text[1024];
        Country_Location: Text;
        CurrencyCaption: Text;
        CurrencyDesc: Text;
        DeliveryDescription: Text;
        Desc2: Text;
        Desc: Text;
        Name2_Location: Text;
        Name_Location: Text;
        PostCode_Location: Text;
        PurchOrderCaption: Text;
        Shipmentcode: Text;
        space: Text;
        TermsDescription: Text;
        Text5: Text;
        AmendmentNoCaptionlbl: Label 'Amendment No.';
        AMOUNTlblCaption: Label 'Total Value  ';
        Approvedbylblcaption: Label 'Authorized Signatory';
        BillingLblCaption: Label 'Billing Address ';
        CarriagecostlblCaption: Label 'Carriage Cost';
        CINCaption: Label 'CIN:';
        ContinuedCaptionLbl: Label 'Continued.........';
        CSTNOlblCaption: Label 'CST NO.';
        CurrencyCaptionlbl: Label 'Currency';
        DatelblCaption: Label 'PO Date';
        DeliverylblCaption: Label 'Delivery Date';
        DelyAddresslblCaption: Label 'Delivery Address';
        DESCRIPTIONlblCaption: Label 'Description';
        ForWeidmullerCaptionlbl: Label 'For Weidmuller Electronics India Pvt. Ltd.';
        GSTnoCaption: Label 'GST No.';
        Initiatedbylblcaption: Label 'Initiated by';
        INRlblCaption: Label 'INR';
        InsuranceChargeslblCaption: Label 'Insurance Charges';
        PaymentlblCaption: Label 'Payment Terms';
        Phonecaption: Label 'Phone : +';
        ProductCaptionlbl: Label 'Article No';
        PURCHASEORDERlblCaption: Label 'PURCHASE ORDER';
        PurchaseordernolblCaption: Label 'PO No.';
        QTYlblCaption: Label 'Qty';
        RefernceQuoteNoCaptionlbl: Label 'Reference Quote No.';
        ReflblCaption: Label 'Ref:';
        slnolblCaption: Label 'Sl. no.';
        SplPackagingChargeslblCaption: Label 'Spl. Packaging Charges';
        SubTotallblCaption: Label 'SUBTOTAL';
        Tax: Label 'Add VAT';
        TaxesExtraCaptionlbl: Label 'Taxes Extra as Applicable';
        Tcaption: Label 'Phone : +';
        TermslblCaption: Label 'Terms of Delivery';
        text001: Label 'The prices committed on this purchase order will remain firm, till the full execution of the order or any formal written communication.';
        text002: Label 'The acceptance of this order shall be conveyed by the supplier to the purchaser within 7 days from the date of receipt of PO by supplier, failing which, it shall be deemed to be accepted unconditionally by the supplier.';
        text003: Label 'This Purchase Order is electronically approved; no signature is required.';
        text004: Label 'HSN / SAC Code is mandatory in the invoice.';
        TINNOlblCaption: Label 'TIN NO.';
        TolblCaption: Label 'To:';
        TotallblCaption: Label 'TOTAL CURRENCY';
        TotalvalueofPOCaptionlbl: Label 'Total Value';
        UNITlblCaption: Label 'UNIT';
        UNITRATElblCaption: Label 'Unit Price';
        VendorCaptionlbl: Label 'Vendor';
}

