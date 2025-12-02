namespace WM.WeidmullerDEV;

using Microsoft.QRGeneration;
using Microsoft.Sales.History;
using System.Reflection;
using System.IO;
using System.Text;
using System.Utilities;

pageextension 50012 PostedSalesInvoices extends "Posted Sales Invoices"
{
    layout
    {
        addafter(Amount)
        {
            field("Amount(LCY)"; AmountLCY)
            {
                Caption = 'Amount(LCY)';
                ToolTip = 'Specifies the value of the Amount(LCY) field.';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(Statistics)
        {
            Action(BulkEInvoiceResponse)
            {
                ApplicationArea = All;
                Caption = 'Upload Bulk Import E-Invoice Response';
                ToolTip = 'Upload Bulk Import E-Invoice Response';
                Image = Import;
                trigger OnAction()
                var
                    EInvoiceExcelImport: Codeunit "E-Invoice Excel Import";
                begin
                    EInvoiceExcelImport.ImportExcel();
                    CurrPage.Update();
                end;
            }
        }
        addlast(Category_Category4)
        {
            actionref(BulkAttachment_Promoted; BulkEInvoiceResponse)
            {
            }
        }
        addafter(IncomingDoc)
        {
            action("Print Invoice")
            {
                Caption = 'Print Invoice';
                Image = Print;
                ToolTip = 'Executes the Print Invoice action.';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //ZE_LIJO 25.06.2019
                    //<<
                    CurrPage.SETSELECTIONFILTER(Rec);
                    SaInvHdr.RESET();
                    SaInvHdr.COPY(Rec);
                    CLEAR(Rec);
                    REPORT.RUN(50015, TRUE, FALSE, SaInvHdr);
                    //>>
                end;
            }
            action("Print Invoice Certificate")
            {
                Caption = 'Print Invoice Certificate';
                Image = Print;
                ToolTip = 'Executes the Print Invoice Certificate action.';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //ZE_LIJO 05.08.2019
                    //<<
                    CurrPage.SETSELECTIONFILTER(Rec);
                    SaInvHdr.RESET();
                    SaInvHdr.COPY(Rec);
                    CLEAR(Rec);
                    REPORT.RUN(50023, TRUE, FALSE, SaInvHdr);
                    //>>
                end;
            }
        }
    }

    var
        SaInvHdr: Record "Sales Invoice Header";
        AmountLCY: Decimal;
}

