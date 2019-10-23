page 50131 "Statistics Page"
{
    Caption = 'Voting statistics';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Statistics Table";
    InsertAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            group("Categories of Ideas")
            {
                Caption = 'Ideas and their state';
                field("New"; "New")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        StatCU: Codeunit StatisticsCodeUnit;
                    begin
                        StatCU.GetFilteredIdeas('New');
                    end;

                }
                field("Being voted on"; "NeedsVotes")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        StatCU: Codeunit StatisticsCodeUnit;
                    begin
                        StatCU.GetFilteredIdeas('Needs Votes');
                    end;
                }

                field("Under review"; "UnderReview")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        StatCU: Codeunit StatisticsCodeUnit;
                    begin
                        StatCU.GetFilteredIdeas('Under Review');
                    end;
                }
                field("Planned"; "Planned")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        StatCU: Codeunit StatisticsCodeUnit;
                    begin
                        StatCU.GetFilteredIdeas('Planned');
                    end;
                }
                field("Completed"; "Completed")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        StatCU: Codeunit StatisticsCodeUnit;
                    begin
                        StatCU.GetFilteredIdeas('Completed');
                    end;
                }
                field("Rejected"; "Rejected")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        IdEvHeader: Record "Idea Evidence Header";
                    begin
                        IdEvHeader.SetFilter(State, 'Rejected');
                        Page.Run(Page::"Filtered Ideas", IdEvHeader);
                    end;
                }
            }
            group("Total Number of Ideas")
            {
                Caption = 'Total number of ideas';
                field("Number of Ideas"; "Number of ideas")
                {
                    Caption = 'Total';
                    ApplicationArea = All;

                }
            }
            group("Most Voted")
            {
                Caption = 'Idea with the most votes';
                field("Idea most voted for"; "Idea most voted for")
                {
                    Caption = 'Name';
                    Editable = false;
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        IdEvHeader: Record "Idea Evidence Header";
                    begin
                        IdEvHeader.SetCurrentKey("Number of Votes");
                        IdEvHeader.FindLast();
                        //IdEvHeader.Get(poradi_zaznamu_max);   //pro konkretni zaznam
                        Page.Run(Page::"Idea Evidence Card", IdEvHeader);
                    end;
                }
            }
            group("Least Voted")
            {
                Caption = 'Idea with the least votes';
                field("Idea least voted for"; "Idea least voted for")
                {
                    Caption = 'Name';
                    Editable = false;
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        IdEvHeader: Record "Idea Evidence Header";
                    begin
                        IdEvHeader.SetCurrentKey("Number of Votes");
                        IdEvHeader.FindFirst();
                        Page.Run(Page::"Idea Evidence Card", IdEvHeader);
                    end;
                }
            }
            group("Total")
            {
                Caption = 'Total number of votes';

                field("Total number of Votes"; "Total number of votes")
                {
                    Caption = 'Total';
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("Average")
            {
                Caption = 'Average number of votes per idea';
                field("Average number of votes"; "Average number of votes")
                {
                    Caption = 'Average';
                    Editable = false;
                    ApplicationArea = All;
                }

            }
        }
    }
    trigger OnAfterGetRecord()
    var
        StatCU: Codeunit StatisticsCodeUnit;
        IdEvHeader: Record "Idea Evidence Header";
    begin
        Rec.CalcFields("Number of ideas"); // kdyz pracuji s promennou, kterou nezobrazujes
        Rec."Idea most voted for" := StatCU.GetMostVotedIdea();
        Rec."Idea least voted for" := StatCU.GetLeastVotedIdea();
        if "Number of ideas" > 0 then "Average number of votes" := Rec."Total number of votes" / Rec."Number of ideas";
    end;

}