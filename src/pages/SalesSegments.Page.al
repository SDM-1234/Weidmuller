page 50014 "Sales Segments"
{
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Sales Segment";
    ApplicationArea = All;
    Caption = 'Sales Segments';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Industry Group Code"; Rec."Industry Group Code")
                {
                    Editable = FieldEditable;
                    Caption = 'Industry Group Code';
                    ToolTip = 'Specifies the industry group code for the sales segment.';

                    trigger OnValidate()
                    begin

                    end;
                }
                field("Sales %"; Rec."Sales %")
                {
                    Editable = FieldEditable;
                    Caption = 'Sales %';
                    ToolTip = 'Specifies the sales percentage for the sales segment.';
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                    Caption = 'Amount';
                    ToolTip = 'Specifies the amount for the sales segment.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Recalculate)
            {
                Image = Recalculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Caption = 'Recalculate';
                ToolTip = 'Recalculate the sales segment amounts based on the sales order or invoice lines.';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    SalesSegment: Record "Sales Segment";
                begin
                    SalesHeader.RESET();
                    IF Rec."Sales Invoice No." <> '' THEN BEGIN
                        SalesHeader.SETRANGE("Document Type", SalesHeader."Document Type"::Invoice);
                        SalesHeader.SETRANGE("No.", Rec."Sales Invoice No.");
                    END ELSE BEGIN
                        SalesHeader.SETRANGE("Document Type", SalesHeader."Document Type"::Order);
                        SalesHeader.SETRANGE("No.", Rec."Sales Order No.");
                    END;
                    IF SalesHeader.FINDFIRST() THEN BEGIN
                        SalesSegment.RESET();
                        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Order THEN
                            SalesSegment.SETRANGE("Sales Order No.", SalesHeader."No.")
                        ELSE
                            IF SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice THEN
                                SalesSegment.SETRANGE("Sales Invoice No.", SalesHeader."No.");
                        IF SalesSegment.FINDSET() THEN
                            REPEAT
                                SalesSegment.Amount := FindLineAmount(SalesHeader."Document Type".AsInteger(), SalesHeader."No.") * (SalesSegment."Sales %" / 100);
                                SalesSegment.MODIFY();
                            UNTIL SalesSegment.NEXT() = 0;
                    END;
                end;
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Sales Order No." := SalesOrderNo;
        Rec."Sales Invoice No." := SalesInvNo;
        Rec."Posted Sales Invoice No." := PostedSalesInvNo;
        Rec."Customer No." := CustNo;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        IF (Rec."Posted Sales Invoice No." = '') THEN
            FieldEditable := TRUE
        ELSE
            FieldEditable := FALSE;
        Rec.UpdateUnassignedPercentage(Rec."Customer No.", 0);
    end;

    trigger OnAfterGetRecord()
    begin

        Rec.UpdateUnassignedPercentage(Rec."Customer No.", 0);
    end;

    trigger OnClosePage()
    var
        SalesSegment: Record "Sales Segment";
    begin
        SalesSegment.RESET();
        SalesSegment.SETRANGE("Customer No.", Rec."Customer No.");
        SalesSegment.SETRANGE("Sales Order No.", Rec."Sales Order No.");
        SalesSegment.SETRANGE("Sales %", 0);
        if SalesSegment.DELETE() then;
    end;

    trigger OnOpenPage()
    begin

        Rec."Sales Order No." := SalesOrderNo;
        Rec."Sales Invoice No." := SalesInvNo;
        Rec."Posted Sales Invoice No." := PostedSalesInvNo;
        Rec."Customer No." := CustNo;
        FieldEditable := TRUE;
    end;

    var
        SalesOrderNo: Code[20];
        FieldEditable: Boolean;
        SalesInvNo, PostedSalesInvNo, CustNo : Code[20];

    local procedure FindLineAmount(DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; No: Code[20]) TotalLineAmt: Decimal
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.RESET();
        SalesLine.SETRANGE("Document Type", DocType);
        SalesLine.SETRANGE("Document No.", No);
        IF SalesLine.FINDSET() THEN
            REPEAT
                TotalLineAmt += SalesLine."Line Amount";
            UNTIL SalesLine.NEXT() = 0;
    end;

    procedure SetOrderInvNo(pSalesOrderNo: Code[20]; pSalesInvNo: Code[20]; pPostedSalesInvNo: Code[20]; pCustNo: Code[20])
    begin
        IF pSalesOrderNo <> '' THEN
            SalesOrderNo := pSalesOrderNo;
        IF pSalesInvNo <> '' THEN
            SalesInvNo := pSalesInvNo;
        if pPostedSalesInvNo <> '' then
            PostedSalesInvNo := pPostedSalesInvNo;
        if pCustNo <> '' Then
            CustNo := pCustNo;
    end;
}

