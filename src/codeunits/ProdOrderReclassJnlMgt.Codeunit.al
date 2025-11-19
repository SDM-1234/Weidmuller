codeunit 50023 "Prod. Order Reclass Jnl. Mgt."
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Production Order", OnAfterValidateEvent, 'Location Code', false, false)]
    local procedure ProdOrder_OnafterValidateLoc(CurrFieldNo: Integer; var Rec: Record "Production Order"; var xRec: Record "Production Order")
    var
        ProdOrderLine: Record "Prod. Order Line";
        ProdOrderComp: Record "Prod. Order Component";
        ManuSetup: Record "Manufacturing Setup";
        ReservEntry2, ReservEntry3 : Record "Reservation Entry";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
        ReservationPage: Page Reservation;
        RecordsFound: Boolean;
    begin
        if rec."Location Code" = xRec."Location Code" then
            exit;
        if CurrFieldNo <> Rec.FieldNo("Location Code") then
            exit;
        if rec.Status <> rec.Status::"Firm Planned" then
            exit;
        ManuSetup.Get();
        if ManuSetup."Reclass To Location" = '' then
            exit;

        ProdOrderLine.SetRange(Status, Rec.Status);
        ProdOrderLine.SetRange("Prod. Order No.", Rec."No.");
        ProdOrderLine.ModifyAll("Location Code", Rec."Location Code", true);

        ProdOrderComp.SetRange("Prod. Order No.", Rec."No.");
        ProdOrderComp.SetRange(Status, Rec.Status);
        ProdOrderComp.ModifyAll("Location Code", ManuSetup."Reclass To Location", true);

        Clear(ProdOrderComp);
        ProdOrderComp.Reset();
        ProdOrderComp.SetRange("Prod. Order No.", Rec."No.");
        ProdOrderComp.SetRange(Status, Rec.Status);
        ProdOrderComp.ModifyAll("Bin Code", '', true);

        ReservEntry2.SetRange("Source ID", Rec."No.");
        ReservEntry2.SetFilter("Source Prod. Order Line", '<>%1', 0);
        ReservEntry2.SetFilter("Source Ref. No.", '<>%1', 0);
        ReservEntry2.SetRange("Reservation Status", ReservEntry2."Reservation Status"::Reservation);
        ReservEntry2.SetRange("Disallow Cancellation", false);
        if ReservEntry2.FindSet() then
            repeat
                ReservEntry3.Get(ReservEntry2."Entry No.", not ReservEntry2.Positive);
                ReservEngineMgt.CancelReservation(ReservEntry2);
                RecordsFound := true;
            until ReservEntry2.Next() = 0;

        // if RecordsFound then
        //     ReservationPage.UpdateReservFrom();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Prod. Order Status Management", OnAfterChangeStatusOnProdOrder, '', false, false)]
    local procedure "Prod. Order Status Management_OnAfterChangeStatusOnProdOrder"(var ProdOrder: Record "Production Order"; var ToProdOrder: Record "Production Order"; NewStatus: Enum "Production Order Status"; NewPostingDate: Date; NewUpdateUnitCost: Boolean; var SuppressCommit: Boolean)
    var
        ManuSetup: Record "Manufacturing Setup";
        ItemJnlBatch: Record "Item Journal Batch";
        ItemJnlTemplate: Record "Item Journal Template";
        ProdOrderComp: Record "Prod. Order Component";
        ItemJnlLine, LastItemJnlLine : Record "Item Journal Line";
        ItemJnlBatchPost: Codeunit "Item Jnl.-Post Batch";
        NoSeries: Codeunit "No. Series";
        WMSManagement: Codeunit "WMS Management";
    begin
        if NewStatus <> NewStatus::Released then
            exit;
        ManuSetup.Get();
        if (ManuSetup."Reclass To Location" = '') or (ManuSetup."Reclass From Location" = '')
            or (ManuSetup."Reclass Journal Template" = '') or (ManuSetup."Reclass Journal Batch" = '') then
            exit;
        ProdOrderComp.SetRange("Prod. Order No.", ProdOrder."No.");
        ProdOrderComp.SetRange(Status, ProdOrder.Status);
        if ProdOrderComp.FindSet() then Begin
            ItemJnlLine.SetRange("Journal Template Name", ManuSetup."Reclass Journal Template");
            ItemJnlLine.SetRange("Journal Batch Name", ManuSetup."Reclass Journal Batch");
            ItemJnlLine.DeleteAll(true);
            ItemJnlTemplate.Get(ManuSetup."Reclass Journal Template");
            ItemJnlBatch.Get(ManuSetup."Reclass Journal Template", ManuSetup."Reclass Journal Batch");
            LastItemJnlLine."Journal Template Name" := ManuSetup."Reclass Journal Template";
            LastItemJnlLine."Journal Batch Name" := ManuSetup."Reclass Journal Batch";
            if ItemJnlBatch."No. Series" <> '' then
                LastItemJnlLine."Document No." := NoSeries.PeekNextNo(ItemJnlBatch."No. Series", NewPostingDate);
            repeat
                ItemJnlLine.Init();
                ItemJnlLine."Journal Template Name" := ManuSetup."Reclass Journal Template";
                ItemJnlLine."Journal Batch Name" := ManuSetup."Reclass Journal Batch";
                ItemJnlLine."Line No." := LastItemJnlLine."Line No." + 10000;
                ItemJnlLine.Validate("Entry Type", ItemJnlLine."Entry Type"::Transfer);
                ItemJnlLine."Document No." := LastItemJnlLine."Document No.";
                ItemJnlLine."Source Code" := ItemJnlTemplate."Source Code";
                ItemJnlLine."Posting No. Series" := ItemJnlBatch."Posting No. Series";
                ItemJnlLine.validate("Posting Date", NewPostingDate);
                ItemJnlLine.Validate("Item No.", ProdOrderComp."Item No.");
                ItemJnlLine.Validate("Location Code", ManuSetup."Reclass From Location");
                ItemJnlLine.Validate("Variant Code", ProdOrderComp."Variant Code");
                ItemJnlLine.Validate("Bin Code", ProdOrderComp."Bin Code");
                ItemJnlLine.Validate("New Location Code", ManuSetup."Reclass To Location");
                ItemJnlLine.Validate(Quantity, ProdOrderComp."Expected Quantity");
                ItemJnlLine.Validate("Unit of Measure Code", ProdOrderComp."Unit of Measure Code");
                ItemJnlLine.Insert(true);
                LastItemJnlLine := ItemJnlLine;
            until ProdOrderComp.Next() = 0;
            ItemJnlBatchPost.Run(ItemJnlLine);
        End;
    end;

}