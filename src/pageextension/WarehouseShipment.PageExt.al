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


                trigger OnValidate()
                begin
                    CurrPage.WhseShptLines.PAGE.UpdateByEAN(Rec);//SE-E859
                end;
            }
            field("LR/RR No."; Rec."LR/RR No.")
            {
                ApplicationArea = All;
            }
            field("LR/RR Date"; Rec."LR/RR Date")
            {
                ApplicationArea = All;
            }
            field("Vehicle No."; Rec."Vehicle No.")
            {
                ApplicationArea = All;
            }
            field("Time of Removal"; Rec."Time of Removal")
            {
                ApplicationArea = All;
            }
            field("Date of Removal"; Rec."Date of Removal")
            {
                ApplicationArea = All;
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



    trigger OnAfterGetRecord()
    begin

        CurrPage.WhseShptLines.PAGE.UpdateByEAN(Rec);
        CurrPage."BinContent FactBox".PAGE.GetPostingDate(Rec."Posting Date", Rec."Location Code");
    end;

}

