namespace WM.WeidmullerDEV;

using Microsoft.Finance.RoleCenters;
using Microsoft.Foundation.Task;
    
tableextension 50054 FinanceCue extends "Finance Cue"
{
    fields
    {
        field(50000; "Pending Tasks"; Integer)
        {
            CalcFormula = Count("User Task" WHERE("Assigned To User Name" = FIELD("User ID Filter"),
                                                 "Percent Complete" = FILTER(<> 100)));
            Caption = 'Pending Tasks';
            FieldClass = FlowField;
        }
        field(50001; "User ID Filter"; Code[50])
        {
            FieldClass = FlowFilter;
        }

    }
}

