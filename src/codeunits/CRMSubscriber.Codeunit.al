namespace WM.WeidmullerDEV;

using Microsoft.CRM.Task;
    
codeunit 50008 "CRM Subscriber"
{
    [EventSubscriber(ObjectType::Table, Database::"To-Do", 'OnBeforeValidateType', '', false, false)]
    local procedure ToDoBeforeValidateType(var Task: Record "To-do"; xTask: Record "To-do"; var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;
}
