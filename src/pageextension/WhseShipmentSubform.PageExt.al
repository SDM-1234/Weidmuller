namespace WM.WeidmullerDEV;

using Microsoft.Warehouse.Document;
    
pageextension 50095 WhseShipmentSubform extends "Whse. Shipment Subform"
{
    layout
    {
        addafter(Control1)
        {
            field("EAN No."; Rec."EAN No.")
            {
                ApplicationArea = All;
            }
        }
    }


    procedure UpdateByEAN(var WarehouseShipmentHeader1: Record "Warehouse Shipment Header")
    begin
        IF WarehouseShipmentHeader1."EAN No." <> '' THEN
            Rec.SETFILTER("EAN No.", '%1', WarehouseShipmentHeader1."EAN No.")
        ELSE
            Rec.SETRANGE("EAN No.");
        CurrPage.UPDATE(FALSE);
    end;
}

