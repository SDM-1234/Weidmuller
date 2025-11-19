report 50017 "Packing List-Bulk"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src/reportlayout/PackingListBulk.rdl';
    UseRequestPage = false;

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            column(BinCodeCaption; BinCodeCaptionLbl)
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Bill_to_Address_; "Sales Shipment Header"."Sell-to Address")
            {
            }
            column(Sales_Shipment_Header___Bill_to_City___Sales_Shipment_Header___Bill_to_Post_Code_; "Sales Shipment Header"."Sell-to City" + ' - ' + "Sales Shipment Header"."Sell-to Post Code")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Ship_to_Address_2_; "Sales Shipment Header"."Ship-to Address 2")
            {
            }
            column(Sales_Shipment_Header___Ship_to_City___Sales_Shipment_Header___Ship_to_Code_; "Sales Shipment Header"."Ship-to City" + ' - ' + ShiptoAddress."Post Code")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Shipment_Date_; "Sales Shipment Header"."Shipment Date")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Ship_to_Contact_; "Sales Shipment Header"."Ship-to Contact")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___LR_RR_No__; "Sales Shipment Header"."LR/RR No.")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Bill_to_CustomerNo_; "Sales Shipment Header"."Sell-to Customer No.")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Ship_to_CustomerNo_; "Sales Shipment Header"."Sell-to Customer No.")
            {
            }
            column(Var_DimDesc; Var_DimDesc)
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Bill_to_Address_2_; "Sales Shipment Header"."Sell-to Address 2")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Ship_to_Address_; "Sales Shipment Header"."Ship-to Address")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Ship_to_Name_; "Sales Shipment Header"."Ship-to Name")
            {
            }
            column(OrderNo_Sales_Shipment_Header; "Sales Shipment Header"."Order No.")
            {
            }
            column(TypeOfDispatch_Sales_Shipment_Header; "Sales Shipment Header"."Mode of Transport")
            {
            }
            column(Total_boxes_Sales_Shipment_Header; "Sales Shipment Header"."Total No of Boxes")
            {
            }
            column(Terms_n_Delivery; PaymentTerms.Description)
            {
            }
            column(Var_companyinfo_Name; Var_companyinfo.Name)
            {
            }
            column(Var_companyinfo_Address; Var_companyinfo.Address)
            {
            }
            column(Var_companyinfo_Address2; Var_companyinfo."Address 2")
            {
            }
            column(Var_companyinfo_City; Var_companyinfo.City)
            {
            }
            column(Var_companyinfo_PostCode; Var_companyinfo."Post Code")
            {
            }
            column(Var_companyinfo_PhoneNo; Var_companyinfo."Phone No.")
            {
            }
            column(Customer_GSTNO; Cust."GST Registration No.")
            {
            }
            column(PhoneNoCaptionLbl; PhoneNoCaptionLbl)
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Bill_to_Name_; "Sales Shipment Header"."Bill-to Name")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___External_Document_No__; "Sales Shipment Header"."External Document No.")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___No__; "Sales Shipment Header"."No.")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Vehicle_No__; "Sales Shipment Header"."Vehicle No.")
            {
            }
            column(Sales_Shipment_Header__Sales_Shipment_Header___Shipping_Agent_Code_; "Sales Shipment Header"."Shipping Agent Code")
            {
            }
            column(Var_companyinfo_Picture; Var_companyinfo.Picture)
            {
            }
            column(Integrated_Management_System_IMS_Caption; Integrated_Management_System_IMS_CaptionLbl)
            {
            }
            column(PACKING_LISTCaption; PACKING_LISTCaptionLbl)
            {
            }
            column(Billing_AddressCaption; Billing_AddressCaptionLbl)
            {
            }
            column(Packing_List_No__Caption; Packing_List_No__CaptionLbl)
            {
            }
            column(Sales_Person_NameCaption; Sales_Person_NameCaptionLbl)
            {
            }
            column(Delivery_AddressCaption; Delivery_AddressCaptionLbl)
            {
            }
            column(Dispatch_Date_Caption; Dispatch_Date_CaptionLbl)
            {
            }
            column(Trans_ForwarderCaption; Trans_ForwarderCaptionLbl)
            {
            }
            column(LR_No__Docket_No___Caption; LR_No__Docket_No___CaptionLbl)
            {
            }
            column(Customer_Po_No_Caption; Customer_Po_No_CaptionLbl)
            {
            }
            column(Contact_Person_Caption; Contact_Person_CaptionLbl)
            {
            }
            column(Vehicle_Vessel_No__Caption; Vehicle_Vessel_No__CaptionLbl)
            {
            }
            column(Total_No_Of_BoxesCaption; Total_No_Of_BoxesCaptionLbl)
            {
            }
            column(Wooden_BoxCaption; Wooden_BoxCaptionLbl)
            {
            }
            column(Prepared_ByCaption; Prepared_ByCaptionLbl)
            {
            }
            column(Checked_ByCaption; Checked_ByCaptionLbl)
            {
            }
            column(Verified_ByCaption; Verified_ByCaptionLbl)
            {
            }
            column(Recieved_ByCaption; Recieved_ByCaptionLbl)
            {
            }
            column(OCNoCaptionLbl; OCNoCaptionLbl)
            {
            }
            column(CustomerPONoCaptionLbl; CustomerPONoCaptionLbl)
            {
            }
            column(PKGNoCaptionLbl; PKGNoCaptionLbl)
            {
            }
            column(TermsofDeliveryCaptionLbl; TermsofDeliveryCaptionLbl)
            {
            }
            column(TypeofDispatchCaptionLbl; TypeofDispatchCaptionLbl)
            {
            }
            column(TotalWeightCaptionLbl; TotalWeightCaptionLbl)
            {
            }
            column(TotalnoofBoxesCaptionLbl; TotalnoofBoxesCaptionLbl)
            {
            }
            column(DeliveryNoCaptionLbl; DeliveryNoCaptionLbl)
            {
            }
            column(CustomerNoCaptionLbl; CustomerNoCaptionLbl)
            {
            }
            column(CustomerNameCaptionLbl; CustomerNameCaptionLbl)
            {
            }
            column(AddressCaptionLbl; AddressCaptionLbl)
            {
            }
            column(PINCaptionLbl; PINCaptionLbl)
            {
            }
            column(GSTINCaptionLbl; GSTINCaptionLbl)
            {
            }
            column(External_Document_No_Sales_Shipment_Header; "Sales Shipment Header"."External Document No.")
            {
            }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Bin Code")
                                    ORDER(Ascending)
                                    WHERE(Quantity = FILTER(<> 0));
                column(Sales_Shipment_Line__Sales_Shipment_Line___Unit_of_Measure_Code_; "Sales Shipment Line"."Unit of Measure Code")
                {
                }
                column(BinCode_SalesShipmentLine; "Sales Shipment Line"."Bin Code")
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line__Description; "Sales Shipment Line".Description)
                {
                }
                column(Var_SLNo__; "Var_SLNo.")
                {
                }
                column(Pkg_no_Sales_Shipment_Line; "Sales Shipment Line"."Package No.")
                {
                }
                column(Weight_Sales_Shipment_Line; "Sales Shipment Line".Weight)
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line___No__; "Sales Shipment Line"."No.")
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line__Quantity; "Sales Shipment Line".Quantity)
                {
                }
                column(Part_No_Caption; Part_No_CaptionLbl)
                {
                }
                column(Item_DescriptionCaption; Item_DescriptionCaptionLbl)
                {
                }
                column(UnitCaption; UnitCaptionLbl)
                {
                }
                column(QuantityCaption; QuantityCaptionLbl)
                {
                }
                column(RemarksCaption; RemarksCaptionLbl)
                {
                }
                column(Sl_No_Caption; Sl_No_CaptionLbl)
                {
                }
                column(Sales_Shipment_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Shipment_Line_Line_No_; "Line No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Var_Count := "Sales Shipment Line".COUNT;
                    "Var_SLNo." += 1;
                end;
            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = SORTING(Number);
                column(Integer_Number; Number)
                {
                }

                trigger OnPreDataItem()
                begin
                    Integer.SETRANGE(Integer.Number, 1, 29 - Var_Count);//33
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Var_companyinfo.GET();
                Var_companyinfo.CALCFIELDS(Var_companyinfo.Picture);

                Var_DimDesc := '';
                Rec_Dim.RESET();
                Rec_Dim.SETRANGE(Rec_Dim.Code, "Sales Shipment Header"."Shortcut Dimension 1 Code");
                IF Rec_Dim.FINDFIRST() THEN
                    Var_DimDesc := Rec_Dim.Name;

                IF salesheader.FINDFIRST() THEN;
                Cust.RESET();
                IF Cust.GET("Sales Shipment Header"."Bill-to Customer No.") THEN;

                ShiptoAddress.RESET();
                ShiptoAddress.SETRANGE(ShiptoAddress.Code, "Ship-to Code");
                IF ShiptoAddress.FINDFIRST() THEN;

                IF "Sales Shipment Header"."Payment Terms Code" = '' THEN
                    PaymentTerms.INIT()
                ELSE BEGIN
                    PaymentTerms.GET("Sales Shipment Header"."Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Sales Shipment Header"."Language Code");
                END;
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

    var
        Var_companyinfo: Record "Company Information";
        Var_salesLine: Record "Sales Shipment Line";
        Var_Count: Integer;
        "Var_SLNo.": Integer;
        Rec_Dim: Record "Dimension Value";
        Var_DimDesc: Text[30];
        Integrated_Management_System_IMS_CaptionLbl: Label 'Integrated Management System(IMS)';
        PACKING_LISTCaptionLbl: Label 'Packing List';
        Billing_AddressCaptionLbl: Label 'Billing Address';
        Packing_List_No__CaptionLbl: Label 'Packing List No.:';
        Sales_Person_NameCaptionLbl: Label 'Sales Person Name';
        Delivery_AddressCaptionLbl: Label 'Shipping Address';
        Dispatch_Date_CaptionLbl: Label 'Date:';
        Trans_ForwarderCaptionLbl: Label 'Trans/Forwarder';
        LR_No__Docket_No___CaptionLbl: Label 'LR No./Docket No. :';
        Customer_Po_No_CaptionLbl: Label 'Customer Po No.';
        Contact_Person_CaptionLbl: Label 'Contact Person:';
        Vehicle_Vessel_No__CaptionLbl: Label 'Vehicle/Vessel No.:';
        Total_No_Of_BoxesCaptionLbl: Label 'Total No Of Boxes';
        Wooden_BoxCaptionLbl: Label 'Wooden Box';
        Prepared_ByCaptionLbl: Label 'Prepared By';
        Checked_ByCaptionLbl: Label 'Checked By';
        Verified_ByCaptionLbl: Label 'Verified By';
        Recieved_ByCaptionLbl: Label 'Recieved By';
        Part_No_CaptionLbl: Label 'Item No.';
        Item_DescriptionCaptionLbl: Label 'Item Description';
        UnitCaptionLbl: Label 'UOM';
        QuantityCaptionLbl: Label 'Quantity';
        RemarksCaptionLbl: Label 'Remarks';
        Sl_No_CaptionLbl: Label 'Sl No.';
        OCNoCaptionLbl: Label 'OC No.';
        CustomerPONoCaptionLbl: Label 'Customer PO No.';
        PKGNoCaptionLbl: Label 'PKG No.';
        TermsofDeliveryCaptionLbl: Label 'Terms of delivery:';
        TypeofDispatchCaptionLbl: Label 'Type of dispatch:';
        TotalWeightCaptionLbl: Label 'Total Weight:';
        TotalnoofBoxesCaptionLbl: Label 'Total No of Boxes:';
        DeliveryNoCaptionLbl: Label 'Delivery No.';
        PhoneNoCaptionLbl: Label 'Phone No.';
        loopint: Integer;
        tempint: Integer;
        space: Text;
        Cust: Record Customer;
        salesheader: Record "Sales Header";
        CustomerNoCaptionLbl: Label 'Customer No.';
        CustomerNameCaptionLbl: Label 'Customer Name';
        AddressCaptionLbl: Label 'Address';
        PINCaptionLbl: Label 'PIN';
        GSTINCaptionLbl: Label 'GSTIN';
        ShiptoAddress: Record "Ship-to Address";
        SalesLine: Record "Sales Line";
        PaymentTerms: Record "Payment Terms";
        BinCodeCaptionLbl: Label 'Bin Code';
}

