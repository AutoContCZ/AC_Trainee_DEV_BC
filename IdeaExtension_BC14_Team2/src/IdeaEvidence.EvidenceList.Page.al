page 50120 "Ideas Evidence"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Idea Evidence Header";
    Editable = false;
    CardPageId = 50121;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;

                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                }
                field("Submitter"; "Submitter")
                {
                    ApplicationArea = All;
                }
                field("Date and Time"; "Date and Time")
                {
                    ApplicationArea = All;
                }
                field("State"; "State")
                {
                    ApplicationArea = All;
                }
                field("Number of Votes"; "Number of Votes") { }
            }
        }
    }
}
