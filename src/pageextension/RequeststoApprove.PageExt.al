namespace WM.WeidmullerDEV;

using Microsoft.Sales.Customer;
using System.Automation;
    
pageextension 50091 RequeststoApprove extends "Requests to Approve"
{
    actions
    {
        modify(Delegate)
        {
            Visible = false;
            Enabled = false;
        }
    }
    var
        Cust: Record Customer;

    procedure CustomerUnblock(ApprovalEntry: Record "Approval Entry")
    begin
        IF (STRPOS(ApprovalEntry.RecordDetails(), 'Customer') = 1) THEN BEGIN
            Cust.RESET();
            Cust.SETFILTER(Cust."No.", COPYSTR(ApprovalEntry.RecordDetails(), 11, STRLEN(ApprovalEntry.RecordDetails())));
            IF Cust.FINDFIRST() THEN BEGIN
                Cust.Blocked := Cust.Blocked::" ";
                Cust.MODIFY();
            END;
        END;
    end;
}

