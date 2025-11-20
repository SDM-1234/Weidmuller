namespace WM.WeidmullerDEV;

using Microsoft.CRM.Task;
    
pageextension 50036 TaskList extends "Task List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    begin
        rec.FilterGroup(2);
        rec.SetRange("System To-do Type", rec."System To-do Type"::"Contact Attendee");
        rec.FilterGroup(0);
    end;
}