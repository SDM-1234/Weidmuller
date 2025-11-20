namespace WM.WeidmullerDEV;

using Microsoft.CRM.Team;
using System.Security.User;
    
tableextension 50058 UserSetup extends "User Setup"
{
    fields
    {
        field(50001; "Customer Primary Unblock"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'ZT0207';
        }
        field(50002; "Customer Secondary Unblock"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'ZT0207';
        }
        field(50003; "Update Pricing"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'ZT0207';
        }
        field(50004; "Team Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Team;
        }
    }
}

