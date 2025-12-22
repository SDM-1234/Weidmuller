namespace WM.WeidmullerDEV;

using Microsoft.Warehouse.Ledger;
using Microsoft.Warehouse.Structure;
    
page 50000 "BinContent FactBox"
{
    Caption = 'Bin Content - Details';
    Editable = false;
    InsertAllowed = true;
    PageType = ListPart;
    SourceTable = "Bin Content";
    SourceTableView = SORTING("Location Code", "Bin Code", "Item No.", "Variant Code", "Unit of Measure Code")
                      ORDER(Ascending)
                      WHERE(Quantity = FILTER(> 0));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Bin Code"; Rec."Bin Code")
                {
                    Caption = 'Bin Code';
                    ToolTip = 'Specifies the bin code for the item.';
                    ApplicationArea = All;
                }
                field(Quantity; BinQuantity)
                {
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the quantity of the item in the bin.';
                    ApplicationArea = All;
                }
                field("Receipt Date"; RecieptDate)
                {
                    Caption = 'Receipt Date';
                    ToolTip = 'Specifies the date when the item was received in the bin.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        CLEAR(BinQuantity);
        CLEAR(RecieptDate);
        UpdatewithPostDate(G_LocationCode);
    end;

    var
        WarehouseEntry, WarehouseEntry1 : Record "Warehouse Entry";
        BinQuantity: Decimal;
        RecieptDate: Date;
        G_LocationCode: Code[10];

    local procedure UpdatewithPostDate(L_LocCode: Code[10])
    begin
        WarehouseEntry.RESET();
        WarehouseEntry.SETCURRENTKEY("Item No.", "Bin Code", "Location Code", "Variant Code", "Unit of Measure Code");
        WarehouseEntry.SETRANGE("Location Code", L_LocCode);
        WarehouseEntry.SETRANGE("Bin Code", Rec."Bin Code");
        WarehouseEntry.SETRANGE("Item No.", Rec."Item No.");
        WarehouseEntry.SETRANGE("Variant Code", Rec."Variant Code");
        WarehouseEntry.SETRANGE("Unit of Measure Code", Rec."Unit of Measure Code");
        WarehouseEntry.CALCSUMS(Quantity);
        BinQuantity := WarehouseEntry.Quantity;
        CLEAR(WarehouseEntry1);
        WarehouseEntry1.COPYFILTERS(WarehouseEntry);
        IF WarehouseEntry1.FINDLAST() THEN
            RecieptDate := WarehouseEntry1."Registering Date";
        CurrPage.UPDATE(FALSE);
    end;

    procedure GetPostingDate(L_PostDate: Date; L_LocationCode: Code[10])
    begin
        G_LocationCode := L_LocationCode;
        Rec.SETRANGE("Location Code", G_LocationCode);
        CurrPage.UPDATE(FALSE);
    end;
}

