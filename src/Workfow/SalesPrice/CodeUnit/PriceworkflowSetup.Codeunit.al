namespace WM.WeidmullerDEV;

using Microsoft.Pricing.PriceList;
using System.Automation;
    
codeunit 50152 "Price workflow Setup"
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
        workflowsetup.InsertTableRelation(Database::"Price List Header", 0, DATABASE::"Approval Entry", approvalEntry.FieldNo("Record ID to Approve"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnInsertWorkflowTemplates', '', true, true)]
    local procedure OnInsertWorkflowTemplates()
    begin
        InsertPriceTemplate()
    end;

    procedure InsertPriceTemplate()
    var
        workflow: record Workflow;
    begin
        workflowsetup.InsertWorkflowTemplate(workflow, WorkflowTemplateCodeLbl, WorkflowTemplateDescLbl, workflowCategoryCodeLbl);
        InsertPriceApprovalWorkFlowDetails(workflow);

        workflowsetup.MarkWorkflowAsTemplate(workflow);
    end;

    procedure InsertPriceApprovalWorkFlowDetails(var workflow: record Workflow)
    var
        PriceHeader: record "Price List Header";
        WorkflowStepArgument: Record "Workflow Step Argument";
        workflowEventHandling: Codeunit "Price Workflow Evt Handling";
        BlankDateFormula: DateFormula;

    begin
        workflowsetup.InitWorkflowStepArgument(WorkflowStepArgument, WorkflowStepArgument."Approver Type"::Approver, WorkflowStepArgument."Approver Limit Type"::"Direct Approver", 0, '', BlankDateFormula, true);


        workflowsetup.InsertDocApprovalWorkflowSteps(workflow, BuildPriceTypeConditions(PriceHeader.Status::Draft), workflowEventHandling.RunWorkflowOnSendPriceForApprovalCode(),
        BuildPriceTypeConditions(PriceHeader.Status::"Pending Approval"), workflowEventHandling.RunWorkflowOnCancelPriceForApprovalCode(), WorkflowStepArgument, true);
    end;

    local procedure BuildPriceTypeConditions(Status: Enum "Price Status"): Text

    var
        PriceHeader: record "Price List Header";
    begin
        PriceHeader.SetRange(Status, Status);
        exit(StrSubstNo(WorkFlowCondLbl, workflowsetup.Encode((PriceHeader.GetView(false)))));
    end;


    var
        approvalEntry: Record "Approval Entry";
        workflowsetup: Codeunit "Workflow Setup";
        WorkflowTemplateCodeLbl: TextConst ENU = 'PriceWF';
        WorkflowTemplateDescLbl: TextConst ENU = 'Price Workflow Template';
        workflowCategoryCodeLbl: TextConst ENU = 'Weidmuller';
        workflowCategoryDescLbl: TextConst ENU = 'Weidmuller Workflow Category';
        WorkFlowCondLbl: label '<?xml version="1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="Price Header">%1</DataItem></DataItems></ReportParameters>', Locked = true;

}