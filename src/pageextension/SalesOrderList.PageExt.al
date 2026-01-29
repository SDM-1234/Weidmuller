namespace WM.WeidmullerDEV;

using Microsoft.Sales.Document;
using System.IO;
using System.Automation;

pageextension 50109 SalesOrderList extends "Sales Order List"
{
    layout
    {

        addafter("Salesperson Code")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the date when the order was created.';
            }
            field(Validity; Rec.Validity)
            {
                Editable = false;
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Validity field.';
            }
        }
    }
    actions
    {
        addafter("Delete Invoiced")
        {
            fileuploadaction("Upload Shipment Dates")
            {
                Caption = 'Upload Shipment Dates';
                Image = Import;
                ToolTip = 'Executes the Upload Shipment Dates action.';
                ApplicationArea = All;
                AllowMultipleFiles = true;
                AllowedFileExtensions = '.xlsx';

                trigger OnAction(Files: List of [FileUpload])
                var
                    SalesLine: Record "Sales Line";
                    CurrentFile: FileUpload;
                    IStream: InStream;
                    SheetName: Text;
                    RowNo, LineNo, MaxRowNo : Integer;
                begin
                    foreach CurrentFile in Files do begin
                        CurrentFile.CreateInStream(IStream);
                        SheetName := TempExcelBuffer.SelectSheetsNameStream(IStream);
                        TempExcelBuffer.Reset();
                        TempExcelBuffer.DeleteAll();
                        TempExcelBuffer.OpenBookStream(IStream, SheetName);
                        TempExcelBuffer.ReadSheet();

                        RowNo := 0;
                        MaxRowNo := 0;
                        LineNo := 0;

                        TempExcelBuffer.Reset();
                        if TempExcelBuffer.FindLast() then
                            MaxRowNo := TempExcelBuffer."Row No.";

                        for RowNo := 2 to MaxRowNo do begin
                            Evaluate(LineNo, GetValueAtCell(RowNo, 2));
                            if SalesLine.get(1, GetValueAtCell(RowNo, 1), LineNo) then begin
                                Evaluate(SalesLine."Shipment Date", GetValueAtCell(RowNo, 4));
                                SalesLine.Validate("Shipment Date Updated", true);
                                SalesLine.Modify();
                            End;
                        end;
                        TempExcelBuffer.DeleteAll();
                        Message(ExcelImportSucess_Msg);
                    End;
                end;
            }
        }
        modify(SendApprovalRequest)
        {
            Visible = false;
        }

        addafter(SendApprovalRequest)
        {
            action(SendApprovalRequest_Multi)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                ToolTip = 'Request approval of the document.';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    CurrPage.SETSELECTIONFILTER(SalesHeader);
                    if SalesHeader.FindSet() then
                        repeat
                            if ApprovalsMgmt.CheckSalesApprovalPossible(SalesHeader) then
                                ApprovalsMgmt.OnSendSalesDocForApproval(SalesHeader);
                            Commit();
                        until SalesHeader.Next() = 0;
                end;
            }
        }
        addafter(PostedSalesInvoices_Promoted)
        {
            actionref(Upload_ShipmentDates; "Upload Shipment Dates")
            {
            }
        }
    }
    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        ExcelImportSucess_Msg: Label 'Excel Imported Successfully.';

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin

        TempExcelBuffer.Reset();
        If TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    End;
}

