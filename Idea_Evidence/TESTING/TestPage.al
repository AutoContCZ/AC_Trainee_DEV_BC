page 50141 "TestActionsPage01EV"
{
    // Pomocná stránka pro testování funkcí a funkcionalit

    Caption = 'Test Actions';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        { }
    }

    actions
    {
        area(Processing)
        {
            action(CreateIdeaEV)    //Vytvoří nový nápad
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    TestingProcedures: Codeunit TestingProceduresEV;
                begin
                    TestingProcedures.CreateIdea();
                end;
            }

            action(CreateCategoriesEV) //Vytvoří kategorie
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    TestingProcedures: Codeunit TestingProceduresEV;
                begin
                    TestingProcedures.createCategories();
                end;
            }

            action(DeleteAllEV) // Slouží ke smazání všech záznamů a kategorií
            {
                ApplicationArea = All;

                trigger OnAction();
                var
                    "IdeaEvTable": Record "Idea Evidence Header EV";
                    CategoriesTable: Record "Evidence Category Table";
                begin
                    IdeaEvTable.DeleteAll(true);
                    CategoriesTable.DeleteAll(true);
                end;
            }
        }
    }
}