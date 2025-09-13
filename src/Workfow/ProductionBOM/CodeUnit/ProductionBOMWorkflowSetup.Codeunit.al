codeunit 50154 "Production BOM Workflow Setup"
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
        workflowsetup.InsertTableRelation(Database::"Production Bom Header", 0, DATABASE::"Approval Entry", approvalEntry.FieldNo("Record ID to Approve"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
    local procedure OnInsertWorkflowTemplates()
    begin
        InsertProdBOMTemplate()
    end;

    procedure InsertProdBOMTemplate()
    var
        workflow: record Workflow;
    begin
        workflowsetup.InsertWorkflowTemplate(workflow, WorkflowTemplateCodeLbl, WorkflowTemplateDescLbl, workflowCategoryCodeLbl);
        InsertProdBOMApprovalWorkFlowDetails(workflow);
        workflowsetup.MarkWorkflowAsTemplate(workflow);
    end;

    procedure InsertProdBOMApprovalWorkFlowDetails(var workflow: record Workflow)
    var
        ProductionBomHeader: record "Production Bom Header";
        WorkflowStepArgument: Record "Workflow Step Argument";
        workflowEventHandling: Codeunit "ProdBOM Workflow Evt Handling";
        BlankDateFormula: DateFormula;

    begin
        workflowsetup.InitWorkflowStepArgument(WorkflowStepArgument, WorkflowStepArgument."Approver Type"::Approver, WorkflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);
        workflowsetup.InsertDocApprovalWorkflowSteps(workflow, BuildTransferTypeConditions(ProductionBomHeader.Status::"Under Development"), workflowEventHandling.RunWorkflowOnSendPRODBOMForApprovalCode(),
        BuildTransferTypeConditions(ProductionBomHeader.Status::"Pending Approval"), workflowEventHandling.RunWorkflowOnCancelPRODBOMForApprovalCode(), WorkflowStepArgument, true);
    end;

    local procedure BuildTransferTypeConditions(Status: Enum "Approval Status"): Text
    var
        ProductionBomHeader: record "Production Bom Header";
    begin
        ProductionBomHeader.SetRange(Status, Status);
        exit(StrSubstNo(WorkFlowCondLbl, workflowsetup.Encode((ProductionBomHeader.GetView(false)))));
    end;


    var
        approvalEntry: Record "Approval Entry";
        workflowsetup: Codeunit "Workflow Setup";
        WorkflowTemplateCodeLbl: TextConst ENU = 'ProductionBomWF';
        WorkflowTemplateDescLbl: TextConst ENU = 'Production BOM Workflow';
        workflowCategoryCodeLbl: TextConst ENU = 'Weidmuller';
        workflowCategoryDescLbl: TextConst ENU = 'Weidmuller Workflow Category';
        WorkFlowCondLbl: label '<?xml version="1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="Production BOM Header">%1</DataItem></DataItems></ReportParameters>', Locked = true;

}