namespace WM.WeidmullerDEV;

using Microsoft.Finance.GeneralLedger.Setup;
    
pageextension 50002 GeneralLedgerSetup extends "General Ledger Setup"
{
    layout
    {
        addafter("Control VAT Period")
        {
            field("Unit-Amount Rounding Precision"; Rec."Unit-Amount Rounding Precision")
            {
                ToolTip = 'Specifies the size of the interval to be used when rounding unit amounts, item or resource prices per unit, in LCY. Amounts will be rounded to the nearest digit. Example: To have unit amounts rounded to whole numbers, enter 1.00 in this field. In this case, amounts less than 0.5 will be rounded down and amounts greater than or equal to 0.5 will be rounded up. On the Currencies page, you specify how unit amounts in foreign currencies are rounded.';
                ApplicationArea = All;
            }
        }
        addafter("Allow Posting To")
        {
            field("Dunning Letter Date"; Rec."Dunning Letter Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Dunning Letter Date field.', Comment = '%';
            }
        }
    }
}

