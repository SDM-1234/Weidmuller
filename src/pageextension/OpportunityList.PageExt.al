pageextension 50071 OpportunityList extends "Opportunity List"
{

    //Unsupported feature: Property Modification (Visible) on ""Opportunity List"(Page 5123)".


    //Unsupported feature: Property Modification (Visible) on ""Opportunity List"(Page 5123)".

    layout
    {
        addafter("Campaign No.")
        {
            field("Calendar Week"; Rec."Calendar Week")
            {
                ApplicationArea = All;
            }
            field(Comment; Comment)
            {
                ApplicationArea = All;
            }
        }
    }

    var
        Team: Record Team;
        Comment: Text[250];


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CurrPage.EDITABLE := TRUE;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CurrPage.EDITABLE := TRUE;
    //ZT0214
    SETFILTER("Salesperson Code",GetTeamCode);
    //ZT0214
    */
    //end;


    //Unsupported feature: Code Modification on "Caption(PROCEDURE 1)".

    //procedure Caption();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CASE TRUE OF
      BuildCaptionContact(CaptionStr,GETFILTER("Contact Company No.")),
      BuildCaptionContact(CaptionStr,GETFILTER("Contact No.")),
      BuildCaptionSalespersonPurchaser(CaptionStr,GETFILTER("Salesperson Code")),
      BuildCaptionCampaign(CaptionStr,GETFILTER("Campaign No.")),
      BuildCaptionSegmentHeader(CaptionStr,GETFILTER("Segment No.")):
        EXIT(CaptionStr)
    END;

    EXIT(Text001);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CASE TRUE OF
      //BuildCaptionContact(CaptionStr,GETFILTER("Contact Company No.")),
      BuildCaptionContact(CaptionStr,GETFILTER("Contact No.")),
      //BuildCaptionSalespersonPurchaser(CaptionStr,GETFILTER("Salesperson Code")),
    #5..10
    */
    //end;

    local procedure "////////////////+ZE+//////////////////////////////////"()
    begin
    end;

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

