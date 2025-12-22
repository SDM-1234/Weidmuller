namespace WM.WeidmullerDEV;

using Microsoft.Finance.GST.ReturnSettlement;
    
pageextension 50028 GSTLiabilityAdjJournal extends "GST Liability Adj. Journal"
{
    actions
    {

        //Unsupported feature: Code Modification on ""<Action1500030>"(Action 1500017).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF NOT CONFIRM(PostCreditLiabilityQst) THEN
          EXIT;
        GSTInputTaxCredit.PostLiabilityAdjustmentJnl(Rec);
        DELETEALL;
        CurrPage.CLOSE;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        IF NOT CONFIRM(PostCreditLiability) THEN
        #2..5
        */
        //end;
    }

    //Unsupported feature: Property Deletion (CaptionML).

}

