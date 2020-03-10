page 50121 "Idea Evidence Card EV"
{
    PageType = Card;
    SourceTable = "Idea Evidence Header EV";

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


            }
            field("Description"; "Description")
            {
                ApplicationArea = All;
                MultiLine = true;
            }
            part(Lines1; "Evidence Category Subform")
            {
                SubPageLink = "Idea No." = field("No."); // Vazba mezi evidence category subform a category idea connection
                ApplicationArea = All;
            }
        }
    }


    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Submitter" := UserId(); //CopyStr
    end;
}