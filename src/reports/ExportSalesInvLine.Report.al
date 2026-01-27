report 50032 "Export Sales Inv. Line"
{
    UsageCategory = Tasks;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Export Sales Invoice Lines';

    dataset
    {
        dataitem(DataItemName; "Sales Line")
        {
            DataItemTableView = SORTING("Document No.", "Line No.") WHERE("Document Type" = CONST(Order), Type = CONST(Item));
            trigger OnPreDataItem()
            begin
                setfilter("Requested Delivery Date", '>=%1', CalcDate('<-CM-1M>', Today()));
                FileName := 'C082_' + Format(Today, 0, '<Year4><Month,2><Day,2>') + '.txt';
                TabSeparator := 9; // ASCII value for a tab
            end;

            trigger OnAfterGetRecord()
            var
                SalesHeader: Record "Sales Header";
                TypeHelper: Codeunit "Type Helper";
            begin
                SalesHeader.Get("Document Type", "Document No.");
                TxtBuilder.Append('082');
                TxtBuilder.Append(Format(TabSeparator));
                TxtBuilder.Append(Format(SalesHeader."Order Date", 0, '<Year4><Month,2><Day,2>'));
                TxtBuilder.Append(Format(TabSeparator));
                TxtBuilder.Append(Format("Requested Delivery Date", 0, '<Year4><Month,2><Day,2>'));
                TxtBuilder.Append(Format(TabSeparator));
                TxtBuilder.Append("Document No.");
                TxtBuilder.Append(Format(TabSeparator));
                TxtBuilder.Append(Format("Line No.", 0, 9));
                TxtBuilder.Append(Format(TabSeparator));
                TxtBuilder.Append("No.");
                TxtBuilder.Append(Format(TabSeparator));
                TxtBuilder.Append(TypeHelper.FormatDecimal(Round(Quantity, 1, '='), '', ''));
                TxtBuilder.Append(Format(TabSeparator));
                TxtBuilder.Append(TypeHelper.FormatDecimal(Round(Amount, 1, '='), '', 'de-DE'));
                TxtBuilder.Append(Format(TabSeparator));
                TxtBuilder.Append(SalesHeader."Currency Code");
                TxtBuilder.Append(Format(TabSeparator));
                TxtBuilder.Append(SalesHeader."Bill-to Customer No.");
                TxtBuilder.Append(Format(TabSeparator));
                TxtBuilder.Append(SalesHeader."Bill-to Name");
                TxtBuilder.AppendLine();
            end;

            trigger OnPostDataItem()
            begin
                TempBlob.CreateOutStream(OutS);
                OutS.WriteText(TxtBuilder.ToText());
                TempBlob.CreateInStream(InS);
                DownloadFromStream(InS, '', '', '', FileName);
            end;
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
    }
    var
        TempBlob: Codeunit "Temp Blob";
        InS: InStream;
        OutS: OutStream;
        FileName: Text;
        TxtBuilder: TextBuilder;
        TabSeparator: Char;
}