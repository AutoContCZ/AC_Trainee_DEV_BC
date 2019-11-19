codeunit 50120 "Idea Evidence Functions"
{
    procedure AddVote(var IdEvHeader: Record "Idea Evidence Header")
    var
        EvVotingTable: Record "Evidence Voting Table";
        pom: Boolean;
        flag: Boolean;
    begin
        IdEvHeader.FindSet(false, false);
        repeat
            flag := false;
            pom := EvVotingTable.Get(IdEvHeader."No.", Database."UserId");
            if (IdEvHeader."State" >= 3) then begin      //Status Planned,Completed nebo Rejected -> neni mozne hlasovat
                Message('%1%2%3', 'Za námět s kódem ', IdEvHeader."No.", ' již nelze hlasovat!');
                flag := true;
            end;
            if ((pom = false) and (flag = false)) then begin
                EvVotingTable.Init();
                EvVotingTable.Validate("Idea No.1", IdEvHeader."No.");
                EvVotingTable.Validate("Name", IdEvHeader."Name");
                EvVotingTable.Validate("User", UserId);
                EvVotingTable.Insert(true);
            end;
            if ((pom = true) and (IdEvHeader."State" < 3) and (flag = false)) then begin
                Message('%1%2%3', 'Za námět s kódem ', IdEvHeader."No.", ' jste již hlasoval/a!');
            end;
        until IdEvHeader.Next = 0;
    end;

    procedure RemoveVote(var IdEvHeader: Record "Idea Evidence Header")
    var
        EvVotingTable: Record "Evidence Voting Table";
        pom: Boolean;
        flag: Boolean;
    begin
        IdEvHeader.FindSet(false, false);
        repeat
            flag := false;
            pom := EvVotingTable.Get(IdEvHeader."No.", Database."UserId");
            if (IdEvHeader."State" >= 3) then begin      //Pokud je status Planned nebo Completed -> neni mozne hlasovat
                Message('%1%2%3', 'Námětu s kódem ', IdEvHeader."No.", ' již nelze odebrat hlas!');
                flag := true;
            end;
            if ((pom = true) and (flag = false)) then begin
                EvVotingTable.SetRange(EvVotingTable."Idea No.1", IdEvHeader."No.");
                EvVotingTable.SetRange(EvVotingTable."User", UserId);
                EvVotingTable.DeleteAll(true);
            end;
            if ((pom = false) and (IdEvHeader."State" < 3) and (flag = false)) then begin
                Message('%1%2%3', 'Za námět s kódem ', IdEvHeader."No.", ' jste nehlasoval/a!');
            end;
        until IdEvHeader.Next = 0;
    end;

    procedure CheckVotingThreshold(IdeaEvHeader: Record "Idea Evidence Header")
    var
        Setup: Record "Idea Evidence Setup";
    begin
        Setup.FindFirst();
        IdeaEvHeader.FindFirst();
        repeat
            IdeaEvHeader.CalcFields("Number of Votes"); //pro kalkulované pole musí nejprve proběhnout funkce CalcFields
            if ((IdeaEvHeader."Number of Votes") >= Setup."Threshold") then begin   //Tady si vytahnu hodnotu hlasu pro vybrany zaznam
                if ((IdeaEvHeader."State") < 3) then begin           //Abychom neprepisovali statusy Planned a Completed na Under Review
                    IdeaEvHeader."State" := 2;
                    IdeaEvHeader.Modify(true);
                end;
            end;
            if ((IdeaEvHeader."Number of Votes") < Setup."Threshold") then begin
                if ((IdeaEvHeader."State") < 3) then begin
                    IdeaEvHeader."State" := 1;
                    IdeaEvHeader.Modify(true);
                end;
            end;
        until IdeaEvHeader.Next = 0;
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