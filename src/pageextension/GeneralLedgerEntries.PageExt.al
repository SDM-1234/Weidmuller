namespace WM.WeidmullerDEV;

using Microsoft.Finance.Dimension;
using Microsoft.Finance.GeneralLedger.Ledger;

pageextension 50032 GeneralLedgerEntries extends "General Ledger Entries"
{
    layout
    {
        addafter("Source Code")
        {
            field("Dimension Code"; DimensionCode)
            {
                Caption = 'Dimension Code';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Dimension Code field.';
            }
            field("Dimension Name"; DimensionName)
            {
                Caption = 'Dimension Name';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Dimension Name field.';
            }
        }
    }

    var
        DimensionCode: Code[20];
        DimensionName: Text[50];
        DimensionSetEntry: Record "Dimension Set Entry";


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    trigger OnAfterGetRecord()
    begin

        DimensionSetEntry.RESET();
        DimensionSetEntry.SETRANGE(DimensionSetEntry."Dimension Set ID", Rec."Dimension Set ID");
        IF DimensionSetEntry.FINDFIRST() THEN BEGIN
            DimensionCode := DimensionSetEntry."Dimension Value Code";
            DimensionSetEntry.CALCFIELDS(DimensionSetEntry."Dimension Value Name");
            DimensionName := DimensionSetEntry."Dimension Value Name";
        END;

    end;
}

