namespace WM.WeidmullerDEV;

using Microsoft.CRM.Contact;
using Microsoft.CRM.Task;
    
tableextension 50038 Todo extends "To-do"
{

    fields
    {
        modify("Contact No.")
        {
            trigger OnAfterValidate()
            var
                Cont: Record Contact;
            begin
                if Cont.Get("Contact No.") then
                    if "Salesperson Code" = '' then
                        "Salesperson Code" := Cont."Salesperson Code";
            end;
        }
    }
}

