pageextension 50093 WarehouseShipment extends "Warehouse Shipment"
{

    layout
    {
        addafter("Assigned User ID")
        {
            field("EAN No."; Rec."EAN No.")
            {
                Visible = false;
                ApplicationArea = All;
                ToolTip = 'Specifies the EAN No. for the Warehouse Shipment.';


                trigger OnValidate()
                begin
                    CurrPage.WhseShptLines.PAGE.UpdateByEAN(Rec);//SE-E859
                end;
            }
            field("LR/RR No."; Rec."LR/RR No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the LR/RR No. for the Warehouse Shipment.';
            }
            field("LR/RR Date"; Rec."LR/RR Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the LR/RR Date for the Warehouse Shipment.';
            }
            field("Vehicle No."; Rec."Vehicle No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Vehicle No. for the Warehouse Shipment.';
            }
            field("Time of Removal"; Rec."Time of Removal")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Time of Removal for the Warehouse Shipment.';
            }
            field("Date of Removal"; Rec."Date of Removal")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Date of Removal for the Warehouse Shipment.';
            }

        }
        modify("External Document No.")
        {
            Caption = 'E-Way No.';
        }
        addafter(Control1900383207)
        {
            part("BinContent FactBox"; 50000)
            {
                Caption = 'BinContent FactBox';
                Provider = WhseShptLines;
                SubPageLink = "Item No." = field("Item No.");
                ApplicationArea = All;
            }
        }


    }
    actions
    {
        addafter("Registered P&ick Lines")
        {
            action(ClearBins)
            {
                Caption = 'ClearBins';
                ApplicationArea = All;
                ToolTip = 'Clear all the bins in the warehouse receipt lines.';
                Image = Bins;

                trigger OnAction()
                begin
                    Rec.ClearBins();
                end;
            }
        }
        addafter("Registered P&ick Lines_Promoted")
        {
            actionref(ClearBins_Promoted; ClearBins)
            {
            }
        }
    }



    trigger OnAfterGetRecord()
    begin

        CurrPage.WhseShptLines.PAGE.UpdateByEAN(Rec);
        CurrPage."BinContent FactBox".PAGE.GetPostingDate(Rec."Posting Date", Rec."Location Code");
    end;

}

