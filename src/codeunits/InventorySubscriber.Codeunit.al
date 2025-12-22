namespace WM.WeidmullerDEV;

using Microsoft.Finance.Dimension;
using Microsoft.Inventory.Availability;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Item.Attribute;
using Microsoft.Sales.Document;
using System.Automation;
    
codeunit 50006 "Inventory Subscriber"
{
    trigger OnRun()
    begin

    end;

    var
        G_SalesLine: Record "Sales Line";
        Item: Record Item;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item-Check Avail.", OnSalesLineCheckOnAfterSalesLineShowWarning, '', false, false)]
    local procedure "Item-Check Avail._OnSalesLineCheckOnAfterSalesLineShowWarning"(var SalesLine: Record "Sales Line"; var Rollback: Boolean)
    var
        ItemCheckAvail: Codeunit "Item-Check Avail.";
    begin
        IF ItemCheckAvail.SalesLineShowWarning(SalesLine) AND (NOT Rollback) THEN
            SetCurrSalesLine(SalesLine);
    end;

    LOCAL PROCEDURE SetCurrSalesLine(SalesLine: Record "Sales Line");
    VAR
        SalesHeader: Record "Sales Header";
    BEGIN
        SalesLine.TESTFIELD("Document No.");
        SalesHeader.GET(SalesLine."Document Type", SalesLine."Document No.");
        IF (SalesLine."Document Type" = SalesLine."Document Type"::Order) AND (SalesHeader."Posting Date" <> 0D) THEN
            IF SalesLine.Type = SalesLine.Type::Item THEN BEGIN
                GetItem(SalesLine);
                SalesLine.VALIDATE("Confirm Shipping Date", CALCDATE(Item."Lead Time Calculation", SalesHeader."Posting Date"));
            END;
        G_SalesLine := SalesLine;
    END;

    PROCEDURE GetCurrSalesLine(VAR L_SalesLine: Record "Sales Line");
    BEGIN
        L_SalesLine."Confirm Shipping Date" := G_SalesLine."Confirm Shipping Date";
    END;

    LOCAL PROCEDURE GetItem(SalesLine1: Record "Sales Line");
    BEGIN
        SalesLine1.TESTFIELD("No.");
        IF SalesLine1."No." <> Item."No." THEN
            Item.GET(SalesLine1."No.");
    END;


    local procedure CheckMandatoryItemAttribute(tableID: Integer; ItemNo: Code[20])
    var
        ItemAttribute: Record "Item Attribute";
        ItemAttributeValueMapping: Record "Item Attribute Value Mapping";
    begin
        ItemAttribute.SetRange("Mandatory", true);
        if ItemAttribute.FindSet() then
            repeat
                ItemAttributeValueMapping.SetRange("Table ID", tableID);
                ItemAttributeValueMapping.SetRange("No.", ItemNo);
                ItemAttributeValueMapping.SetRange("Item Attribute ID", ItemAttribute.Id);
                if ItemAttributeValueMapping.IsEmpty then
                    Error('Attribute value is blank in Item No. %1,Please select attribute value for %2', ItemNo, ItemAttribute.Name)
            until ItemAttribute.Next() = 0;
    end;


    local procedure CheckMandatoryItemDimension(tableID: Integer; ItemNo: Code[20])
    var
        Dimension: Record Dimension;
        DefaultDim: Record "Default Dimension";
    begin
        Dimension.SetRange("Mandatory for Item", true);
        if Dimension.FindSet() then
            repeat
                DefaultDim.SetRange("Table ID", tableID);
                DefaultDim.SetRange("No.", ItemNo);
                DefaultDim.SetRange("Dimension Code", Dimension.Code);
                if DefaultDim.IsEmpty then
                    Error('Dimension value is blank in Item No. %1,Please select dimension %2', ItemNo, Dimension.Code)
            until Dimension.Next() = 0;
    end;

    local procedure CheckItemDefDim(tableID: Integer; ItemNo: Code[20]): Boolean
    var
        DefaultDim: Record "Default Dimension";
    begin
        DefaultDim.SetRange("Table ID", tableID);
        DefaultDim.SetRange("No.", ItemNo);
        If DefaultDim.IsEmpty then
            Error('Dimension value is blank in Item No. %1,Please select mandatory dimensions', ItemNo)
        else
            exit(true);
    end;




    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", OnSendItemForApproval, '', False, False)]
    local procedure WM_OnSendItemForApproval(var Item: Record Item)
    begin
        if CheckItemDefDim(27, Item."No.") then
            CheckMandatoryItemDimension(27, Item."No.");
        CheckMandatoryItemAttribute(27, Item."No.")
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Card", OnQueryClosePageEvent, '', false, false)]
    local procedure WM_OnQueryClosePageEventItemCard(var Rec: Record Item)
    begin
        if CheckItemDefDim(27, Rec."No.") then
            CheckMandatoryItemDimension(27, Rec."No.");
        CheckMandatoryItemAttribute(27, Rec."No.")

    end;

    [EventSubscriber(ObjectType::Page, Page::"Item List", OnQueryClosePageEvent, '', false, false)]
    local procedure WM_OnQueryClosePageEventItemList(var Rec: Record Item)
    begin
        if CheckItemDefDim(27, Rec."No.") then
            CheckMandatoryItemDimension(27, Rec."No.");
        CheckMandatoryItemAttribute(27, Rec."No.")

    end;

}