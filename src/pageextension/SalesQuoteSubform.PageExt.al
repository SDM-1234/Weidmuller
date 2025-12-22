namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
    
pageextension 50112 SalesQuoteSubform extends "Sales Quote Subform"
{
    layout
    {
        modify("No.")
        {
            Caption = 'Article No';
            ToolTip = 'Specifies the article number of the item.';
            ApplicationArea = All;
        }
        modify("Unit Price")
        {
            Caption = 'Unit Price';
            ToolTip = 'Specifies the unit price of the item.';
            ApplicationArea = All;
            Editable = IsEdiableUnitPrice;
        }
        addafter("No.")
        {
            field(MOQ; Rec.MOQ)
            {
                Editable = false;
                Caption = 'MOQ';
                ToolTip = 'Specifies the Minimum Order Quantity for the item.';
                ApplicationArea = All;
            }
        }
        addafter("VAT Prod. Posting Group")
        {
            field("Bin Code"; Rec."Bin Code")
            {
                Caption = 'Bin Code';
                ToolTip = 'Specifies the Bin Code for the item.';
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field(Status; Rec.Status)
            {
                Caption = 'Status';
                ToolTip = 'Specifies the status of the sales quote line.';
                ApplicationArea = All;
            }
            field("Payment Terms Code"; Rec."Payment Terms Code")
            {
                Caption = 'Payment Terms Code';
                ToolTip = 'Specifies the payment terms code for the sales quote line.';
                ApplicationArea = All;
            }
            field("Line No."; Rec."Line No.")
            {
                Caption = 'Line No.';
                ToolTip = 'Specifies the line number of the sales quote line.';
                ApplicationArea = All;
            }
        }
        addafter("Line Discount Amount")
        {
            field("Latest UnitPrice"; Rec."Latest UnitPrice")
            {
                Caption = 'Latest Unit Price';
                ToolTip = 'Specifies the latest unit price of the item.';
                ApplicationArea = All;
            }
            field("Latest Invoice Date"; Rec."Latest Invoice Date")
            {
                Caption = 'Latest Invoice Date';
                ToolTip = 'Specifies the date of the latest invoice for the item.';
                ApplicationArea = All;
            }
        }
        addlast(Control1)
        {
            field("Confirm Shipping Date"; Rec."Confirm Shipping Date")
            {
                Caption = 'Confirm Shipping Date';
                ToolTip = 'Specifies the date when the shipping is confirmed.';
                ApplicationArea = All;
            }
        }
    }

    var
        SH: Record "Sales Header";
        SalesPriceManagement: Codeunit "Sales Price Management";
        IsEdiableUnitPrice: Boolean;


    trigger OnAfterGetRecord()
    begin
        IF NOT SH.GET(Rec."Document Type", Rec."Document No.") THEN
            IsEdiableUnitPrice := FALSE
        ELSE
            IsEdiableUnitPrice := SalesPriceManagement.SpecialPrice(SH."Transaction Type");
    end;

}

