pageextension 50034 SalesPriceList extends "Sales Price List"
{
    layout
    {
        // Add changes to page layout here
        modify(Status)
        {
            Editable = false;
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter(ActionGroupCRM)
        {
            group(Approval)
            {
                Caption = 'Approval';
                Image = Approvals;
                action("Send for Approval")
                {
                    ApplicationArea = All;
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send for Approval action.';

                    trigger OnAction()
                    var
                        PriceAppMgt: Codeunit "Price Approval Mgmt";
                    begin
                        PriceAppMgt.OnSendRequestforApproval(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Request';
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel sending the Price for approval.';
                    trigger OnAction()
                    var
                        PriceAppMgt: Codeunit "Price Approval Mgmt";
                    begin
                        PriceAppMgt.OnCancelRequestForApproval(Rec);
                    end;
                }
            }
        }
    }
}