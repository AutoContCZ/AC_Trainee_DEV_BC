codeunit 50102 "StatisticsCodeUnit"
{
    procedure CalculateStatistics()
    var
        StatTable: Record "Statistics Table" temporary;
    begin
        StatTable.Init();
        StatTable.Insert();
        Page.Run(Page::"Statistics Page", StatTable);
    end;

    procedure AverageNumberOfVotes(Stat: Record "Statistics Table")
    var
        IdEvHeader: Record "Idea Evidence Header";
        IdEvHeader2: Record "Idea Evidence Header";
        Pom_Record: Record "Idea Evidence Header";
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
            if (pom = 1) then begin
                pom2 := 1;
            end;
            IdEvHeader.Next();
            IdEvHeader.CalcFields("Number of Votes");
            vot_sum := vot_sum + IdEvHeader."Number of Votes";
            if IdEvHeader."No." = Pom_Record."No." then begin
                pom := 1;
            end;
        until pom2 = 1;
        Message(format(vot_sum));
        Stat."Average number of votes" := vot_sum;
        Stat.Modify(true);
    end;

    procedure GetFilteredIdeas("Idea State": Text)
    var
        IdEvHeader: Record "Idea Evidence Header";
    begin
        IdEvHeader.SetFilter(State, "Idea State");
        Page.Run(Page::"Filtered Ideas", IdEvHeader);
    end;

    procedure GetMostVotedIdea(): Text[40]
    var
        IdEvHeader: Record "Idea Evidence Header";
    begin
        IdEvHeader.SetCurrentKey("Number of Votes");
        IdEvHeader.FindLast();
        exit(IdEvHeader."Name");
    end;

    procedure GetLeastVotedIdea(): Text[40]
    var
        IdEvHeader: Record "Idea Evidence Header";
    begin
        IdEvHeader.SetCurrentKey("Number of Votes");
        IdEvHeader.FindFirst();
        exit(IdEvHeader."Name");
    end;

}