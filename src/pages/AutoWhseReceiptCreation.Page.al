namespace WM.WeidmullerDEV;

using Microsoft.Inventory.Item;
using Microsoft.Purchases.Document;
using Microsoft.Warehouse.Document;

page 50170 "Auto Whse. Receipt Creation"
{
    ApplicationArea = All;
    Caption = 'Auto Warehouse Receipt Creation';
    PageType = List;
    SourceTable = "Whse. Receipt Excel Import";
    UsageCategory = Tasks;
    DelayedInsert = true;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the purchase order for the receipt line.';
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vendor invoice number to store as the vendor shipment number.';
                }
                field("BOE No."; Rec."BOE No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Bill of Entry number for the receipt.';
                }
                field("BOE Date"; Rec."BOE Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Bill of Entry date for the receipt.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the item to receive.';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the purchase order item description.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the unit of measure for the receipt quantity.';
                }
                field("Qty. to Receive"; Rec."Qty. to Receive")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity to receive for the item.';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bin to use for the warehouse receipt.';
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the outstanding quantity on the purchase order line.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the imported line passed validation.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies why the imported line did not pass validation.';
                }
                field("Warehouse Receipt No."; Rec."Warehouse Receipt No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the warehouse receipt created for the imported line.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportExcel)
            {
                ApplicationArea = All;
                Caption = 'Upload Excel';
                Image = Import;
                ToolTip = 'Uploads the warehouse receipt Excel workbook and adds its purchase order lines.';

                trigger OnAction()
                var
                    ImportManagement: Codeunit "Whse. Receipt Import Mgt.";
                begin
                    ImportManagement.ImportExcel();
                    CurrPage.Update(false);
                end;
            }
            action(ViewPurchaseOrder)
            {
                ApplicationArea = All;
                Caption = 'View PO';
                Image = View;
                ToolTip = 'Opens the purchase order for the selected imported line.';

                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                begin
                    PurchaseHeader.Get(PurchaseHeader."Document Type"::Order, Rec."Purchase Order No.");
                    Page.Run(Page::"Purchase Order", PurchaseHeader);
                end;
            }
            action(ValidateLines)
            {
                ApplicationArea = All;
                Caption = 'Validate';
                Image = Check;
                ToolTip = 'Validates the imported lines against purchase orders, outstanding quantities, and bins.';

                trigger OnAction()
                var
                    ImportManagement: Codeunit "Whse. Receipt Import Mgt.";
                begin
                    ImportManagement.ValidateLines();
                    CurrPage.Update(false);
                end;
            }
            action(ProcessLines)
            {
                ApplicationArea = All;
                Caption = 'Process';
                Image = Process;
                ToolTip = 'Creates warehouse receipts for the validated purchase orders and sends them for approval.';

                trigger OnAction()
                var
                    ImportManagement: Codeunit "Whse. Receipt Import Mgt.";
                begin
                    ImportManagement.ProcessLines();
                    CurrPage.Update(false);
                end;
            }
            action(DeleteLines)
            {
                ApplicationArea = All;
                Caption = 'Delete';
                Image = Delete;
                ToolTip = 'Deletes the selected imported lines.';

                trigger OnAction()
                var
                    ImportLine: Record "Whse. Receipt Excel Import";
                begin
                    CurrPage.SetSelectionFilter(ImportLine);
                    if ImportLine.FindSet() then
                        repeat
                            if ImportLine.Processed then
                                Error(CannotDeleteProcessedErr);
                            ImportLine.Delete(true);
                        until ImportLine.Next() = 0;
                    CurrPage.Update(false);
                end;
            }
        }
        area(Promoted)
        {
            actionref(ImportExcel_Promoted; ImportExcel)
            {
            }
            actionref(ValidateLines_Promoted; ValidateLines)
            {
            }
            actionref(ProcessLines_Promoted; ProcessLines)
            {
            }
            actionref(ViewPurchaseOrder_Promoted; ViewPurchaseOrder)
            {
            }

actionref(DeleteLines_Promoted; DeleteLines)
            {
            }



        }
    }

    var
        CannotDeleteProcessedErr: Label 'Processed lines cannot be deleted because they are used to update purchase invoices.';
}
