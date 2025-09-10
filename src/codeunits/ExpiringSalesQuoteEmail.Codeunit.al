codeunit 50022 "Expiring Sales Quote Email"
{
    trigger OnRun()
    begin
        SalesSetup.Get();
        SalesSetup.TestField("Sales Quote Expiring - Emails");
        Recipients.Add(SalesSetup."Sales Quote Expiring - Emails");
        TempBlob.CreateOutStream(OutStream);
        MyReport.SaveAs(HtmlContent, ReportFormat::Html, OutStream); // Save report as HTML to OutStream

        TempBlob.CreateInStream(InStream);
        InStream.ReadText(HtmlContent);

        Body := HtmlContent; // Set the HTML content as the email body

        EmailMessage.Create(Recipients, Subject, Body, true); // true for HTML body
        Email.Send(EmailMessage);

    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        MyReport: Report "Expiring Sales Quote Email";
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        Email: Codeunit Email;
        OutStream: OutStream;
        InStream: InStream;
        HtmlContent: Text;
        Recipients: List of [Text];
        Subject: Text;
        Body: Text;
}