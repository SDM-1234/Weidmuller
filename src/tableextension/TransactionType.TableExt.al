namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Intrastat;
    
tableextension 50025 TransactionType extends "Transaction Type"
{
    fields
    {
        field(50000; "Special Price"; Boolean)
        {
            Caption = 'Special Price';
            DataClassification = ToBeClassified;
            Description = '1065';
        }
    }
}

