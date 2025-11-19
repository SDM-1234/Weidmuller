namespace WM.WeidmullerDEV;

using Microsoft.Purchases.Document;
    
pageextension 50069 PurchaseInvoice extends "Purchase Invoice"
{
    layout
    {
        addafter("Expected Receipt Date")
        {
            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on "SendApprovalRequest(Action 142).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) THEN
          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CheckAttachment(Rec);//ZE.SAGAR
        IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) THEN
          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;
    }
}

