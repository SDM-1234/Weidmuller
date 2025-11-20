namespace WM.WeidmullerDEV;

using Microsoft.Sales.Customer;
    
table 50002 "Dunning Remarks"
{

    fields
    {
        field(1; "S. No"; Integer)
        {
            BlankZero = true;
            NotBlank = true;
        }
        field(2; "Remark Date"; Date)
        {
        }
        field(3; Remarks; Text[250])
        {
        }
        field(4; "Customer ID"; Code[20])
        {
            TableRelation = Customer;
        }
    }

    keys
    {
        key(Key1; "S. No", "Customer ID")
        {
            Clustered = true;
        }
        key(Key2; "Remark Date")
        {
        }
    }

    fieldgroups
    {
    }
}

