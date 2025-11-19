namespace WM.WeidmullerDEV;

using Microsoft.Sales.History;
    
pageextension 50004 PostedSalesShipment extends "Posted Sales Shipment"
{
    actions
    {
        addafter("F&unctions")
        {
            action("Packing List")
            {
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Packing List action.';
                ApplicationArea = All;

                trigger OnAction()
                var
                    SalesShptHeader: Record "Sales Shipment Header";
                //PackingList: Report "Packing List";
                begin
                    SalesShptHeader.RESET();
                    SalesShptHeader.SETRANGE(SalesShptHeader."No.", Rec."No.");
                    IF SalesShptHeader.FINDFIRST() THEN BEGIN
                        //PackingList.SETTABLEVIEW(SalesShptHeader);
                        //PackingList.RUN();
                    END;

                    /*
                    InvtPick.SETRANGE(InvtPick."Source No.","No.");
                    IF InvtPick.FINDFIRST THEN BEGIN
                      PackingList.SETTABLEVIEW(InvtPick);
                      PackingList.RUN;
                    END;
                    */

                end;
            }
        }
    }
}

