namespace WM.WeidmullerDEV;

using Microsoft.CRM.Interaction;
using Microsoft.CRM.Team;
using System.Security.User;
    
pageextension 50064 InteractionLogEntries extends "Interaction Log Entries"
{


    var
        Team: Record Team;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetCaption;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetCaption;
    //ZT0214
    SETFILTER("Salesperson Code",GetTeamCode);
    //ZT0214
    */
    //end;


    procedure GetTeamCode(): Text[250]
    var
        User: Record "User Setup";
    begin
        User.GET(USERSECURITYID());
        IF User."Team Code" = '' THEN
            EXIT;
        IF Team.GET(User."Team Code") THEN
            //IF Opportunity.GET(User."Team Code")
            EXIT(GetSalesPersonFilter(Team.Code));
        //MODIFY;

        EXIT('');
    end;

    procedure GetSalesPersonFilter(pTeamCode: Code[10]) rReturn: Text[250]
    var
        TeamSalesperson: Record "Team Salesperson";
    begin
        TeamSalesperson.SETRANGE("Team Code", pTeamCode);
        IF TeamSalesperson.FINDSET() THEN
            REPEAT
                IF rReturn = '' THEN
                    rReturn += TeamSalesperson."Salesperson Code"
                ELSE
                    rReturn += '|' + TeamSalesperson."Salesperson Code";
            UNTIL (TeamSalesperson.NEXT() = 0);
    end;
}

