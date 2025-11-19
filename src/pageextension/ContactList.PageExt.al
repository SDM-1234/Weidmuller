pageextension 50063 ContactList extends "Contact List"
{


    layout
    {
        addafter(Name)
        {
            field(Type; Rec.Type)
            {
                ApplicationArea = All;
            }
            field(Address; Rec.Address)
            {

                ApplicationArea = All;
            }
            field("Address 2"; Rec."Address 2")
            {

                ApplicationArea = All;
            }
            field(City; Rec.City)
            {

                ApplicationArea = All;
            }
            field("Resigned - Left Company"; Rec."Resigned - Left Company")
            {

                ApplicationArea = All;
            }
        }
    }

    var


    // procedure GetTeamCode(): Text[250]
    // var
    //     User: Record User;
    // begin
    //     User.GET(USERSECURITYID);
    //     IF User."Team Code" = '' THEN
    //         EXIT;
    //     IF Team.GET(User."Team Code") THEN
    //         EXIT(GetSalesPersonFilter(Team.Code));
    //     //MODIFY;

    //     EXIT('');
    // end;

    // procedure GetSalesPersonFilter(pTeamCode: Code[10]) rReturn: Text[250]
    // var
    //     TeamSalesperson: Record "5084";
    // begin
    //     //TeamSalesperson.SETRANGE("Team Code", pTeamCode);
    //     IF TeamSalesperson.FINDSET THEN
    //         REPEAT
    //             IF rReturn = '' THEN
    //                 rReturn += TeamSalesperson."Salesperson Code"
    //             ELSE
    //                 rReturn += '|' + TeamSalesperson."Salesperson Code";
    //         UNTIL (TeamSalesperson.NEXT = 0);
    // end;
}

