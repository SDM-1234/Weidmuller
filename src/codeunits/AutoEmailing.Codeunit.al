codeunit 50002 "Auto Emailing"
{
    trigger OnRun()
    begin
        DunningEmail();
    end;

    var
        Email: Codeunit Email;
        SMTPMail: Codeunit "Email Message";

    local procedure DunningEmail()
    var
        DE_CLE: Record "Cust. Ledger Entry";
        DE_Customer, DE_Cust : Record Customer;
        GenLedgerSetup: Record "General Ledger Setup";
        Base64: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        DE_CustDunning: Report "Customer-wise Dunning";
        ReportInStream: InStream;
        ReportOutStream: OutStream;
        EmailRecipientType: Enum "Email Recipient Type";
        DE_CustEmail: Text;
        DE_EmailBody: Text;
    begin
        GenLedgerSetup.Get();

        IF (DATE2DMY(TODAY, 1) = 1) OR (DATE2DMY(TODAY, 1) = 15) OR (Today = GenLedgerSetup."Dunning Letter Date") THEN BEGIN

            CLEAR(DE_CustEmail);
            CLEAR(DE_EmailBody);
            DE_Customer.RESET();
            DE_Customer.CHANGECOMPANY('GO_LIVE');
            DE_Customer.SETFILTER("E-Mail", '<>%1', '');
            DE_Customer.CALCFIELDS(Balance);
            DE_Customer.SETFILTER(Balance, '>10');
            IF DE_Customer.FINDSET() THEN
                REPEAT
                    DE_CustEmail := DE_Customer."E-Mail";
                    DE_CLE.RESET();
                    DE_CLE.CHANGECOMPANY('GO_LIVE');
                    DE_CLE.SETFILTER(DE_CLE."Customer No.", DE_Customer."No.");
                    DE_CLE.SETRANGE(DE_CLE.Open, TRUE);
                    DE_CLE.SETFILTER(DE_CLE."Due Date", '<%1', TODAY);
                    IF DE_CLE.FINDSET() THEN BEGIN
                        Clear(SMTPMail);
                        Clear(Email);
                        DE_CLE.CALCFIELDS("Remaining Amount");
                        IF (DE_CLE."Remaining Amount" > 10) OR (DE_CLE."Remaining Amount" < -10) THEN BEGIN
                            DE_Cust.RESET();
                            DE_Cust.CHANGECOMPANY('GO_LIVE');
                            DE_Cust.SETFILTER("No.", DE_Customer."No.");
                            DE_CustDunning.SETTABLEVIEW(DE_Cust);
                            DE_CustDunning.USEREQUESTPAGE := FALSE;
                            CLEAR(DE_CustDunning);
                            TempBlob.CreateOutStream(ReportOutStream);
                            IF DE_CustDunning.SaveAs('', ReportFormat::Pdf, ReportOutStream) THEN BEGIN
                                TempBlob.CreateInStream(ReportInStream);
                                SMTPMail.SetRecipients(EmailRecipientType::"To", DE_CustEmail);
                                SMTPMail.SetRecipients(EmailRecipientType::Cc, 'hitesh.poonacha@weidmueller.com');
                                SMTPMail.SetSubject('Dunning Report' + DE_Customer."No.");
                                SMTPMail.AddAttachment('Customer-wise Dunning', DE_Customer."No." + '.pdf', Base64.ToBase64(ReportInStream));
                                SMTPMail.AppendToBody('Dear Sir/Madam');
                                SMTPMail.AppendToBody('<br><br>');
                                SMTPMail.AppendToBody('<HR>');
                                DE_EmailBody := 'Please find attachment.';
                                SMTPMail.AppendToBody(DE_EmailBody);
                                SMTPMail.AppendToBody('<br><br>');
                                SMTPMail.AppendToBody('This is computer generated Document.');
                                SMTPMail.AppendToBody('<br><br>');
                                SMTPMail.AppendToBody('<HR>');
                                SMTPMail.AppendToBody('Regards,');
                                SMTPMail.AppendToBody('<br><br>');
                                SMTPMail.AppendToBody('Team Weidmuller');
                                SMTPMail.AppendToBody('<HR>');
                                Email.Send(SMTPMail);
                            END;
                        END;
                    END;
                UNTIL DE_Customer.NEXT() = 0;
        END;
    end;
}

