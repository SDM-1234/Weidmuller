codeunit 50019 "Phys Invt Jnl workflow Setup"
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
        workflowsetup.InsertTableRelation(Database::"Item Journal Line", 0, DATABASE::"Approval Entry", approvalEntry.FieldNo("Record ID to Approve"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
    local procedure OnInsertWorkflowTemplates()
    begin
        InsertPhysInvtTemplate()
    end;

    local procedure InsertPhysInvtTemplate()
    var
        workflow: record Workflow;
    begin
        workflowsetup.InsertWorkflowTemplate(workflow, WorkflowTemplateCodeLbl, WorkflowTemplateDescLbl, workflowCategoryCodeLbl);
        InsertPhysInvtOrderApprovalWorkFlowDetails(workflow);
        workflowsetup.MarkWorkflowAsTemplate(workflow);
    end;

    procedure InsertPhysInvtOrderApprovalWorkFlowDetails(var workflow: record Workflow)
    var
        WorkflowStepArgument: Record "Workflow Step Argument";
        workflowEventHandling: Codeunit "PhysInvt Workflow Evt Handling";
        BlankDateFormula: DateFormula;

    begin
        workflowsetup.InitWorkflowStepArgument(WorkflowStepArgument, WorkflowStepArgument."Approver Type"::Approver, WorkflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);


        workflowsetup.InsertDocApprovalWorkflowSteps(workflow, BuildPhysInvtTypeConditions(), workflowEventHandling.RunWorkflowOnSendPhysInvtForApprovalCode(),
        BuildPhysInvtTypeConditions(), workflowEventHandling.RunWorkflowOnCancelPhysInvtForApprovalCode(), WorkflowStepArgument, true);
    end;

    local procedure BuildPhysInvtTypeConditions(): Text
    var
        ItemJnl: record "Item Journal Line";
    begin
        ItemJnl.SetRange("Journal Template Name");
        ItemJnl.SetRange("Journal Batch Name");
        exit(StrSubstNo(WorkFlowCondLbl, workflowsetup.Encode((ItemJnl.GetView(false)))));
    end;


    var
        approvalEntry: Record "Approval Entry";
        workflowsetup: Codeunit "Workflow Setup";
        WorkflowTemplateCodeLbl: TextConst ENU = 'PhysInvtWF';
        WorkflowTemplateDescLbl: TextConst ENU = 'Physical Inventory Journal Workflow';
        workflowCategoryCodeLbl: TextConst ENU = 'Weidmuller';
        workflowCategoryDescLbl: TextConst ENU = 'Weidmuller Workflow Category';
        WorkFlowCondLbl: label '<?xml version="1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="Item Journal Line">%1</DataItem></DataItems></ReportParameters>', Locked = true;

}