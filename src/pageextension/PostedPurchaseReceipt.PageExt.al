namespace WM.WeidmullerDEV;

using Microsoft.Purchases.History;

pageextension 50008 PostedPurchaseReceipt extends "Posted Purchase Receipt"
{
    layout
    {
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
                        GoodsReceiptNote: Report GoodsReceiptNote;
                        L_PurchRcptHeader: Record "Purch. Rcpt. Header";
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

