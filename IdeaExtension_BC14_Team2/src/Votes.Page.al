page 50130 "Voting List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Evidence Voting Table";
    CardPageId = 50121;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Idea No."; "Idea No.1")
                {
                    ApplicationArea = All;

                }
                field("User"; "User")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}