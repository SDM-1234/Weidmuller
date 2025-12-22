namespace WM.WeidmullerDEV;

using Microsoft.CRM.Opportunity;
using System.Utilities;
using System.Visualization;
using System.Integration;



page 50010 "Opportunity Chart WM"
{
    Caption = 'Opportunities';
    PageType = CardPart;

    layout
    {
        area(content)
        {
            field(StatusText; StatusText)
            {
                Caption = 'Status Text';
                Enabled = false;
                ShowCaption = false;
                Style = StrongAccent;
                StyleExpr = TRUE;
                ToolTip = 'Specifies the status of the chart.';
                ApplicationArea = All;
            }
            usercontrol(BusinessChart; "BusinessChart")
            {
                ApplicationArea = RelationshipMgmt;

                trigger DataPointClicked(Point: JsonObject)
                begin
                    BusinessChartBuffer.SetDrillDownIndexes(Point);
                    OppChartMgt.DrillDown(BusinessChartBuffer, Periodg, Opportunityg.Status.AsInteger());
                end;

                trigger DataPointDoubleClicked(Point: JsonObject)
                begin
                end;

                trigger AddInReady()
                begin
                    IsChartAddInReady := true;
                    UpdateChart(Periodg, Opportunityg);
                end;

                trigger Refresh()
                begin
                    if IsChartAddInReady then
                        UpdateChart(Periodg, Opportunityg);
                end;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Opportunity)
            {
                Caption = 'Opportunity';
                Image = SelectChart;
                action("All Status")
                {
                    Caption = 'All Status';
                    ToolTip = 'View all opportunities.';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Opportunityg.Status := Opportunityg.Status::"99";
                        UpdateChart(Periodg, Opportunityg);
                    end;
                }
                action(NotStarted)
                {
                    Caption = 'Not Started';
                    ToolTip = 'View opportunities not started.';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Opportunityg.Status := Opportunityg.Status::"Not Started";
                        UpdateChart(Periodg, Opportunityg);
                    end;
                }
                action(InProgress)
                {
                    Caption = 'In Progress';
                    ToolTip = 'View opportunities in progress.';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Opportunityg.Status := Opportunityg.Status::"In Progress";
                        UpdateChart(Periodg, Opportunityg);
                    end;
                }
                action(Won)
                {
                    Caption = 'Won';
                    ToolTip = 'View opportunities won.';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Opportunityg.Status := Opportunityg.Status::Won;
                        UpdateChart(Periodg, Opportunityg);
                    end;
                }
                action(Lost)
                {
                    Caption = 'Lost';
                    ToolTip = 'View opportunities lost.';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Opportunityg.Status := Opportunityg.Status::Lost;
                        UpdateChart(Periodg, Opportunityg);
                    end;
                }
            }
            group(Period)
            {
                Caption = 'Period';
                Image = Period;
                action(Day)
                {
                    Caption = 'Day';
                    ToolTip = 'View the day.';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Periodg."Period Type" := Periodg."Period Type"::Date;
                        SetPeriodAndUpdateChart(Periodg);
                    end;
                }
                action(Week)
                {
                    Caption = 'Week';
                    ToolTip = 'View the week.';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Periodg."Period Type" := Periodg."Period Type"::Week;
                        SetPeriodAndUpdateChart(Periodg);
                    end;
                }
                action(Month)
                {
                    Caption = 'Month';
                    ToolTip = 'View the month.';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Periodg."Period Type" := Periodg."Period Type"::Month;
                        SetPeriodAndUpdateChart(Periodg);
                    end;
                }
                action(Quarter)
                {
                    Caption = 'Quarter';
                    ToolTip = 'View the quarter.';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Periodg."Period Type" := Periodg."Period Type"::Quarter;
                        SetPeriodAndUpdateChart(Periodg);
                    end;
                }
                action(Year)
                {
                    Caption = 'Year';
                    ToolTip = 'View the year.';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Periodg."Period Type" := Periodg."Period Type"::Year;
                        SetPeriodAndUpdateChart(Periodg);
                    end;
                }
            }
            group(View)
            {
                Caption = 'View';
                Image = History;
                group(_Period)
                {
                    Caption = 'Period';
                    ToolTip = 'View the chart by period.';
                    action(_Amount)
                    {
                        Caption = 'Amount';
                        ToolTip = 'View the chart by amount.';
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            ByPeriod := TRUE;
                            ByAmt := TRUE;
                            ByCount := FALSE;
                            UpdateChart(Periodg, Opportunityg);
                        end;
                    }
                    action(_Count)
                    {
                        Caption = 'Count';
                        ToolTip = 'View the chart by count.';
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            ByPeriod := TRUE;
                            ByAmt := FALSE;
                            ByCount := TRUE;
                            UpdateChart(Periodg, Opportunityg);
                        end;
                    }
                }
                group(SalesPerson)
                {
                    Caption = 'SalesPerson';
                    action(__Amount)
                    {
                        Caption = 'Amount';
                        ToolTip = 'View the chart by sales person amount.';
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            ByPeriod := FALSE;
                            BySPAmt := TRUE;
                            UpdateChart(Periodg, Opportunityg);
                        end;
                    }
                    action(__Count)
                    {
                        Caption = 'Count';
                        ToolTip = 'View the chart by sales person count.';
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            ByPeriod := FALSE;
                            BySPAmt := FALSE;
                            UpdateChart(Periodg, Opportunityg);
                        end;
                    }
                }
            }
            action(PrevPeriod)
            {
                Caption = 'Previous Period';
                Image = PreviousRecord;
                ToolTip = 'Show the information based on the previous period. If you set the View by field to Day, the date filter changes to the day before.';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    OppChartMgt.SetPrevPeriod(Periodg);
                    UpdateChart(Periodg, Opportunityg);
                end;
            }
            action(NextPeriod)
            {
                Caption = 'Next Period';
                Image = NextRecord;
                ToolTip = 'Show the information based on the next period. If you set the View by field to Day, the date filter changes to the day before.';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    OppChartMgt.SetNextPeriod(Periodg);
                    UpdateChart(Periodg, Opportunityg);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        OppChartMgt.SetDefaultOppStatus(Opportunityg);
        OppChartMgt.SetDefaultPeriod(Periodg);
    end;

    var
        BusinessChartBuffer: Record "Business Chart Buffer";
        Opportunityg: Record Opportunity;
        Periodg: Record Date;
        OppChartMgt: Codeunit "Oppor Chart Mgt. WM";
        StatusText: Text;
        IsChartAddInReady: Boolean;
        ByPeriod: Boolean;
        ByAmt: Boolean;
        ByCount: Boolean;
        BySPAmt: Boolean;

    local procedure SetPeriodAndUpdateChart(var Periodp: Record Date)
    begin
        OppChartMgt.SetPeriodRange(Periodp);
        UpdateChart(Periodp, Opportunityg);
    end;

    local procedure UpdateChart(Periodp: Record Date; Opportunityp: Record Opportunity)
    begin
        // IF NOT IsChartAddInReady THEN
        //  EXIT;

        IF ByPeriod THEN
            OppChartMgt.UpdateDataPeriod(BusinessChartBuffer, Periodp, Opportunityp.Status.AsInteger(), ByAmt, ByCount)
        ELSE
            OppChartMgt.UpdateData(BusinessChartBuffer, Periodp, Opportunityp.Status.AsInteger(), BySPAmt);
        BusinessChartBuffer.UpdateChart(CurrPage.BusinessChart);
        UpdateStatusText(Periodp, Opportunityp);
    end;

    local procedure UpdateStatusText(Periodp: Record Date; Opportunityp: Record Opportunity)
    begin
        StatusText := FORMAT(Opportunityp.Status) + ' | ' + FORMAT(Periodp."Period Type") + ' | ';
        CASE Opportunityp.Status OF
            Opportunityp.Status::"Not Started",
          Opportunityp.Status::"In Progress":
                StatusText += FORMAT(Periodp."Period Start") + ' .. ' + FORMAT(Periodp."Period End");
            Opportunityp.Status::Won,
          Opportunityp.Status::Lost:
                StatusText += FORMAT(Periodp."Period Start") + ' .. ' + FORMAT(Periodp."Period End");
            Opportunityp.Status::"99":
                StatusText += FORMAT(Periodp."Period Start") + ' .. ' + FORMAT(Periodp."Period End");
        END;
    end;
}

