codeunit 50107 TestingProceduresEV
{
    // Funkce používané k vytváření testovaných objektů


    // Vytvoří záznam nápadu, číslování nutno přiřadit "ručně"
    procedure CreateIdea()
    var
        IdeaEvTable: Record "Idea Evidence Header EV";
        ConectionTable: Record "Category Idea Connec. Table EV";
        CategoriesTable: Record "Evidence Category Table";
        LibraryRandom: Codeunit 130440;
        NewIdeaName: Text;
        YesNo: Integer;
        i: Integer;
    begin
        NewIdeaName := LibraryRandom.RandText(10);
        IdeaEvTable.Init();
        IdeaEvTable.Name := NewIdeaName;
        IdeaEvTable.AssistEditClicked();
        IdeaEvTable.Submitter := UserId();
        IdeaEvTable.Description := LibraryRandom.RandText(30);

        IdeaEvTable.Validate("No.");
        IdeaEvTable.Insert(true);

        // Přidání kategorií - pokud neexistují, žádné nepřiřadí
        if CategoriesTable.Count() = 0 then
            exit;

        for i := 1 to CategoriesTable.Count() do begin
            YesNo := LibraryRandom.RandIntInRange(0, 1);

            if (YesNo = 1) then begin
                ConectionTable."Category No." := System.Format(i);

                ConectionTable."Idea Name" := NewIdeaName;
                ConectionTable."Idea No." := IdeaEvTable."No.";

                ConectionTable.Insert();
            end;
        end;
    end;


    // Vytvoří 0-100 náhodných kategorií
    procedure createCategories()
    var
        CategoriesTable: Record "Evidence Category Table";
        LibraryRandom: Codeunit 130440;
        CategoriesCount: Integer;
        i: Integer;
    begin
        CategoriesCount := LibraryRandom.RandIntInRange(0, 100);
        for i := 1 to CategoriesCount do begin
            CategoriesTable.Init();
            CategoriesTable."Category No." := System.Format(i);
            CategoriesTable."Category Name" := LibraryRandom.RandText(20);
            CategoriesTable.Validate("Category No.");
            CategoriesTable.Insert();
        end;
    end;


    // Zahlasuje pro daný záznam požadovaným počtem hlasů
    procedure VoteFor(var Ideas: Record "Idea Evidence Header EV"; var NumOfVotes: integer)
    var
        VotingTable: Record "Evidence Voting Table";
        LibraryRandom: Codeunit "Library - Random";
        y: Integer;
    begin
        for y := 1 to NumOfVotes do begin
            VotingTable.Init();
            VotingTable."Idea No.1" := Ideas."No.";
            VotingTable.Name := Ideas.Name;
            VotingTable.User := LibraryRandom.RandText(10);
            VotingTable.Insert();
        end;
    end;
}