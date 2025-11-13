codeunit 50161 "WhseRecpt workflow Setup"
{
    trigger OnRun()
    begin

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', true, true)]
    local procedure OnAddWorkflowCategoriesToLibrary()
    begin
        workflowsetup.InsertWorkflowCategory(workflowCategoryCodeLbl, workflowCategoryDescLbl);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAfterInsertApprovalsTableRelations', '', false, false)]
    local procedure OnAfterInsertApprovalsTableRelations()
    begin
        workflowsetup.InsertTableRelation(Database::"Warehouse Receipt Header", 0, DATABASE::"Approval Entry", approvalEntry.FieldNo("Record ID to Approve"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
    local procedure OnInsertWorkflowTemplates()
    begin
        InsertWhseRecptTemplate()
    end;

    local procedure InsertWhseRecptTemplate()
    var
        workflow: record Workflow;
    begin
        workflowsetup.InsertWorkflowTemplate(workflow, WorkflowTemplateCodeLbl, WorkflowTemplateDescLbl, workflowCategoryCodeLbl);
        InsertWhseRecptOrderApprovalWorkFlowDetails(workflow);
        workflowsetup.MarkWorkflowAsTemplate(workflow);
    end;

    procedure InsertWhseRecptOrderApprovalWorkFlowDetails(var workflow: record Workflow)
    var
        WorkflowStepArgument: Record "Workflow Step Argument";
        workflowEventHandling: Codeunit "WhseRecpt WF Evt Handling";
        BlankDateFormula: DateFormula;

    begin
        workflowsetup.InitWorkflowStepArgument(WorkflowStepArgument, WorkflowStepArgument."Approver Type"::Approver, WorkflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);


        workflowsetup.InsertDocApprovalWorkflowSteps(workflow, BuildWhseRecptTypeConditions(), workflowEventHandling.RunWorkflowOnSendWhseReceiptForApprovalCode(),
        BuildWhseRecptTypeConditions(), workflowEventHandling.RunWorkflowOnCancelWhseReceiptForApprovalCode(), WorkflowStepArgument, true);
    end;

    local procedure BuildWhseRecptTypeConditions(): Text
    var
        WhseReceipt: record "Warehouse Receipt Header";
    begin
        exit(StrSubstNo(WorkFlowCondLbl, workflowsetup.Encode((WhseReceipt.GetView(false)))));
    end;


    var
        approvalEntry: Record "Approval Entry";
        workflowsetup: Codeunit "Workflow Setup";
        WorkflowTemplateCodeLbl: TextConst ENU = 'WhseRecptWF';
        WorkflowTemplateDescLbl: TextConst ENU = 'Warehouse Receipt Workflow';
        workflowCategoryCodeLbl: TextConst ENU = 'Weidmuller';
        workflowCategoryDescLbl: TextConst ENU = 'Weidmuller Workflow Category';
        WorkFlowCondLbl: label '<?xml version="1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="Warehouse Receipt Header">%1</DataItem></DataItems></ReportParameters>', Locked = true;

}