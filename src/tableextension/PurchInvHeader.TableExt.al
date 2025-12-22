namespace WM.WeidmullerDEV;

using Microsoft.Purchases.History;
    
tableextension 50008 PurchInvHeader extends "Purch. Inv. Header"
{
    fields
    {
        field(50000; "WE Your Reference"; Code[100])
        {
            Caption = 'Your Reference';
            DataClassification = ToBeClassified;
        }
    }
}

