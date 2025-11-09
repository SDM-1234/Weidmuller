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
            fileuploadaction(BulkEInvoiceResponse)
            {
                ApplicationArea = All;
                Caption = 'Upload Bulk Import E-Invoice Response';
                ToolTip = 'Upload Bulk Import E-Invoice Response';
                AllowMultipleFiles = true;
                AllowedFileExtensions = '.json';
                Image = Import;
                trigger OnAction(Files: List of [FileUpload])
                var
                    SalesInv: Record "Sales Invoice Header";
                    JSONManagement: Codeunit "JSON Management";
                    TempBlob: Codeunit "Temp Blob";
                    QRGenerator: Codeunit "QR Generator";
                    RecRef: RecordRef;
                    FieldRef: FieldRef;
                    JsonString: Text;
                    TempIRNTxt: Text;
                    TempDateTime: DateTime;
                    AcknowledgementDateTimeText: Text;
                    AcknowledgementDate: Date;
                    AcknowledgementTime: Time;
                    CurrentFile: FileUpload;
                    TempInStream: InStream;
                    IRNTxt: Label 'Irn', Locked = true;
                    AcknowledgementNoTxt: Label 'AckNo', Locked = true;
                    AcknowledgementDateTxt: Label 'AckDt', Locked = true;
                    IRNHashErr: Label 'No matched IRN Hash %1 found to update.', Comment = '%1 = IRN Hash';
                    SignedQRCodeTxt: Label 'SignedQRCode', Locked = true;
                begin
                    foreach CurrentFile in Files do begin
                        CurrentFile.CreateInStream(TempInStream, TEXTENCODING::UTF8);
                        Clear(RecRef);
                        TempInStream.ReadText(JsonString);
                        if (JsonString = '') or (JsonString = '[]') then
                            exit;

                        JSONManagement.InitializeObject(JsonString);
                        if JSONManagement.GetValue(IRNTxt) <> '' then begin
                            SalesInv.SetCurrentKey("IRN Hash");
                            SalesInv.SetRange("IRN Hash", JSONManagement.GetValue(IRNTxt));
                            if SalesInv.FindFirst() then begin
                                RecRef.GetTable(SalesInv);
                                FieldRef := RecRef.Field(SalesInv.FieldNo("IRN Hash"));
                                FieldRef.Value := JSONManagement.GetValue(IRNTxt);
                                FieldRef := RecRef.Field(SalesInv.FieldNo("Acknowledgement No."));
                                FieldRef.Value := JSONManagement.GetValue(AcknowledgementNoTxt);

                                AcknowledgementDateTimeText := JSONManagement.GetValue(AcknowledgementDateTxt);
                                Evaluate(AcknowledgementDate, CopyStr(AcknowledgementDateTimeText, 1, 10));
                                Evaluate(AcknowledgementTime, CopyStr(AcknowledgementDateTimeText, 11, 8));
                                TempDateTime := CreateDateTime(AcknowledgementDate, AcknowledgementTime);
                                FieldRef := RecRef.Field(SalesInv.FieldNo("Acknowledgement Date"));

                                FieldRef.Value := TempDateTime;
                                FieldRef := RecRef.Field(SalesInv.FieldNo(IsJSONImported));
                                FieldRef.Value := true;
                                QRGenerator.GenerateQRCodeImage(JSONManagement.GetValue(SignedQRCodeTxt), TempBlob);
                                FieldRef := RecRef.Field(SalesInv.FieldNo("QR Code"));
                                TempBlob.ToRecordRef(RecRef, SalesInv.FieldNo("QR Code"));
                                RecRef.Modify();
                            end;
                        end else
                            Error(IRNHashErr, TempIRNTxt);
                        RecRef.Close();
                    end;
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

