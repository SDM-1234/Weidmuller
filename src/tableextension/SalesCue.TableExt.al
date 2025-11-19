namespace WM.WeidmullerDEV;

using Microsoft.Foundation.Task;
using Microsoft.Inventory.Item;
using Microsoft.Sales.RoleCenters;
    
tableextension 50055 SalesCue extends "Sales Cue"
{
    fields
    {
        field(50000; "Item Below Safty Qty"; Integer)
        {
            CalcFormula = Count(Item WHERE("Inv Below Safety Qty" = FILTER(True)));
            Description = 'SE E963';
            FieldClass = FlowField;
        }
        field(50001; "UT Assigned By Me - Completed"; Integer)
        {
            CalcFormula = Count("User Task" WHERE("Created By User Name" = FIELD(FILTER("User ID Filter")),
                                                   "Percent Complete" = CONST(100)));
            Caption = 'User Task Assigned By Me - Completed';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "UT Assigned By Me - Pending"; Integer)
        {
            CalcFormula = Count("User Task" WHERE("Created By User Name" = FIELD(FILTER("User ID Filter")),
                                                   "Percent Complete" = FILTER(< 100)));
            Caption = 'User Task Assigned By Me - Pending';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "UT Assigned To Me - Completed"; Integer)
        {
            CalcFormula = Count("User Task" WHERE("Assigned To User Name" = FIELD(FILTER("User ID Filter")),
                                                   "Percent Complete" = CONST(100)));
            Caption = 'User Task Assigned To Me - Completed';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50004; "UT Assigned To Me - Pending"; Integer)
        {
            CalcFormula = Count("User Task" WHERE("Assigned To User Name" = FIELD(FILTER("User ID Filter")),
                                                   "Percent Complete" = FILTER(< 100)));
            Caption = 'User Task Assigned To Me - Pending';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}

