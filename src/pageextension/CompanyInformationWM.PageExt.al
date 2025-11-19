namespace WM.WeidmullerDEV;

using Microsoft.Foundation.Company;
    
pageextension 50001 CompanyInformationWM extends "Company Information"
{
    layout
    {
        addafter("Country/Region Code")
        {
            field("Phone No. 2"; Rec."Phone No. 2")
            {
                ToolTip = 'Specifies the value of the Phone No. 2 field.';
                ApplicationArea = All;
            }
            field("Terms Picture"; Rec."Terms Picture")
            {
                Caption = 'Terms Picture';
                ToolTip = 'Specifies the value of the Terms Picture field.';
                ApplicationArea = All;
            }
        }
        addafter("Contact Person")
        {
            field("Home Page 2"; Rec."Home Page 2")
            {
                ToolTip = 'Specifies the value of the Home Page field.';
                ApplicationArea = All;
            }

            field("IFSC Code"; Rec."IFSC Code")
            {
                ToolTip = 'Specifies the value of the IFSC Code field.';
                ApplicationArea = All;
            }
            field("LUT No."; Rec."LUT No.")
            {
                ToolTip = 'Specifies the value of the LUT No. field.';
                ApplicationArea = All;
            }
            field("C.I.N. No."; Rec.CIN)
            {
                ToolTip = 'Specifies the value of the CIN field.';
                ApplicationArea = All;
            }
        }
    }
}

