pageextension 50068 CreateTask extends "Create Task"
{

    //Unsupported feature: Property Modification (PageType) on ""Create To-do"(Page 5097)".

    layout
    {

        //Unsupported feature: Code Modification on "Control 35.OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF GETFILTER("Opportunity No.") = '' THEN BEGIN
          IF Opp.GET("Opportunity No.") THEN ;
          IF PAGE.RUNMODAL(0,Opp) = ACTION::LookupOK THEN BEGIN
            VALIDATE("Opportunity No.",Opp."No.");
            "Wizard Opportunity Description" := Opp.Description;
          END;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF GETFILTER("Opportunity No.") = '' THEN BEGIN
          //IF Type = Type::"Phone Call" THEN //added for control ZT0214
          //IF Opp.GET("Opportunity No.") THEN ; //Commented by ZT0214
          //ZT0214++
          GetOppFilter(Opp);
          //ZT0214--
        #3..7
        */
        //end;


        //Unsupported feature: Code Modification on "SegmentDesc(Control 37).OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF GETFILTER("Segment No.") = '' THEN BEGIN
          IF Segment.GET("Segment No.") THEN ;
          IF PAGE.RUNMODAL(0,Segment) = ACTION::LookupOK THEN BEGIN
            VALIDATE("Segment No.",Segment."No.");
            "Segment Description" := Segment.Description;
          END;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF GETFILTER("Segment No.") = '' THEN BEGIN
          //IF Type = Type::"Phone Call" THEN //added for control ZT0214
          //IF Segment.GET("Segment No.") THEN ; //Commented by ZT0214
          //ZT0214++
          GetSegmentFilter(Segment);
          //ZT0214--
        #3..7
        */
        //end;


        //Unsupported feature: Code Modification on "Control 18.OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF Type <> xRec.Type THEN
          IF Type = Type::Meeting THEN BEGIN
            AssignDefaultAttendeeInfo;
            LoadTempAttachment;
          END ELSE
            ClearDefaultAttendeeInfo;
        TypeOnAfterValidate;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF Type <> xRec.Type THEN
          IF Type = Type::Meeting THEN BEGIN
            "Team To-do" := TRUE;
        #3..7
        */
        //end;
    }


    //Unsupported feature: Code Modification on "ShowStep(PROCEDURE 2)".

    //procedure ShowStep();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CASE "Wizard Step" OF
      "Wizard Step"::"1":
        BEGIN
    #4..21
            END;
            BackEnable := TRUE;
            IF Type = Type::Meeting THEN
              "Wizard Contact NameEnable" := FALSE
            ELSE
              FinishEnable := Visible;
          END;
    #29..63
          END;
        END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..24
              //"Wizard Contact NameEnable" := FALSE
              "Wizard Contact NameEnable" := TRUE //ZT0214
    #26..66
    */
    //end;


    // local procedure GetSegmentFilter(var Segment: Record "5076")
    // var
    //     SegmentLine: Record "5077";
    //     SegmentFilter: Text;
    //     Contact: Record "5050";
    // begin
    //     Contact.GET("Contact No.");
    //     IF Contact.Type <> Contact.Type::Company THEN
    //         Contact.GET(Contact."Company No.");
    //     SegmentLine.SETRANGE("Contact No.", Contact."No.");
    //     IF SegmentLine.FINDFIRST THEN
    //         REPEAT
    //             IF SegmentFilter = '' THEN
    //                 SegmentFilter := SegmentLine."Segment No."
    //             ELSE
    //                 SegmentFilter += '|' + SegmentLine."Segment No.";

    //         UNTIL SegmentLine.NEXT = 0;
    //     Segment.SETFILTER("No.", SegmentFilter);
    // end;

    // local procedure GetOppFilter(var Opportunity: Record "5092")
    // var
    //     Contact: Record "5050";
    //     OppFiltr: Text;
    // begin
    //     Contact.GET("Contact No.");
    //     IF Contact.Type <> Contact.Type::Company THEN
    //         Contact.GET(Contact."Company No.");
    //     Opportunity.SETRANGE("Contact Company No.", Contact."No.");
    //     Opportunity.SETRANGE("Salesperson Code", Contact."Salesperson Code");
    //     Opportunity.SETRANGE(Closed, FALSE);
    // end;
}

