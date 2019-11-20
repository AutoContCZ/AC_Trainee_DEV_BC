page 50133 "Filtered Ideas"
{
    Caption = 'Filtered Ideas';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Idea Evidence Header";
    CardPageId = 50121;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)         //Musi byt repeater pokud chceme standardni seznam
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;

                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                }
                field("Votes"; "Number of Votes")
                {
                    ApplicationArea = All;
                }
                field("State"; "State")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}