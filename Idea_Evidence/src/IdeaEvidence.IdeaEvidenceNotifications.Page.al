page 50134 "Notifications EV"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Idea Evidence Header EV";
    Editable = false;
    Caption = 'Ideas Notifications';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown() // kliknutí na záznam
                    var
                        IdeaEvid: Record "Idea Evidence Header EV";
                    begin
                        IdeaEvid.Get("No."); // funkce, která nám vrátí samotný záznam
                        Page.Run(Page::"Idea Evidence Card EV", IdeaEvid);
                        //        stránka, která se má zobrazit    záznam, který se má otevřít
                    end;
                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                    StyleExpr = 'strong';
                    trigger OnDrillDown() // kliknutí na záznam
                    var
                        IdeaEvid: Record "Idea Evidence Header EV";
                    begin
                        IdeaEvid.Get("No."); // funkce, která nám vrátí samotný záznam
                        Page.Run(Page::"Idea Evidence Card EV", IdeaEvid);
                        //        stránka, která se má zobrazit    záznam, který se má otevřít
                    end;
                }
                field("Submitter"; "Submitter")
                {
                    ApplicationArea = All;
                }
                field("State"; "State")
                {
                    ApplicationArea = All;

                    StyleExpr = SFond;
                }
                field("Number of Votes"; "Number of Votes")
                {
                    ApplicationArea = All;
                    StyleExpr = VFond;
                }
            }
        }
    }


    actions
    {
        area(Processing)
        {
            action("Approve")
            {
                Caption = 'Approve';
                Image = Approval;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process; //Abych dostal tlacitko na action toolbar

                trigger OnAction()
                var
                    IdEvHeader: Record "Idea Evidence Header EV";
                begin
                    CurrPage.SetSelectionFilter(IdEvHeader);
                    IdEvHeader.FindSet(false, false);
                    repeat
                        IdEvHeader.State := 4;
                        IdEvHeader.Modify(true);
                    until IdEvHeader.Next() = 0
                end;
            }
            action("Disapprove")
            {
                Caption = 'Disapprove';
                Image = Reject;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process; //Abych dostal tlacitko na action toolbar

                trigger OnAction()
                var
                    IdEvHeader: Record "Idea Evidence Header EV";
                begin
                    CurrPage.SetSelectionFilter(IdEvHeader);
                    IdEvHeader.FindSet(false, false);
                    repeat
                        IdEvHeader.State := 5;
                        IdEvHeader.Modify(true);
                    until IdEvHeader.Next() = 0
                end;
            }
            action("Mark as completed")
            {
                Caption = 'Mark as completed';
                Image = Apply;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process; //Abych dostal tlacitko na action toolbar

                trigger OnAction()
                var
                    IdEvHeader: Record "Idea Evidence Header EV";
                begin
                    CurrPage.SetSelectionFilter(IdEvHeader);
                    IdEvHeader.FindSet(false, false);
                    repeat
                        IdEvHeader.State := 3;
                        IdEvHeader.Modify(true);
                    until IdEvHeader.Next() = 0
                end;
            }
        }
    }

    var
        VFond: Text[20];
        SFond: Text[20];

    trigger OnAfterGetRecord()
    var
        IdEvFunctions: Codeunit "Idea Evidence Functions EV";
    begin
        VFond := IdEvFunctions.GetFondforVotes(Rec);
        SFond := IdEvFunctions.GetFondforStates(Rec);
    end;
}