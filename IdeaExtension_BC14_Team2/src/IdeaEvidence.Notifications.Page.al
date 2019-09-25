page 50128 "Voting Notifications"
{
    Caption = 'Voting Notifications';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Voting Notification Table";

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
                field("Votes"; "Votes")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}
