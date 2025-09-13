codeunit 50011 "Transfer Subscriber"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Attachment Mgmt", OnAfterGetRefTable, '', false, false)]
    local procedure "Document Attachment Mgmt_OnAfterGetRefTable"(var RecRef: RecordRef; DocumentAttachment: Record "Document Attachment")
    var
        TransferHeader: Record "Transfer Header";
    begin
        case DocumentAttachment."Table ID" of
            Database::"Transfer Header":
                begin
                    RecRef.Open(Database::"Transfer Header");
                    if TransferHeader.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(TransferHeader);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Attachment Mgmt", OnAfterTableHasNumberFieldPrimaryKey, '', false, false)]
    local procedure "Document Attachment Mgmt_OnAfterTableHasNumberFieldPrimaryKey"(TableNo: Integer; var Result: Boolean; var FieldNo: Integer)
    begin
        case TableNo of
            Database::"Transfer Header":
                begin
                    FieldNo := 1;
                    Result := true;
                end;
        end;
    end;


}
