namespace WM.WeidmullerDEV;

using Microsoft.Warehouse.Ledger;
    
tableextension 50047 WarehouseEntry extends "Warehouse Entry"
{
    keys
    {
        key(WEKey1; "Item No.", "Bin Code", "Location Code", "Variant Code", "Unit of Measure Code")
        {
            SumIndexFields = Quantity;
        }
    }
}

