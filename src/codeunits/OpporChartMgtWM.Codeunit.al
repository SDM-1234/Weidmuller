namespace WM.WeidmullerDEV;

using Microsoft.CRM.Opportunity;
using Microsoft.CRM.Team;
using System.Utilities;
using System.Visualization;
    
codeunit 50010 "Oppor Chart Mgt. WM"
{
    trigger OnRun()
    begin
    end;

    procedure DrillDown(var BusinessChartBuffer: Record "Business Chart Buffer"; Period: Record Date; OpportunityStatus: Option)
    var
        Opportunity: Record Opportunity;
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        SalesPersonName: Variant;
    begin
        BusinessChartBuffer.GetXValue(BusinessChartBuffer."Drill-Down X Index", SalesPersonName);
        SalespersonPurchaser.SetRange(Name, SalesPersonName);
        SalespersonPurchaser.FindFirst();
        Opportunity.SetRange("Salesperson Code", SalespersonPurchaser.Code);
        Opportunity.Status := "Opportunity Status".FromInteger(OpportunityStatus);
        Opportunity.SetRange(Status, Opportunity.Status);
        case Opportunity.Status of
            Opportunity.Status::"Not Started",
          Opportunity.Status::"In Progress":
                Opportunity.SetRange("Creation Date", 0D, Period."Period End");
            Opportunity.Status::Won,
          Opportunity.Status::Lost:
                Opportunity.SetRange("Date Closed", Period."Period Start", Period."Period End");
        end;
        PAGE.Run(PAGE::"Opportunity List", Opportunity);
    end;

    local procedure GetOppCount(Period: Record Date; SalesPersonCode: Code[20]; OpportunityStatus: Option): Integer
    var
        Opportunity: Record Opportunity;
    begin
        Opportunity.SETRANGE("Salesperson Code", SalesPersonCode);
        Opportunity.Status := "Opportunity Status".FromInteger(OpportunityStatus);
        IF OpportunityStatus <> 99 THEN
            Opportunity.SETRANGE(Status, Opportunity.Status)
        ELSE BEGIN // Added
            Opportunity.SETRANGE(Status);
            Opportunity.SETRANGE("Creation Date", Period."Period Start", Period."Period End"); //Added
        END; //Added
        CASE Opportunity.Status OF
            Opportunity.Status::"Not Started",
          Opportunity.Status::"In Progress":
                //Opportunity.SETRANGE("Creation Date",0D,Period."Period End");
                Opportunity.SETRANGE("Creation Date", Period."Period Start", Period."Period End");
            Opportunity.Status::Won,
          Opportunity.Status::Lost:
                Opportunity.SETRANGE("Date Closed", Period."Period Start", Period."Period End");
        END;
        EXIT(Opportunity.COUNT);
    end;

    procedure SetDefaultOppStatus(var Opportunity: Record Opportunity)
    begin
        Opportunity.Status := Opportunity.Status::Won;
    end;

    procedure SetDefaultPeriod(var Period: Record Date)
    begin
        Period."Period Type" := Period."Period Type"::Month;
        Period."Period Start" := CALCDATE('<-CM>', WORKDATE());
        Period."Period End" := CALCDATE('<CM>', WORKDATE());
    end;

    procedure SetNextPeriod(var Period: Record Date)
    begin
        CASE Period."Period Type" OF
            Period."Period Type"::Date:
                Period."Period Start" := CALCDATE('<+1D>', Period."Period Start");
            Period."Period Type"::Week:
                Period."Period Start" := CALCDATE('<+1W>', Period."Period Start");
            Period."Period Type"::Month:
                Period."Period Start" := CALCDATE('<+1M>', Period."Period Start");
            Period."Period Type"::Quarter:
                Period."Period Start" := CALCDATE('<+1Q>', Period."Period Start");
            Period."Period Type"::Year:
                Period."Period Start" := CALCDATE('<+1Y>', Period."Period Start");
        END;
        SetPeriodRange(Period);
    end;

    procedure SetPrevPeriod(var Period: Record Date)
    begin
        CASE Period."Period Type" OF
            Period."Period Type"::Date:
                Period."Period Start" := CALCDATE('<-1D>', Period."Period Start");
            Period."Period Type"::Week:
                Period."Period Start" := CALCDATE('<-1W>', Period."Period Start");
            Period."Period Type"::Month:
                Period."Period Start" := CALCDATE('<-1M>', Period."Period Start");
            Period."Period Type"::Quarter:
                Period."Period Start" := CALCDATE('<-1Q>', Period."Period Start");
            Period."Period Type"::Year:
                Period."Period Start" := CALCDATE('<-1Y>', Period."Period Start");
        END;
        SetPeriodRange(Period);
    end;

    procedure SetPeriodRange(var Period: Record Date)
    begin
        CASE Period."Period Type" OF
            Period."Period Type"::Date:
                BEGIN
                    Period."Period Start" := Period."Period Start";
                    Period."Period End" := Period."Period Start";
                END;
            Period."Period Type"::Week:
                BEGIN
                    Period."Period Start" := CALCDATE('<-CW>', Period."Period Start");
                    Period."Period End" := CALCDATE('<CW>', Period."Period Start");
                END;
            Period."Period Type"::Month:
                BEGIN
                    Period."Period Start" := CALCDATE('<-CM>', Period."Period Start");
                    Period."Period End" := CALCDATE('<CM>', Period."Period Start");
                END;
            Period."Period Type"::Quarter:
                BEGIN
                    Period."Period Start" := CALCDATE('<-CQ>', Period."Period Start");
                    Period."Period End" := CALCDATE('<CQ>', Period."Period Start");
                END;
            Period."Period Type"::Year:
                BEGIN
                    Period."Period Start" := CALCDATE('<-CY>', Period."Period Start");
                    Period."Period End" := CALCDATE('<CY>', Period."Period Start");
                END;
        END;
    end;

    procedure UpdateData(var BusinessChartBuffer: Record "Business Chart Buffer"; Period: Record Date; OpportunityStatus: Option; ByAmt: Boolean)
    var
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        CRMCue: Record "CRM Cue";
        I: Integer;
        OppCount: Integer;
        OppAmt: Decimal;
    begin
        BusinessChartBuffer.Initialize();
        BusinessChartBuffer.AddMeasure(SalespersonPurchaser.FIELDCAPTION("No. of Opportunities"), 1, BusinessChartBuffer."Data Type"::Integer, BusinessChartBuffer."Chart Type"::Pie.asinteger());
        BusinessChartBuffer.SetXAxis(SalespersonPurchaser.TABLECAPTION, BusinessChartBuffer."Data Type"::String);
        SalespersonPurchaser.SETFILTER(Code, CRMCue.GetSalesPersonFilter(CRMCue.GetTeamCode()));
        IF SalespersonPurchaser.FINDSET() THEN
            REPEAT
                IF NOT ByAmt THEN BEGIN
                    OppCount := GetOppCount(Period, SalespersonPurchaser.Code, OpportunityStatus);
                    IF OppCount <> 0 THEN BEGIN
                        I += 1;
                        BusinessChartBuffer.AddColumn(SalespersonPurchaser.Name);
                        BusinessChartBuffer.SetValueByIndex(0, I - 1, OppCount);
                    END;
                END ELSE BEGIN
                    OppAmt := GetOppAmtPeriod(Period."Period Start", Period."Period End", OpportunityStatus, SalespersonPurchaser.Code);
                    IF OppAmt <> 0 THEN BEGIN
                        I += 1;
                        BusinessChartBuffer.AddColumn(SalespersonPurchaser.Name);
                        BusinessChartBuffer.SetValueByIndex(0, I - 1, OppAmt);
                    END;
                END;
            UNTIL SalespersonPurchaser.NEXT() = 0;
    end;

    procedure UpdateDataPeriod(var BusinessChartBuffer: Record "Business Chart Buffer"; Period: Record Date; OpportunityStatus: Option; ByAmt: Boolean; ByCount: Boolean)
    var
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        Opportunity: Record Opportunity;
        I: Integer;
        OppCount: Integer;
        OppAmt: Decimal;
        ToDate: array[5] of Date;
        FromDate: array[5] of Date;
    begin
        BusinessChartBuffer.Initialize();
        BusinessChartBuffer."Period Length" := Period."Period Type";
        BusinessChartBuffer.SetPeriodXAxis();

        IF ByCount THEN
            BusinessChartBuffer.AddMeasure(SalespersonPurchaser.FIELDCAPTION("No. of Opportunities"), 1, BusinessChartBuffer."Data Type"::Integer, BusinessChartBuffer."Chart Type"::Column.asinteger());
        IF ByAmt THEN
            BusinessChartBuffer.AddMeasure(Opportunity.FIELDCAPTION("Estimated Value (LCY)"), 1, BusinessChartBuffer."Data Type"::Decimal, BusinessChartBuffer."Chart Type"::Column.asinteger());

        IF CalcPeriods(FromDate, ToDate, BusinessChartBuffer, Period) THEN BEGIN
            BusinessChartBuffer.AddPeriods(ToDate[1], ToDate[ARRAYLEN(ToDate)]);

            FOR I := 1 TO ARRAYLEN(ToDate) DO BEGIN
                IF ByCount THEN BEGIN
                    OppCount := GetOppCountPeriod(FromDate[I], ToDate[I], OpportunityStatus);
                    BusinessChartBuffer.SetValueByIndex(0, I - 1, OppCount);
                END;
                IF ByAmt THEN BEGIN
                    OppAmt := GetOppAmtPeriod(FromDate[I], ToDate[I], OpportunityStatus, '');
                    BusinessChartBuffer.SetValueByIndex(0, I - 1, OppAmt);
                END;
            END;
        END;
    end;

    local procedure GetOppCountPeriod(StartDate: Date; EndDate: Date; OpportunityStatus: Option): Integer
    var
        Opportunity: Record Opportunity;
        CRMCue: Record "CRM Cue";
    begin
        Opportunity.SETFILTER("Salesperson Code", CRMCue.GetSalesPersonFilter(CRMCue.GetTeamCode()));
        Opportunity.Status := "Opportunity Status".FromInteger(OpportunityStatus);
        IF OpportunityStatus <> 99 THEN
            Opportunity.SETRANGE(Status, Opportunity.Status)
        ELSE
            Opportunity.SETRANGE(Status);
        Opportunity.SETRANGE("Creation Date", StartDate, EndDate);
        EXIT(Opportunity.COUNT);
    end;

    local procedure GetOppAmtPeriod(StartDate: Date; EndDate: Date; OpportunityStatus: Option; SpCode: Code[20]) OppAmt: Decimal
    var
        Opportunity: Record Opportunity;
        CRMCue: Record "CRM Cue";
    begin
        IF SpCode = '' THEN
            Opportunity.SETFILTER("Salesperson Code", CRMCue.GetSalesPersonFilter(CRMCue.GetTeamCode()))
        ELSE
            Opportunity.SETRANGE("Salesperson Code", SpCode);
        Opportunity.Status := "Opportunity Status".FromInteger(OpportunityStatus);
        IF OpportunityStatus <> 99 THEN
            Opportunity.SETRANGE(Status, Opportunity.Status)
        ELSE
            Opportunity.SETRANGE(Status);
        Opportunity.SETRANGE("Creation Date", StartDate, EndDate);
        IF Opportunity.FINDSET(false) THEN
            REPEAT
                Opportunity.CALCFIELDS("Estimated Value (LCY)");
                OppAmt += Opportunity."Estimated Value (LCY)";
            UNTIL Opportunity.NEXT() = 0;
    end;

    local procedure CalcPeriods(var FromDate: array[5] of Date; var ToDate: array[5] of Date; var BusChartBuf: Record "Business Chart Buffer"; Period: Record Date): Boolean
    var
        MaxPeriodNo: Integer;
        i: Integer;
    begin
        MaxPeriodNo := ARRAYLEN(ToDate);
        ToDate[MaxPeriodNo] := Period."Period End";
        IF ToDate[MaxPeriodNo] = 0D THEN
            EXIT(FALSE);
        FOR i := MaxPeriodNo DOWNTO 1 DO BEGIN
            FromDate[i] := BusChartBuf.CalcFromDate(ToDate[i]);
            IF i > 1 THEN
                ToDate[i - 1] := FromDate[i] - 1;
        END;
        EXIT(TRUE);
    end;
}

