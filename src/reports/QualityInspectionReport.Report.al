namespace WM.WeidmullerDEV;

using Microsoft.Foundation.Company;
using Microsoft.Inventory.Transfer;
    
report 50010 "Quality Inspection Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = Layout1;

    dataset
    {
        dataitem("Transfer Receipt Header"; "Transfer Receipt Header")
        {
            RequestFilterFields = "No.", "Quality Inspection No.";
            DataItemTableView = where("Quality Inspection No." = filter(<> ''));
            column(ReceiptNo; "No.")
            {
            }
            column(FromLocation; "Transfer-From Code")
            {
            }
            column(ToLocation; "Transfer-To Code")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(QuilityNo; "Quality Inspection No.")
            {
            }
            column(Pictire; CompanyInfo.Picture)
            {

            }
            dataitem("Transfer Receipt Line"; "Transfer Receipt Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.");
                column(ItemNo; "Item No.")
                {
                }
                column(Description; "Description")
                {
                }
                column(AcceptQty; AcceptQty)
                {
                }
                column(RejectedQty; RejectedQty)
                {
                }
                column(UOM; "Unit of Measure")
                {
                }
                column(ReasonStr; GetReasonString())
                {
                }
                trigger OnAfterGetRecord()
                var
                    DictQty: Decimal;
                begin
                    AcceptQty := 0;
                    RejectedQty := 0;
                    Clear(ReasonDict);
                    if "Inspection Reason Code" = '' then
                        AcceptQty := Quantity
                    Else begin
                        RejectedQty := Quantity;
                        if not ItemDict.Get("Transfer Receipt Header"."Quality Inspection No." + '-' + "Item No.", ReasonDict) Then begin
                            if ReasonDict.Get("Inspection Reason Code", DictQty) then
                                ReasonDict.Set("Inspection Reason Code", DictQty + RejectedQty)
                            Else
                                ReasonDict.Add("Inspection Reason Code", RejectedQty);
                            ItemDict.Add("Transfer Receipt Header"."Quality Inspection No." + '-' + "Item No.", ReasonDict)
                        end else begin
                            if ReasonDict.Get("Inspection Reason Code", DictQty) then
                                ReasonDict.Set("Inspection Reason Code", DictQty + RejectedQty)
                            Else
                                ReasonDict.Add("Inspection Reason Code", RejectedQty);
                            ItemDict.set("Transfer Receipt Header"."Quality Inspection No." + '-' + "Item No.", ReasonDict);
                        end;
                    end;
                end;
            }
        }
    }

    rendering
    {
        layout(Layout1)
        {
            Type = RDLC;
            LayoutFile = 'src/reportlayout/QtyInspection.rdl';
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        AcceptQty, RejectedQty : Decimal;
        ReasonDict, ReasonDict1 : Dictionary of [Text, Decimal];
        ItemDict: Dictionary of [Text, Dictionary of [Text, Decimal]];

    local procedure GetReasonString() ReasonStr: Text
    var
        dictionaryKey: Text;
    begin
        if ItemDict.Get("Transfer Receipt Header"."Quality Inspection No." + '-' + "Transfer Receipt Line"."Item No.", ReasonDict1) then begin
            if ReasonDict1.Count = 0 then
                exit('');
            foreach dictionaryKey in ReasonDict1.Keys() do
                ReasonStr := ReasonStr <> '' ? ReasonStr + ', ' + dictionaryKey + '-' + Format(ReasonDict1.Get(dictionaryKey), 0, 9)
                                : dictionaryKey + '-' + format(ReasonDict1.Get(dictionaryKey), 0, 9);
        end;
    end;
}