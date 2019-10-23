codeunit 50120 "Idea Evidence Functions"
{
    procedure AddVote(IdEvHeader: Record "Idea Evidence Header")
    var
        EvVotingTable: Record "Evidence Voting Table";
    begin
        if (IdEvHeader."State" < 3) then begin      //Pokud je status Planned nebo Completed -> neni mozne hlasovat
            EvVotingTable.Init();
            EvVotingTable.Validate("Idea No.1", IdEvHeader."No.");
            EvVotingTable.Validate("User", UserId);
            EvVotingTable.Insert(true);
        end;
    end;

    procedure RemoveVote(IdEvHeader: Record "Idea Evidence Header")
    var
        EvVotingTable: Record "Evidence Voting Table";
    begin
        if (IdEvHeader."State" < 3) then begin      //Pokud je status Planned nebo Completed -> neni mozne hlasovat
            EvVotingTable.SetRange(EvVotingTable."Idea No.1", IdEvHeader."No.");
            EvVotingTable.SetRange(EvVotingTable."User", UserId);
            EvVotingTable.DeleteAll(true);
        end;
    end;

    procedure CheckVotingThreshold(IdeaEvHeader: Record "Idea Evidence Header")
    var
        Pom_Record: Record "Idea Evidence Header";
        pom: Integer;
        pom2: Integer;
        pom_state: Integer;
        Notification_Count: Integer;
        Setup: Record "Idea Evidence Setup";
    begin
        Setup.FindFirst();
        Pom_Record.FindLast();
        pom := 0;
        pom2 := 0;
        IdeaEvHeader.FindFirst();
        repeat
            IdeaEvHeader.CalcFields("Number of Votes"); //pro kalkulované pole musí nejprve proběhnout funkce CalcFields
            if (IdeaEvHeader."Number of Votes" >= Setup."Threshold") then   //Tady si vytahnu hodnotu hlasu pro vybrany zaznam
                begin
                if pom = 1 then begin
                    pom2 := 1;
                end;
                pom_state := IdeaEvHeader."State";
                if (pom_state < 3) then begin           //Abychom neprepisovali statusy Planned a Completed na Under Review
                    IdeaEvHeader."State" := 2;
                end;
                IdeaEvHeader.Modify(true);           //Musi byt pri modifikaci zaznamu
            end;
            if (IdeaEvHeader."Number of Votes" < Setup."Threshold") then begin
                if pom = 1 then begin
                    pom2 := 1;
                end;
                IdeaEvHeader."State" := 1;
                IdeaEvHeader.Modify(true);
            end;
            IdeaEvHeader.Next(1);
            if IdeaEvHeader."No." = Pom_Record."No." then begin
                pom := 1;
            end;
        until pom2 = 1;
    end;

    procedure GetFondforVotes(IdEvHeader: Record "Idea Evidence Header"): Text[20]
    begin
        if IdEvHeader."Votes Needed to Review" = 0 then begin
            exit('favorable')
        end;
        if IdEvHeader."Votes Needed to Review" > 0 then begin
            exit('attention')
        end;
    end;

    procedure GetFondforStates(IdEvHeader: Record "Idea Evidence Header"): Text[20]
    begin
        if IdEvHeader.State = 0 then begin // New
            exit('ambiguous')
        end;
        if IdEvHeader.State = 1 then begin // Need Votes
            exit('attention')
        end;
        if IdEvHeader.State = 2 then begin // Under Review
            exit('attentionaccent')
        end;
        if IdEvHeader.State = 3 then begin // Completed
            exit('favorable')
        end;
        if IdEvHeader.State = 4 then begin // Planned
            exit('subordinate')
        end;
        if IdEvHeader.State = 5 then begin // Rejected
            exit('unfavorable')
        end;
    end;
}