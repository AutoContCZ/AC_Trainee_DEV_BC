page 50145 "Application Ideas Vote Records"
{
    /*
    The page also has no UsageCategory (is not searchable) as it is not wanted for the data to be viewable by users.
    It can be re-enabled for debugging purposes.
    */

    PageType = Card;
    //ApplicationArea = All;
    //UsageCategory = Administration;
    SourceTable = "Vote Records Table";
    //Editable = false;

    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field("Submission"; "Submission")
                {
                    ApplicationArea = All;
                }
                field("Voting User"; "Voting User")
                {
                    ApplicationArea = All;
                }
                field("Vote Value"; "Vote Value")
                {
                    ApplicationArea = All;
                }
                field("Date & Time of vote"; "Date & Time of vote")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}