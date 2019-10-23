page 50134 "Notifications"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Idea Evidence Header";
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

                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                    StyleExpr = 'strong';
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
                begin
                    Rec.State := 4;
                    Rec.Modify(true);
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
                begin
                    Rec.State := 5;
                    Rec.Modify(true);
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
                begin
                    Rec.State := 3;
                    Rec.Modify(true);
                end;
            }
        }
    }

    var
        VFond: Text[20];
        SFond: Text[20];

    trigger OnAfterGetRecord()
    var
        IdEvFunctions: Codeunit "Idea Evidence Functions";
    begin
        VFond := IdEvFunctions.GetFondforVotes(Rec);
        SFond := IdEvFunctions.GetFondforStates(Rec);
    end;
}