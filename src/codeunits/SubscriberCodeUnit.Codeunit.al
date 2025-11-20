namespace WM.WeidmullerDEV;

using System.Automation;
    
codeunit 50004 "Subscriber CodeUnit"
{

    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnApproveApprovalRequest', '', false, false)]
    local procedure OnApproveApprovalRequest_CU1535(var ApprovalEntry: Record "Approval Entry")
    var
        RequeststoApprove: Page "Requests to Approve";
    begin
        ApprovalEntry.CALCFIELDS("Pending Approvals");
        IF ApprovalEntry."Pending Approvals" = 0 THEN
            RequeststoApprove.CustomerUnblock(ApprovalEntry);
    end;
}

