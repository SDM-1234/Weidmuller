namespace WM.WeidmullerDEV;

using Microsoft.Sales.History;
    
pageextension 50047 SalesInvoiceStatistics extends "Sales Invoice Statistics"
{

    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CLEARALL;

    IF "Currency Code" = '' THEN
    #4..54
          ELSE
            VATPercentage := -1;
        TCSAmount += SalesInvLine."Total TDS/TCS Incl. SHE CESS";

        DetailedGSTLedgerEntry.SETRANGE("Document No.",SalesInvLine."Document No.");
        IF DetailedGSTLedgerEntry.FINDFIRST THEN
          IF GSTManagement.IsExportPostedDocument(Rec) THEN
            NetTotal := CustAmount + TCSAmount
          ELSE
            NetTotal := CustAmount + GSTAmount + TCSAmount
        ELSE
          NetTotal := NetTotal + SalesInvLine."Amount To Customer";

        TotalAdjCostLCY := TotalAdjCostLCY + CostCalcMgt.CalcSalesInvLineCostLCY(SalesInvLine);
      UNTIL SalesInvLine.NEXT = 0;
    VATAmount := AmountInclVAT - CustAmount;
    #71..174
    // NetTotal := NetTotal + VATAmount;

    VATAmount := 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..57
    #59..66
    #68..177
    */
    //end;
}

