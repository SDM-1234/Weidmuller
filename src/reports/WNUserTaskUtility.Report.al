namespace WM.WeidmullerDEV;

using Microsoft.Foundation.Task;
    
report 50170 "WN User Task Utility"
{
    Caption = 'User Task Utility';
    ProcessingOnly = true;

    dataset
    {
        dataitem(DataItem1; "User Task")
        {
            RequestFilterFields = "Completed DateTime", "Assigned To", "Created By";

            trigger OnAfterGetRecord()
            begin
                DELETE();
            end;

            trigger OnPreDataItem()
            var
                Filters: Text;
            begin
                Filters := GETFILTERS;

                IF Filters = '' THEN BEGIN
                    MESSAGE(NoFilterMsg);
                    CurrReport.QUIT();
                END;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        NoFilterMsg: Label 'No user tasks were deleted. To specify the user tasks that must be deleted, set the relevant filters.';
}

