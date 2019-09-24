page 50121 "Idea Evidence Card"
{
    PageType = Card;
    SourceTable = "Idea Evidence Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEditClicked();
                    end;
                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                }
                field("Submitter"; "Submitter")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("State"; "State")
                {
                    ApplicationArea = All;
                }
                field("Date and Time"; "Date and Time")
                {
                    ApplicationArea = All;
                }
                part(Lines1; "Evidence Category Subform")
                {
                    SubPageLink = "Idea No." = field ("No."); // Vazba mezi evidence category subform a category idea connection
                }

            }
            field("Description"; "Description")
            {
                ApplicationArea = All;
                MultiLine = true;
            }

            part(Lines; "Evidence Voting Subform")
            {
                SubPageLink = "Idea No.1" = field ("No."); // Vazba mezi otevřeným nápadem a samotnou tabulkou, nemůže být stejná proměnná jako v předchozím subformu
                // vazba mezi evidence category subform a evidence voting table

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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Submitter" := UserId;
    end;

}