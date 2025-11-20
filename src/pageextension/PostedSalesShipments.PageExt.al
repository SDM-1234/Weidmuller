namespace WM.WeidmullerDEV;

using Microsoft.Sales.History;
    
pageextension 50011 PostedSalesShipments extends "Posted Sales Shipments"
{
    layout
    {
        addlast(Control1)
        {
            field("Order Date"; Rec."Order Date")
            {
                ToolTip = 'Specifies the value of the Order Date field.';
                ApplicationArea = All;
            }
            field("Order No."; Rec."Order No.")
            {
                ToolTip = 'Specifies the number of the sales order that this invoice was posted from.';
                ApplicationArea = All;
            }
            field("Payment Discount %"; Rec."Payment Discount %")
            {
                ToolTip = 'Specifies the value of the Payment Discount % field.';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("F&unctions")
        {
            action("Packing List")
            {
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Packing List action.';
                ApplicationArea = All;

                trigger OnAction()
                var
                //PackingList: Report "50004"; //Need to Uncomment after Report Compilation
                begin
                    //ZE_LIJO 25.06.2019
                    //<<
                    CurrPage.SETSELECTIONFILTER(Rec);
                    SalShpHdr.RESET();
                    SalShpHdr.COPY(Rec);
                    CLEAR(Rec);
                    REPORT.RUN(50017, TRUE, FALSE, SalShpHdr);
                    //>>
                end;
            }
        }
    }

    var
        SalShpHdr: Record "Sales Shipment Header";
}

