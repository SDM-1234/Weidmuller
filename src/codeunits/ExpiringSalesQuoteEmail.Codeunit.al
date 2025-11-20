namespace WM.WeidmullerDEV;

using Microsoft.Sales.Setup;
using System.Email;
using System.Utilities;
    
codeunit 50022 "Expiring Sales Quote Email"
{
    trigger OnRun()
    begin
        SalesSetup.Get();
        SalesSetup.TestField("Sales Quote Expiring - Emails");
        Recipients := SalesSetup."Sales Quote Expiring - Emails".Split(';');
        TempBlob.CreateOutStream(OutStream);
        MyReport.SaveAs(HtmlContent, ReportFormat::Html, OutStream); // Save report as HTML to OutStream

        TempBlob.CreateInStream(InStream);
        InStream.ReadText(HtmlContent);

        Body := HtmlContent; // Set the HTML content as the email body

        EmailMessage.Create(Recipients, Subject_Lbl, Body, true); // true for HTML body
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
        Subject_Lbl: TextConst ENU = 'List of Quotations expired next week';
        Body: Text;
}