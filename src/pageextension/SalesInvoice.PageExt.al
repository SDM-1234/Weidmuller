namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
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
                    IndustrySegment: Record "Industry Segment";
                    ExistingSalesSegment: Record "Sales Segment";
                begin
                    IndustrySegment.RESET();
                    IndustrySegment.SETRANGE("Customer No.", Rec."Sell-to Customer No.");
                    IF IndustrySegment.IsEmpty THEN
                        ERROR('Industry Segments are not defined for customer ' + Rec."Sell-to Customer No.");

                    Rec.TESTFIELD(Status, Rec.Status::Released);
                    SalesSegment.RESET();
                    SalesSegment.SETRANGE("Sales Order No.", Rec."No.");
                    IF SalesSegment.FINDSET() THEN BEGIN
                        IF CONFIRM('Industrial Segments are already assigned, do you want to reassign?') THEN BEGIN
                            SalesSegment.DELETEALL();
                            Rec.InsertSalesSegments();
                            MESSAGE('Industry segments are calculated');
                        END ELSE BEGIN
                            ExistingSalesSegment.RESET();
                            ExistingSalesSegment.SETRANGE("Sales Order No.", Rec."No.");
                            ExistingSalesSegment.SETRANGE("Customer No.", Rec."Sell-to Customer No.");
                            IF ExistingSalesSegment.FINDSET() THEN
                                REPEAT
                                    ExistingSalesSegment.Amount := (Rec.Amount + Rec.GetGSTAmounts()) * (ExistingSalesSegment."Sales %" / 100);
                                    ExistingSalesSegment.MODIFY();
                                UNTIL ExistingSalesSegment.NEXT() = 0;
                        END;
                    END ELSE BEGIN
                        Rec.InsertSalesSegments();
                        MESSAGE('Industry segments are calculated');
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

