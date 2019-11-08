report 50140 "Application Ideas Report"
{
    Caption = 'Application Ideas Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/ApplicationIdeasReport.Report.rdl';

    dataset
    {
        dataitem(IdeasHeader; "Main Ideas Table")
        {
            column(Name; "Name")
            {

            }
            column(No; "No.")
            {

            }
            column(Date_of_submission; "Date of submission")
            {

            }
            column(Submitter; "Submitter")
            {

            }
            column(Status; "Status")
            {

            }
            column(Total_votes; "Total votes")
            {

            }
        }
    }
}