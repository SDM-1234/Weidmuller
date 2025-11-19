namespace WM.WeidmullerDEV;

using Microsoft.Sales.Pricing;
using System.Security.User;
    
pageextension 50094 CustomerPriceGroups extends "Customer Price Groups"
{

    //Unsupported feature: Code Insertion on "OnDeleteRecord".


    //trigger OnDeleteRecord(): Boolean
    //begin
    /*
    UserCheck(); //ZT0207 09.09.2020
    */
    //end;


    //Unsupported feature: Code Insertion on "OnInsertRecord".

    //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    //begin
    /*
    UserCheck(); //ZT0207 09.09.2020
    */
    //end;


    //Unsupported feature: Code Insertion on "OnModifyRecord".

    //trigger OnModifyRecord(): Boolean
    //begin
    /*
    UserCheck(); //ZT0207 09.09.2020
    */
    //end;

    local procedure UserCheck()
    var
        UserSetup: Record "User Setup";
    begin
        //IF (COMPANYNAME='PreGOLIVE') THEN BEGIN
        IF GUIALLOWED THEN BEGIN
            UserSetup.RESET();
            UserSetup.SETFILTER("User ID", USERID);
            IF UserSetup.FINDFIRST() THEN BEGIN
                IF NOT UserSetup."Update Pricing" = TRUE THEN
                    ERROR('Pricing update is not enabled for user ID:%1', USERID);
            END ELSE
                ERROR('Pricing update is not enabled for user ID:%1', USERID);
        END;
        //END;
    end;
}

