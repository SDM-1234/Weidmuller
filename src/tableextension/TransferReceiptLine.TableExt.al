namespace WM.WeidmullerDEV;

using Microsoft.Foundation.AuditCodes;
using Microsoft.Inventory.Transfer;
    
tableextension 50044 "TransferReceiptLine" extends "Transfer Receipt Line"
{
    fields
    {
        field(50100; "Inspection Reason Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Inspection Reason Code';
            ToolTip = 'Specifies the reason for quality inspection.';
            TableRelation = "Reason Code";
        }
    }
}