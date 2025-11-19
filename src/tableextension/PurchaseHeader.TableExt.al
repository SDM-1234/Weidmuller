namespace WM.WeidmullerDEV;

using Microsoft.Foundation.Attachment;
using Microsoft.Purchases.Document;
    
tableextension 50031 PurchaseHeader extends "Purchase Header"
{
    fields
    {
        field(50000; "WE Your Reference"; Code[100])
        {
            Caption = 'Your Reference';
            DataClassification = ToBeClassified;
        }
        field(50001; "No. of Boxes"; Integer)
        {
            Caption = 'No. of Boxes';
            DataClassification = ToBeClassified;
            Tooltip = 'No. of Boxes';
        }
        field(50002; "Box Dimension"; Text[100])
        {
            Caption = 'Box Dimension';
            DataClassification = ToBeClassified;
            Tooltip = 'Box Dimension';
        }
        field(50003; "Gross Weight"; Text[50])
        {
            Caption = 'Gross Weight';
            DataClassification = ToBeClassified;
            Tooltip = 'Gross Weight';
        }
        field(50004; "Net Weight"; Text[50])
        {
            Caption = 'Net Weight';
            DataClassification = ToBeClassified;
            Tooltip = 'Net Weight';
        }
        field(50005; "Proforma Contact Name"; Text[250])
        {
            Caption = 'Proforma Contact Name';
            DataClassification = ToBeClassified;
            Tooltip = 'Proforma Contact Name';
        }
    }
    keys
    {
        key(WEKey1; "Document Type", Status, "Document Date")
        {
            Enabled = false;
        }
    }

    procedure CheckAttachment(GRec: Record "Purchase Header")
    var
        RecordLink: Record "Document Attachment";
    begin
        RecordLink.SETRANGE("Table ID", Database::"Purchase Header");
        RecordLink.SetRange("No.", GRec."No.");
        IF RecordLink.IsEmpty THEN
            ERROR('Link attachment is mandatory to send approval request');
    end;
}

