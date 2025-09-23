reportextension 50000 PurchaseCreditMemo extends "Purchase - Credit Memo"
{
    dataset
    {
        add("Purch. Cr. Memo Hdr.")
        {
            column(ComPic; CompanyInfo.Picture)
            {
            }
        }
        add(CopyLoop)
        {
            column(YourRef_PurchCrMemoHdrWE; "Purch. Cr. Memo Hdr."."Vendor Cr. Memo No.")
            {
            }
            column(CompCountryName; CompCountry.GetNameInCurrentLanguage())
            {
            }
            column(VendCountryName; VendCountry.GetNameInCurrentLanguage())
            {
            }
            column(NoofBoxes; "Purch. Cr. Memo Hdr."."No. of Boxes")
            {
            }
            column(BoxDimension; "Purch. Cr. Memo Hdr."."Box Dimension")
            {
            }
            column(GrossWeight; "Purch. Cr. Memo Hdr."."Gross Weight")
            {
            }
            column(NetWeight; "Purch. Cr. Memo Hdr."."Net Weight")
            {
            }
            column(CurrencyCode; "Purch. Cr. Memo Hdr."."Currency Code")
            {
            }
            column(AmtInWords; AmtInWords[1])
            {
            }
            column(ContactName; "Purch. Cr. Memo Hdr."."Proforma Contact Name")
            {
            }
        }
        modify("Purch. Cr. Memo Hdr.")
        {
            trigger OnAfterAfterGetRecord()
            begin
                if CompCountry.Get(CompanyInfo."Country/Region Code") then;
                if VendCountry.get("Buy-from Country/Region Code") then;
                CompanyInfo.CalcFields(Picture);
                AmtInWordsCU.InitTextVariable();
                CalcFields("Amount Including VAT");
                AmtInWordsCU.FormatNoText(AmtInWords, "Amount Including VAT", "Currency Code");
            end;
        }
    }

    requestpage
    {
        // Add changes to the requestpage here
    }

    rendering
    {
        layout(ExportInvoice)
        {
            Type = RDLC;
            LayoutFile = 'src/reportlayout/ExportInvoice.rdl';
        }
    }
    var
        CompCountry, VendCountry : Record "Country/Region";
        AmtInWordsCU: Codeunit AmountToWords;
        AmtInWords: array[2] of Text[80];
}