namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
using Microsoft.Sales.History;

pageextension 50054 SalesInvoice extends "Sales Invoice"
{
    layout
    {
        modify("External Document No.")
        {
            Caption = 'PO No.';
            Importance = Promoted;
        }
        addlast(General)
        {
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ToolTip = 'Specifies the series used for the posting number.';
                ApplicationArea = All;
            }
            field("Shipping No. Series"; Rec."Shipping No. Series")
            {
                ToolTip = 'Specifies the series used for the shipping number.';
                ApplicationArea = All;
            }
        }

        addafter("Shipment Date")
        {
            field("Total No of Boxes"; Rec."Total No of Boxes")
            {
                ShowMandatory = true;
                ToolTip = 'Specifies the total number of boxes for the shipment.';
                ApplicationArea = All;
            }
            field("Total Weight"; Rec."Total Weight")
            {
                ShowMandatory = true;
                ToolTip = 'Specifies the total weight of the shipment.';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("Move Negative Lines")
        {
            action(Calculate)
            {
                Caption = 'Assign Industrial Segments';
                Image = Insert;
                ToolTip = 'Assigns industrial segments to the sales order based on the customer and sales order details.';
                ApplicationArea = All;

                trigger OnAction()
                var
                    SalesSegment: Record "Sales Segment";
                    SalesLine: Record "Sales Line";
                    SalesShipmentLine: Record "Sales Shipment Line";
                    NewSalesSegment: Record "Sales Segment";
                begin
                    Rec.TESTFIELD(Status, Rec.Status::Released);
                    SalesSegment.RESET();
                    SalesSegment.SETRANGE("Customer No.", Rec."Sell-to Customer No.");
                    SalesSegment.SETRANGE("Sales Invoice No.", Rec."No.");
                    IF SalesSegment.FINDSET() THEN
                        IF CONFIRM('Industry segments already exist; do you want to recalculate?') THEN BEGIN
                            SalesSegment.DELETEALL();
                            Rec.InsertSalesSegments();
                        END ELSE
                            REPEAT
                                SalesSegment.Amount := (Rec.Amount + Rec.GetGSTAmounts()) * (SalesSegment."Sales %" / 100);
                                SalesSegment.MODIFY()
                            UNTIL SalesSegment.NEXT() = 0;

                    IF NOT SalesSegment.FINDSET() THEN BEGIN
                        SalesLine.RESET();
                        SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Invoice);
                        SalesLine.SETRANGE("Document No.", Rec."No.");
                        SalesLine.SETFILTER("Shipment No.", '<>%1', '');
                        IF SalesLine.FINDFIRST() THEN BEGIN
                            SalesShipmentLine.RESET();
                            IF SalesShipmentLine.GET(SalesLine."Shipment No.", SalesLine."Shipment Line No.") THEN BEGIN
                                SalesSegment.RESET();
                                SalesSegment.SETRANGE("Sales Order No.", SalesShipmentLine."Order No.");
                                SalesSegment.SETFILTER("Sales Invoice No.", '%1', '');
                                IF SalesSegment.FINDSET() THEN
                                    REPEAT
                                        NewSalesSegment.INIT();
                                        NewSalesSegment.TRANSFERFIELDS(SalesSegment);
                                        NewSalesSegment."Sales Invoice No." := SalesLine."Document No.";
                                        NewSalesSegment.Amount := (Rec.Amount + Rec.GetGSTAmounts()) * (SalesSegment."Sales %" / 100);
                                        NewSalesSegment.INSERT();
                                    UNTIL SalesSegment.NEXT() = 0;
                            END;
                        END ELSE
                            Rec.InsertSalesSegments();
                    END;
                end;
            }
            action("Industry Segments")
            {
                Image = Segment;
                Caption = 'Industry Segments';
                ToolTip = 'View the industry segments associated with the sales order.';
                ApplicationArea = All;
                trigger OnAction()
                var
                    SalesSegmentRec: Record "Sales Segment";
                    SalesSegmentPage: Page "Sales Segments";
                begin
                    SalesSegmentPage.SetOrderInvNo('', Rec."No.", '', Rec."Bill-to Customer No.");
                    SalesSegmentRec.SetRange("Sales Invoice No.", Rec."No.");
                    SalesSegmentPage.SetTableView(SalesSegmentRec);
                    SalesSegmentPage.RunModal();
                end;
            }
        }
    }
}

