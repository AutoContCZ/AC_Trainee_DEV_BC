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
                    trigger OnValidate()
                    begin
                        if "Name" = '' then begin
                            Message('HMM');
                        end;
                    end;
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
                SubPageLink = "Idea No." = field ("No."); // Vazba mezi evidence category subform a category idea connection
            }
        }
    }


    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Submitter" := UserId;
    end;
}