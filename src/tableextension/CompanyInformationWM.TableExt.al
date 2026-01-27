namespace WM.WeidmullerDEV;

using Microsoft.Foundation.Company;

tableextension 50053 CompanyInformationWM extends "Company Information"
{
    fields
    {

        field(50001; "Home Page 2"; Text[80])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(50002; CIN; Code[30])
        {
        }
        field(50003; "IFSC Code"; Code[11])
        {
        }
        field(50004; "Terms Picture"; Blob)
        {
            Caption = 'Picture';
            Subtype = Bitmap;
        }
        field(50005; "LUT No."; Code[30])
        {
        }
        field(50006; "Digital Signature"; BLOB)
        {
            Caption = 'Digital Signature';
            DataClassification = ToBeClassified;
            Description = 'SE-E969';
            SubType = Bitmap;
        }
        field(50007; "Report Draft Picture"; Blob)
        {
            DataClassification = ToBeClassified;
            ToolTip = 'Specifies the picture to be printed on draft reports.';
            Caption = 'Draft Picture';
            Subtype = Bitmap;
        }
    }
}

