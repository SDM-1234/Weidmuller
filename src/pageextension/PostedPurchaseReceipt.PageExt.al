namespace WM.WeidmullerDEV;

using Microsoft.Purchases.History;

pageextension 50008 PostedPurchaseReceipt extends "Posted Purchase Receipt"
{
    layout
    {
        addafter("Vendor Shipment No.")
        {
            field("Bill of Entry No."; Rec."Bill of Entry No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Bill of Entry number for the posted receipt.';
            }
            field("Bill of Entry Date"; Rec."Bill of Entry Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Bill of Entry date for the posted receipt.';
            }
        }
    }
    actions
    {
        addafter("Attached Gate Entry")
        {
            group(GRN)
            {
                action("Goods Receipt Note")
                {
                    Image = Report;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Goods Receipt Note action.';

                    trigger OnAction()
                    var
                        L_PurchRcptHeader: Record "Purch. Rcpt. Header";
                        GoodsReceiptNote: Report GoodsReceiptNote;
                    begin
                        L_PurchRcptHeader.RESET();
                        L_PurchRcptHeader.SETRANGE("No.", Rec."No.");
                        GoodsReceiptNote.SETTABLEVIEW(L_PurchRcptHeader);
                        GoodsReceiptNote.RUN();
                    end;
                }
            }
        }
    }
}
