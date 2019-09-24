// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!
page 50110 "Ideas List"
{
    Caption = 'Ideas List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Ideas Header";
    CardPageId = 50111;



    layout
    {
        area(Content)
        {
            repeater(Group) // zmena pro zobrazeni jako list
            {

                field("No."; "No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        AssistEditClicked();
                    end;

                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                    Style = Strong;

                }
                field("Category"; Category)
                {
                    ApplicationArea = All;
                    Style = StrongAccent;
                }
                field("Date of submission"; "Date of submission")
                {
                    ApplicationArea = All;

                }
                field("Submitter"; "Submitter")
                {
                    ApplicationArea = All;

                }
                field("MyVote"; "MyVote")
                {
                    ApplicationArea = All;
                    Style = Strong;
                }
                field("Date & Time of vote"; "Date & Time of vote")
                {
                    ApplicationArea = All;
                }
                field("Status"; "Status")
                {
                    ApplicationArea = All;
                }
                field("Total votes"; "Total votes")
                {
                    ApplicationArea = All;
                    StyleExpr = VotesCountStyle;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(VoteFor)
            {
                Caption = 'Vote for';
                Image = Approval;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    Vote_Value: Integer;
                begin
                    Rec.MyVote := 1;
                    if Rec.MyVote <> xRec.MyVote then begin
                        if xRec.MyVote = 0 then begin
                            Rec."Total votes" += 1;
                        end;
                        if xRec.MyVote = 2 then begin
                            Rec."Total votes" += 2;
                        end;
                    end;

                    Rec."Date & Time of vote" := CurrentDateTime();

                    Rec.Modify(true);
                end;
            }
            action(VoteAgainst)
            {
                Caption = 'Vote against';
                Image = Cancel;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Rec.MyVote := 2;

                    if xRec.MyVote = 0 then begin
                        Rec."Total votes" -= 1;
                    end;
                    if xRec.MyVote = 1 then begin
                        Rec."Total votes" -= 2;
                    end;

                    Rec.Modify(true)
                end;
            }
            action(VoteRemove)
            {
                Caption = 'Remove my vote';
                Image = CloseDocument;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Rec.MyVote := 0;

                    if xRec.MyVote = 1 then begin
                        Rec."Total votes" -= 1;
                    end;
                    if xRec.MyVote = 2 then begin
                        Rec."Total votes" += 1;
                    end;

                    Rec.Modify(true);
                end;

            }

        }
    }
    var
        VotesCountStyle: Text[20];
        test: Text[50];

    trigger OnAfterGetRecord()
    begin
        VotesCountStyle := VotesProcedure()
    end;

    local procedure VotesProcedure(): text[20]
    var

    begin
        if Rec."Total votes" = 0 then begin
            exit('Ambiguous')
        end;
        if Rec."Total votes" > 0 then begin
            exit('Favorable')
        end;
        if Rec."Total votes" < 0 then begin
            exit('Unfavorable')
        end;

    end;
}