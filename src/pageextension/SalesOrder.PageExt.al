pageextension 50053 SalesOrder extends "Sales Order"
{
    layout
    {
        modify("Document Date")
        {
            Caption = 'PO Date';
        }
        modify("External Document No.")
        {
            Caption = 'PO No.';
        }
        modify(Status)
        {
            Editable = false;
        }
        addafter("Requested Delivery Date")
        {
            field("Shipping No. Series"; Rec."Shipping No. Series")
            {
                ToolTip = 'Specifies the series used for the shipping number.';
                ApplicationArea = All;
            }
            field("Shipping No."; Rec."Shipping No.")
            {
                ToolTip = 'Specifies the shipping number for the sales order.';
                ApplicationArea = All;
            }
        }
        addafter("Promised Delivery Date")
        {
            field("Prepmt. Cr. Memo No. Series"; Rec."Prepmt. Cr. Memo No. Series")
            {
                ToolTip = 'Specifies the series used for the prepayment credit memo number.';
                ApplicationArea = All;
            }
            field("Prepayment No. Series"; Rec."Prepayment No. Series")
            {
                ToolTip = 'Specifies the series used for the prepayment number.';
                ApplicationArea = All;
            }
        }
        addlast("Tax Info")
        {
            field(Validity; Rec.Validity)
            {
                ToolTip = 'Specifies the value of the Validity field.';
                ApplicationArea = All;
                Editable = false;
            }
            field(Correction; Rec.Correction)
            {
                ToolTip = 'Specifies whether the sales order is a correction.';
                ApplicationArea = All;
            }
        }
        modify("Customer GST Reg. No.")
        {
            Editable = true;
        }
    }
    actions
    {
        addafter("Send IC Sales Order")
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
                //RunObject = page "Sales Segments";
                //RunPageView = SORTING("Customer No.", "Industry Group Code", "Sales Invoice No.") ORDER(Ascending);
                //RunPageLink = "Customer No." = field("Sell-to Customer No."), "Sales Order No." = field("No."), "Sales Invoice No." = filter('');
                // Customer No.=FIELD(Sell-to Customer No.),Sales Order No.=FIELD(No.),Sales Invoice No.=FILTER('')
                trigger OnAction()
                var
                    SalesSegmentRec: Record "Sales Segment";
                    SalesSegmentPage: Page "Sales Segments";
                begin
                    SalesSegmentPage.SetOrderInvNo(Rec."No.", '', '', Rec."Bill-to Customer No.");
                    SalesSegmentRec.SetRange("Sales Order No.", Rec."No.");
                    SalesSegmentPage.SetTableView(SalesSegmentRec);
                    SalesSegmentPage.Run();
                    SalesSegmentPage.Update();
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        rec.UpdatePoNo();
    end;

}

