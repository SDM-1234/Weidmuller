namespace WM.WeidmullerDEV;

using Microsoft.Sales.Customer;
    
pageextension 50041 ShiptoAddressList extends "Ship-to Address List"
{
    layout
    {
        addafter(Control1)
        {
            field(State; Rec.State)
            {
                ToolTip = 'Specifies the value of the State field.';
                ApplicationArea = All;
            }
            field("GST Registration No."; Rec."GST Registration No.")
            {
                ToolTip = 'Specifies the value of the GST Registration No. field.';
                ApplicationArea = All;
            }
        }
    }
}

