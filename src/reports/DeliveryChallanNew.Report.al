namespace WM.WeidmullerDEV;

using Microsoft.Bank.VoucherInterface;
using Microsoft.Foundation.Company;
using Microsoft.Foundation.Shipping;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Location;
using Microsoft.Inventory.Transfer;
    
report 50000 "Delivery Challan New"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/reportlayout/DeliveryChallanNew.rdl';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Delivery Challan New';

    dataset
    {
        dataitem("Transfer Shipment Header"; "Transfer Shipment Header")
        {
            RequestFilterFields = "No.";
            column(ReceiptDate_TransferShipmentHeader; "Transfer Shipment Header"."Receipt Date")
            {
            }
            column(ChallanNo; "Transfer Shipment Header"."No.")
            {
            }
            column(ChallanDate; "Transfer Shipment Header"."Posting Date")
            {
            }
            column(ShipmentDate_TransferShipmentHeader; "Transfer Shipment Header"."Shipment Date")
            {
            }
            column(TransfertoCode_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-to Code")
            {
            }
            column(TransferfrmCode_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from Code")
            {
            }
            column(TransfertoName_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-to Name")
            {
            }
            column(TransferfrmName_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from Name")
            {
            }
            column(TransfertoName2_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-to Name 2")
            {
            }
            column(TransferfrmName2_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from Name 2")
            {
            }
            column(TransfertoAddress_TransferShipmentHeader; RecLocTransferTo_Cust.Address)
            {
            }
            column(TransferfrmAddress_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from Address")
            {
            }
            column(TransfertoAddress2_TransferShipmentHeader; RecLocTransferTo_Cust."Address 2")
            {
            }
            column(TransferfrmAddress2_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from Address 2")
            {
            }
            column(EwayNo; "Transfer Shipment Header"."External Document No.")
            {
            }
            column(Cust_GSTN; RecLocTransferTo_Cust."Location ARN No.")
            {
            }
            column(Cust_PlaceofSupply; "Transfer Shipment Header"."Transfer-from City")
            {
            }
            column(Cust_Phone; RecLocTransferTo_Cust."Phone No.")
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(CompInfo_Address; CompInfo.Address)
            {
            }
            column(CompInfo_Address2; CompInfo."Address 2")
            {
            }
            column(CompInfo_PostCode; CompInfo."Post Code")
            {
            }
            column(CompInfo_City; CompInfo.City)
            {
            }
            column(TransportID; ShippingAgent.Code)
            {
            }
            column(Transport; ShippingAgent.Name)
            {
            }
            column(Company_GSTN; CompInfo."GST Registration No.")
            {
            }
            column(Comp_PhoneNo; CompInfo."Phone No.")
            {
            }
            column(CompInfo_Email; CompInfo."E-Mail")
            {
            }
            column(CompInfo_Web; CompInfo."Home Page 2")
            {
            }
            column(TransfertoPostCode_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-to Post Code")
            {
            }
            column(TransferfrmPostCode_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-from Post Code")
            {
            }
            column(TransfertoCity_TransferShipmentHeader; "Transfer Shipment Header"."Transfer-to City")
            {
            }
            column(TransfertoCounty_TransferShipmentHeader; "Transfer Shipment Header"."Trsf.-to Country/Region Code")
            {
            }
            column(TransferfrmCounty_TransferShipmentHeader; "Transfer Shipment Header"."Trsf.-from Country/Region Code")
            {
            }
            column(LRRRNo_TransferShipmentHeader; "Transfer Shipment Header"."LR/RR No.")
            {
            }
            column(LRRRDate_TransferShipmentHeader; "Transfer Shipment Header"."LR/RR Date")
            {
            }
            column(VehicleNo_TransferShipmentHeader; "Transfer Shipment Header"."Vehicle No.")
            {
            }
            dataitem("Transfer Shipment Line"; "Transfer Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                column(DocumentNo_TransferShipmentLine; "Transfer Shipment Line"."Document No.")
                {
                }
                column(LineNo_TransferShipmentLine; "Transfer Shipment Line"."Line No.")
                {
                }
                column(HSNSACCode_TransferShipmentLine; "Transfer Shipment Line"."HSN/SAC Code")
                {
                }
                column(UnitPrice_TransferShipmentLine; Item."Unit Price")
                {
                }
                column(Amount_TransferShipmentLine; "Transfer Shipment Line".Amount)
                {
                }
                column(ItemNo_TransferShipmentLine; "Transfer Shipment Line"."Item No.")
                {
                }
                column(Quantity_TransferShipmentLine; "Transfer Shipment Line".Quantity)
                {
                }
                column(UnitofMeasure_TransferShipmentLine; "Transfer Shipment Line"."Unit of Measure")
                {
                }
                column(Description_TransferShipmentLine; "Transfer Shipment Line".Description)
                {
                }
                column(SrNo; SrNo)
                {
                }
                column(TaxableValue; "Transfer Shipment Line".Quantity * Item."Unit Price")
                {
                }
                column(GSTAmount; GSTAmount)
                {
                }
                column(TotalAmount; TotalAmount)
                {
                }
                column(GrandTotal; GrandTotal)
                {
                }
                column(TotalAmtInWords_1; TotalAmtInWords[1])
                {
                }
                column(TotalAmtInWords_2; TotalAmtInWords[2])
                {
                }
                column(UOM; "Transfer Shipment Line"."Unit of Measure")
                {
                }
                column(TotalGSTAmount; TotalGSTAmount)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    SrNo += 1;
                    Item.RESET();
                    Item.GET("Transfer Shipment Line"."Item No.");

                    TotalGSTAmount := ("Transfer Shipment Line".Quantity * Item."Unit Price") * 18 / 100;
                    GSTAmount := TotalGSTAmount / 2;
                    TotalAmount := ("Transfer Shipment Line".Quantity * Item."Unit Price") + TotalGSTAmount;

                    IF "Transfer Shipment Header"."Shipping Agent Code" <> '' THEN
                        ShippingAgent.GET("Transfer Shipment Header"."Shipping Agent Code");

                    IF PrintedAmtInWords = FALSE THEN BEGIN
                        TransferShipmentLine.SETRANGE("Document No.", "Transfer Shipment Header"."No.");
                        IF TransferShipmentLine.FINDSET() THEN
                            REPEAT
                                RecItem.RESET();
                                RecItem.GET(TransferShipmentLine."Item No.");
                                GrandTotal += (((TransferShipmentLine.Quantity * RecItem."Unit Price") * 18 / 100) + TransferShipmentLine.Quantity * RecItem."Unit Price");
                                PrintedAmtInWords := TRUE;
                            UNTIL TransferShipmentLine.NEXT() = 0;
                        GrandTotal := ROUND(GrandTotal, 0.01, '=');
                        NumToWords.InitTextVariable();
                        NumToWords.FormatNoText(TotalAmtInWords, GrandTotal, '');
                        //NumToWords.FormatNoText(NoText,GrandTotal,'');
                        //TotalAmtInWords := NoText[1];
                    END;
                end;

                trigger OnPreDataItem()
                begin
                    SrNo := 0;
                    CLEAR(GSTAmount);
                    CLEAR(TotalAmount);
                    CLEAR(TotalGSTAmount);
                    CLEAR(TotalAmtInWords);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                IF RecLocTransferTo_Cust.GET("Transfer Shipment Header"."Transfer-to Code") THEN;
            end;

            trigger OnPreDataItem()
            begin
                CompInfo.CALCFIELDS(Picture);
                RecLocTransferTo_Cust.RESET();
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

    trigger OnPreReport()
    begin
        CompInfo.GET();
    end;

    var
        Item: Record Item;
        RecItem: Record Item;
        TransferShipmentLine: Record "Transfer Shipment Line";
        ShippingAgent: Record "Shipping Agent";
        CompInfo: Record "Company Information";
        RecLocTransferTo_Cust: Record Location;
        NumToWords: Report "Check Report";
        TotalAmtInWords: array[2] of Text[200];
        GSTAmount: Decimal;
        TotalAmount: Decimal;
        TotalGSTAmount: Decimal;
        GrandTotal: Decimal;
        PrintedAmtInWords: Boolean;
        SrNo: Integer;
}

