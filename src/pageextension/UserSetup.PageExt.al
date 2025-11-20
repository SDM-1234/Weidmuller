namespace WM.WeidmullerDEV;

using System.Security.User;
    
pageextension 50003 UserSetup extends "User Setup"
{
    layout
    {
        addafter(PhoneNo)
        {
            field("Update Pricing"; Rec."Update Pricing")
            {
                ToolTip = 'Specifies the value of the Update Pricing field.';
                ApplicationArea = All;
            }
            field("Team Code"; Rec."Team Code")
            {
                ToolTip = 'Specifies the team code for the user.';
                ApplicationArea = All;
            }
        }
    }
}

