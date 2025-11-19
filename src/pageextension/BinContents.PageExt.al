namespace WM.WeidmullerDEV;

using Microsoft.Warehouse.Structure;
    
pageextension 50021 BinContents extends "Bin Contents"
{
    layout
    {

        modify("Item Description")
        {
            visible = true;
        }
        addafter("Item No.")
        {
            field(Desc; Desc)
            {
                Caption = 'Desc';
                Editable = false;
                ApplicationArea = all;
            }
        }
    }

    var
        Desc: Text[250];
        ItemDescription: Text[250];



    trigger OnAfterGetCurrRecord()

    begin


        REC.GetItemDescr(Rec."Item No.", Rec."Variant Code", ItemDescription);
        Desc := ItemDescription;
        //Rec.DataCaption := STRSUBSTNO('%1 ', Rec."Bin Code");


    end;


    trigger OnAfterGetRecord()
    begin
        //SE-E859.s
        CLEAR(ItemDescription);//SE-E859.s
        Rec.GetItemDescr(Rec."Item No.", Rec."Variant Code", ItemDescription);
        Desc := ItemDescription;
        //SE-E859.e

    end;

    trigger OnOpenPage()
    begin
        ItemDescription := '';
        Desc := '';//SE-E859.s
        //Rec.GetWhseLocation(LocationCode, ZoneCode);
        Rec.SETFILTER("Quantity (Base)", '>%1', 0);//SE-E859.s
    end;
}

