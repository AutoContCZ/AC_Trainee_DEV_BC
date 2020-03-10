page 50131 "Statistics Page EV"
{
    Caption = 'Voting statistics';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Statistics Table EV";
    InsertAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            group("Categories of Ideas")
            {
                Caption = 'Ideas Statistics';
                field("Number of Ideas"; "Number of ideas")
                {
                    Caption = 'Total';
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Ideas Evidence EV");
                    end;
                }
                field("New"; "New")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        StatCU: Codeunit "StatisticsCodeUnit EV";
                    begin
                        StatCU.GetFilteredIdeas('Nový');
                    end;

                }
                field("Being voted on"; "NeedsVotes")
                {
                    Caption = 'Needs more votes';
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        StatCU: Codeunit "StatisticsCodeUnit EV";
                    begin
                        StatCU.GetFilteredIdeas('Potřebuje více hlasů');
                    end;
                }

                field("Under review"; "UnderReview")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        StatCU: Codeunit "StatisticsCodeUnit EV";
                    begin
                        StatCU.GetFilteredIdeas('Vyhodnocuje se');
                    end;
                }
                field("Planned"; "Planned")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        StatCU: Codeunit "StatisticsCodeUnit EV";
                    begin
                        StatCU.GetFilteredIdeas('Schválený');
                    end;
                }
                field("Completed"; "Completed")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        StatCU: Codeunit "StatisticsCodeUnit EV";
                    begin
                        StatCU.GetFilteredIdeas('Implementovaný');
                    end;
                }
                field("Rejected"; "Rejected")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        IdEvHeader: Record "Idea Evidence Header EV";
                    begin
                        IdEvHeader.SetFilter(State, 'Zamítnutý'); //TODO ?? Proč zde Filter set na header když u předchozích možností  přes funkci
                        Page.Run(Page::"Filtered Ideas EV", IdEvHeader);
                    end;
                }
            }
            group("Voting Statistics")
            {
                Caption = 'Voting Statistics - Numbers';
                field("Total number of Votes"; "Total number of votes")
                {
                    Caption = 'Total [Votes]';
                    Editable = false;
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                    begin
                        Page.Run(Page::"Voting List EV");
                    end;
                }
                field("Average number of votes";
                "Average number of votes")
                {
                    Caption = 'Average [Votes/Idea]';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Voters"; "Voters")
                {
                    Caption = 'Voters';
                    Editable = false;
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Voting Users EV");
                    end;
                }
            }
            group("Voting Statistics - Max")
            {
                Caption = 'Voting Statistics - Idea most voted for';
                field("Idea most voted for"; "Idea most voted for")
                {
                    Caption = 'Name';
                    Editable = false;
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        IdEvHeader: Record "Idea Evidence Header EV";
                    begin
                        IdEvHeader.SetCurrentKey("Number of Votes");
                        IdEvHeader.FindLast();
                        //IdEvHeader.Get(poradi_zaznamu_max);   //pro konkretni zaznam
                        Page.Run(Page::"Idea Evidence Card EV", IdEvHeader);
                    end;
                }
            }
            group("Voting Statistics - Min")
            {
                Caption = 'Voting Statistics - Idea least voted for';
                field("Idea least voted for"; "Idea least voted for")
                {
                    Caption = 'Name';
                    Editable = false;
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        IdEvHeader: Record "Idea Evidence Header EV";
                    begin
                        IdEvHeader.SetCurrentKey("Number of Votes");
                        IdEvHeader.FindFirst();
                        Page.Run(Page::"Idea Evidence Card EV", IdEvHeader);
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("All users")
            {
                Caption = 'All users that have voted';
                Image = Approval;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process; //Abych dostal tlacitko na action toolbar

                trigger OnAction()
                var
                begin
                    Page.Run(Page::"Voting Users EV");
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        StatCU: Codeunit "StatisticsCodeUnit EV";
    begin
        Rec.CalcFields("Number of ideas"); // kdyz pracuji s promennou, kterou nezobrazujes
        Rec."Idea most voted for" := StatCU.GetMostVotedIdea();
        Rec."Idea least voted for" := StatCU.GetLeastVotedIdea();
        if "Number of ideas" > 0 then
            "Average number of votes" := Rec."Total number of votes" / Rec."Number of ideas";
    end;

    trigger OnOpenPage()
    var
        EvVotRec: Record "Evidence Voting Table";
        EvVotRec2: Record "Evidence Voting Table";
        EvVotRecordLast: Record "Evidence Voting Table";
        poc: Integer;
    begin
        EvVotRec2.SetCurrentKey("User");                   //Nastavim sort na User
        EvVotRec.SetCurrentKey("User");              //Nastavim sort na User u pomocneho zaznamu
        EvVotRecordLast.SetCurrentKey("User");
        EvVotRec2.FindFirst();                            //Vytahneme prvni zaznam
        EvVotRec := EvVotRec2;                            //Do pomocneho zaznamu vlozime prvni zaznam
        EvVotRecordLast.FindLast();                 //Do pomocneho zaznamu vlozime posledni zaznam
        poc := 1;
        repeat
            if EvVotRec2."User" <> EvVotRec."User" then begin
                poc += 1;
                EvVotRec2 := EvVotRec;                   //Zde ukladame vzdycky dalsi nove jmeno
            end;
        until EvVotRec.Next() = 0;
        Rec."Voters" := poc;
        Rec.Modify(true);
    end;
}