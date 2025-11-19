namespace WM.WeidmullerDEV;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Receivables;
    
pageextension 50035 ApplyCustomerEntries extends "Apply Customer Entries"
{

    //Unsupported feature: Variable Insertion (Variable: UpdateCustomer) (VariableCollection) on "PostDirectApplication(PROCEDURE 15)".


    //Unsupported feature: Code Modification on "PostDirectApplication(PROCEDURE 15)".

    //procedure PostDirectApplication();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF CalcType = CalcType::Direct THEN BEGIN
      IF ApplyingCustLedgEntry."Entry No." <> 0 THEN BEGIN
        Rec := ApplyingCustLedgEntry;
    #4..34
        END ELSE
          ERROR(Text019);

        IF PreviewMode THEN
          CustEntryApplyPostedEntries.PreviewApply(Rec,NewDocumentNo,NewApplicationDate)
        ELSE
          Applied := CustEntryApplyPostedEntries.Apply(Rec,NewDocumentNo,NewApplicationDate);

        IF (NOT PreviewMode) AND Applied THEN BEGIN
          MESSAGE(Text012);
          PostingDone := TRUE;
    #46..48
        ERROR(Text002);
    END ELSE
      ERROR(Text003);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..37
        OpencustomerBlockedForDocumentTypeBlank(Rec."Entry No.",xRec."Entry No.",0,UpdateCustomer);//ZE.SAGAR

    #38..42
        OpencustomerBlockedForDocumentTypeBlank(Rec."Entry No.",xRec."Entry No.",2,UpdateCustomer);//ZE.SAGAR

    #43..51
    */
    //end;


    local procedure OpencustomerBlockedForDocumentTypeBlank(EntryNo1: Integer; EntryNo2: Integer; BlockedType: Option; var UpdateBackBlocked: Boolean)
    var
        RecCust: Record "Customer";
        CLE1: Record "Cust. Ledger Entry";
        CLE2: Record "Cust. Ledger Entry";
    begin
        //>> ZE.SAGAR
        IF NOT RecCust.GET(Rec."Customer No.") THEN
            EXIT;
        IF NOT UpdateBackBlocked THEN BEGIN
            IF RecCust.Blocked <> RecCust.Blocked::Invoice THEN
                EXIT;
            IF NOT CLE1.GET(EntryNo1) THEN
                EXIT;
            IF NOT CLE2.GET(EntryNo2) THEN
                EXIT;
            IF (CLE1."Document Type" = CLE1."Document Type"::" ") OR (CLE2."Document Type" = CLE2."Document Type"::" ") THEN BEGIN
                RecCust.Blocked := BlockedType;
                RecCust.MODIFY(TRUE);
                UpdateBackBlocked := TRUE;
            END;
        END ELSE
            IF UpdateBackBlocked THEN BEGIN
                RecCust.Blocked := BlockedType;
                RecCust.MODIFY(TRUE);

            END;
        //<< ZE.SAGAR
    end;
}

