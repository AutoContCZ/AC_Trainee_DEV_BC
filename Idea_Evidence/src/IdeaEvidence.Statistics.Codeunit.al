codeunit 50102 "StatisticsCodeUnit EV"
{
    procedure CalculateStatistics()
    var
        StatTable: Record "Statistics Table EV" temporary;
    begin
        StatTable.Init();
        StatTable.Insert();
        Page.Run(Page::"Statistics Page EV", StatTable);
    end;

    procedure AverageNumberOfVotes(Stat: Record "Statistics Table EV")
    var
        IdEvHeader: Record "Idea Evidence Header EV";
        Pom_Record: Record "Idea Evidence Header EV";
        vot_sum: Integer;
        poc: Integer;
        pom: Integer;
        pom2: Integer;
    begin
        IdEvHeader.FindFirst();
        Pom_Record.FindLast();
        IdEvHeader.CalcFields("Number of Votes");
        vot_sum := IdEvHeader."Number of Votes";
        poc := 1;
        repeat
            if (pom = 1) then
                pom2 := 1;

            IdEvHeader.Next();
            IdEvHeader.CalcFields("Number of Votes");
            vot_sum := vot_sum + IdEvHeader."Number of Votes";
            if IdEvHeader."No." = Pom_Record."No." then
                pom := 1;

        until pom2 = 1;
        Message(format(vot_sum));
        Stat."Average number of votes" := vot_sum;
        Stat.Modify(true);
    end;

    procedure GetFilteredIdeas("Idea State": Text)
    var
        IdEvHeader: Record "Idea Evidence Header EV";
    begin
        IdEvHeader.SetFilter(State, "Idea State");
        Page.Run(Page::"Filtered Ideas EV", IdEvHeader);
    end;

    procedure GetMostVotedIdea(): Text[40]
    var
        IdEvHeader: Record "Idea Evidence Header EV";
    begin
        IdEvHeader.SetCurrentKey("Number of Votes");
        IdEvHeader.FindLast();
        exit(IdEvHeader."Name");
    end;

    procedure GetLeastVotedIdea(): Text[40]
    var
        IdEvHeader: Record "Idea Evidence Header EV";
    begin
        IdEvHeader.SetCurrentKey("Number of Votes");
        IdEvHeader.FindFirst();
        exit(IdEvHeader."Name");
    end;

}