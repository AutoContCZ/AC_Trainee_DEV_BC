codeunit 50134 "Vote Operations"
{

    procedure RecCreatorAgainst(UsedRec: Record "Main Ideas Table")
    var
        VotesTable: Record "Vote Records Table";
    begin
        VotesTable.Init();
        VotesTable.Validate("Voting User", Database.UserId());
        VotesTable.Validate("Submission", UsedRec."No.");
        VotesTable.Validate("Vote Value", 2);
        VotesTable.Validate("Date & Time of vote", CurrentDateTime());
        VotesTable.Insert(true);
    end;

    procedure RecCreatorFor(UsedRec: Record "Main Ideas Table")
    var
        VotesTable: Record "Vote Records Table";
    begin
        VotesTable.Init();
        VotesTable.Validate("Voting User", Database.UserId());
        VotesTable.Validate("Submission", UsedRec."No.");
        VotesTable.Validate("Vote Value", 1);
        VotesTable.Validate("Date & Time of vote", CurrentDateTime());
        VotesTable.Insert(true);
    end;


    /* 
    Combined if_statement is used in the until_condition, because a single user can vote for multiple suggestions 
    and simultaneously, multiple users can vote for a single suggestion.
    Not implementing the if_statement in such a way would produce incorrect results.
    */
    procedure RecCalcVotes(UsedRec: Record "Main Ideas Table")
    var
        VotesTable: Record "Vote Records Table";
        VotesTableEndRec: Record "Vote Records Table";

        TotalVoteSum: Integer;
    begin
        VotesTable.FindFirst();
        VotesTableEndRec.FindLast();
        if VotesTable.Submission = UsedRec."No." then begin
            if VotesTable."Vote Value" = 1 then begin
                TotalVoteSum += 1
            end else begin
                TotalVoteSum -= 1;
            end;
        end;

        if VotesTable.count > 1 then begin     // Exception if statement for a situation where only single record exists
            repeat
                VotesTable.Next(1);
                if VotesTable.Submission = UsedRec."No." then begin
                    if VotesTable."Vote Value" = 1 then begin
                        TotalVoteSum += 1
                    end else begin
                        TotalVoteSum -= 1;
                    end;
                end;
            until ((VotesTable."Voting User" = VotesTableEndRec."Voting User") and (VotesTable.Submission = VotesTableEndRec.Submission));
        end;

        UsedRec."Total votes" := TotalVoteSum;
        UsedRec.Modify(true);
    end;

}