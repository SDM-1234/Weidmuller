namespace WM.WeidmullerDEV;

using Microsoft.Foundation.Task;
    
pageextension 50067 UserTaskList extends "User Task List"
{

    //Unsupported feature: Property Insertion (Visible) on ""To-do List"(Page 5096)".


    //Unsupported feature: Property Modification (Visible) on ""To-do List"(Page 5096)".


    //Unsupported feature: Property Modification (Visible) on ""To-do List"(Page 5096)".


    //Unsupported feature: Property Insertion (SourceTableView) on ""To-do List"(Page 5096)".

    // layout
    // {
    //     addafter("Completed By User Name")
    //     {
    //         field(Location; Rec.Location)
    //         {
    //             ApplicationArea = all;
    //         }
    //         field("Segment No."; Rec."Segment No.")
    //         {
    //             ApplicationArea = All;
    //         }
    //         field(Subject; Rec.Subject)
    //         {
    //         }
    //     }
    // }


    // //Unsupported feature: Code Insertion on "OnOpenPage".

    // //trigger OnOpenPage()
    // //begin
    // /*
    // //ZT0214
    // SETFILTER("Salesperson Code",GetTeamCode);
    // //ZT0214
    // */
    // //end;


    // //Unsupported feature: Code Modification on "Caption(PROCEDURE 1)".

    // //procedure Caption();
    // //Parameters and return type have not been exported.
    // //>>>> ORIGINAL CODE:
    // //begin
    // /*
    // IF Cont.GET(GETFILTER("Contact Company No.")) THEN BEGIN
    //   Contact1.GET(GETFILTER("Contact Company No."));
    //   IF Contact1."No." <> Cont."No." THEN
    //     CaptionStr := COPYSTR(Cont."No." + ' ' + Cont.Name,1,MAXSTRLEN(CaptionStr));
    // END;
    // IF Cont.GET(GETFILTER("Contact No.")) THEN
    //   CaptionStr := COPYSTR(CaptionStr + ' ' + Cont."No." + ' ' + Cont.Name,1,MAXSTRLEN(CaptionStr));
    // IF SalesPurchPerson.GET(GETFILTER("Salesperson Code")) THEN
    //   CaptionStr := COPYSTR(CaptionStr + ' ' + SalesPurchPerson.Code + ' ' + SalesPurchPerson.Name,1,MAXSTRLEN(CaptionStr));
    // IF Team.GET(GETFILTER("Team Code")) THEN
    //   CaptionStr := COPYSTR(CaptionStr + ' ' + Team.Code + ' ' + Team.Name,1,MAXSTRLEN(CaptionStr));
    // IF Campaign.GET(GETFILTER("Campaign No.")) THEN
    // #13..18
    //   CaptionStr := Text001;

    // EXIT(CaptionStr);
    // */
    // //end;
    // //>>>> MODIFIED CODE:
    // //begin
    // /*
    // #1..7
    // //IF SalesPurchPerson.GET(GETFILTER("Salesperson Code")) THEN
    // //  CaptionStr := COPYSTR(CaptionStr + ' ' + SalesPurchPerson.Code + ' ' + SalesPurchPerson.Name,1,MAXSTRLEN(CaptionStr));
    // #10..21
    // */
    // //end;

    // local procedure "////////////////+ZE+//////////////////////////////////"()
    // begin
    // end;

    // procedure GetTeamCode(): Text[250]
    // var
    //     User: Record "User Setup";
    // begin
    //     User.GET(USERSECURITYID);
    //     IF User."Team Code" = '' THEN
    //         EXIT;
    //     IF Team.GET(User."Team Code") THEN BEGIN
    //         //IF Opportunity.GET(User."Team Code")
    //         EXIT(GetSalesPersonFilter(Team.Code));
    //         //MODIFY;
    //     END;
    //     EXIT('');
    // end;

    // procedure GetSalesPersonFilter(pTeamCode: Code[10]) rReturn: Text[250]
    // var
    //     TeamSalesperson: Record "5084";
    // begin
    //     TeamSalesperson.SETRANGE("Team Code", pTeamCode);
    //     IF TeamSalesperson.FINDSET THEN
    //         REPEAT
    //             IF rReturn = '' THEN
    //                 rReturn += TeamSalesperson."Salesperson Code"
    //             ELSE
    //                 rReturn += '|' + TeamSalesperson."Salesperson Code";
    //         UNTIL (TeamSalesperson.NEXT = 0);
    // end;
}

