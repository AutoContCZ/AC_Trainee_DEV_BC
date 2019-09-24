page 50127 "Ideas in Category Subform"
{
    PageType = ListPart;
    SourceTable = "Category Idea Connection Table";
    Caption = 'Ideas';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Idea No."; "Idea No.")
                {
                    ApplicationArea = All;
                }
                field("Idea Name"; "Idea Name")
                {

                    ApplicationArea = All;
                    trigger OnDrillDown() // kliknutí na záznam
                    var
                        IdeaEvid: Record "Idea Evidence Header";
                    begin
                        IdeaEvid.Get("Idea No."); // funkce, která nám vrátí samotný záznam
                        Page.Run(Page::"Idea Evidence Card", IdeaEvid);
                        //        stránka, která se má zobrazit    záznam, který se má otevřít
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
}