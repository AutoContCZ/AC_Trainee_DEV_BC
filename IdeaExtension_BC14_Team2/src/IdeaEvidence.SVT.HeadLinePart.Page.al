page 50129 "Set Voting threshold"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Set Voting Threshold";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Set Voting Threshold"; "Set Value")      //Prvni je moje pojmenovani, druhy parametr je pojmenovani pole v tabulce
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

                trigger OnAction()
                begin

                end;
            }
        }
    }
}