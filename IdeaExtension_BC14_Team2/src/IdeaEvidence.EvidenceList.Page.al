page 50120 "Ideas Evidence"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Idea Evidence Header";
    Editable = false;
    CardPageId = 50121;

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
                field("Date and Time"; "Date and Time")
                {
                    ApplicationArea = All;
                }
                field("State"; "State")
                {
                    ApplicationArea = All;
                    StyleExpr = SFond; //nastaveni stylu pisma
                }
                field("Number of Votes"; "Number of Votes")
                {
                    ApplicationArea = All;
                    StyleExpr = VFond;

                }
                field("Votes Needed to Review"; "Votes Needed to Review")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part(Lines; "Evidence Category Subform")
            {
                SubPageLink = "Idea No." = field ("No."); // Vazba mezi evidence category subform a category idea connection
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Check Threshold")
            {
                Caption = 'Check threshold';
                Image = ApprovalSetup;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process; //Abych dostal tlacitko na action toolbar

                trigger OnAction()
                var
                    //EvVotingTable: Record "Evidence Voting Table";
                    EvCodeunit: Codeunit "Idea Evidence Functions";
                begin
                    EvCodeunit.CheckVotingThreshold(Rec);
                end;
            }
            action("Settings")
            {
                Caption = 'Settings';
                Image = Setup;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process; //Abych dostal tlacitko na action toolbar

                trigger OnAction();
                var
                begin
                    Page.Run(50122);
                end;
            }
            action("Notifications")
            {
                Caption = 'Notifications';
                Image = Alerts;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process; //Abych dostal tlacitko na action toolbar

                trigger OnAction();
                var
                    IdEvHeader: Record "Idea Evidence Header";
                begin
                    IdEvHeader.SetFilter(State, 'Under Review');
                    Page.Run(Page::"Notifications", "IdEvHeader");
                end;
            }
            action("Add Vote")
            {
                ApplicationArea = All;
                Promoted = true;
                Caption = 'Add Vote';
                PromotedCategory = Process;
                Image = Approval;

                trigger OnAction()
                var
                    EvCodeunit: Codeunit "Idea Evidence Functions";
                begin
                    EvCodeunit.AddVote(Rec);
                end;
            }
            action("Remove Vote")
            {
                ApplicationArea = All;
                Promoted = true;
                Caption = 'Remove Vote';
                PromotedCategory = Process;
                Image = Cancel;

                trigger OnAction()
                var
                    EvCodeunit: Codeunit "Idea Evidence Functions";
                begin
                    EvCodeunit.RemoveVote(Rec);
                end;
            }
            action("Categories")
            {
                Caption = 'Categories';
                Image = Category;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process; //Abych dostal tlacitko na action toolbar

                trigger OnAction()
                begin
                    Page.Run(50123);
                end;
            }
            action("Statistics")
            {
                Caption = 'Statistics';
                Image = Statistics;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process; //Abych dostal tlacitko na action toolbar


                trigger OnAction()
                var
                    localstatistic: Codeunit StatisticsCodeUnit;
                begin
                    localstatistic.CalculateStatistics();
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
        IdEvSetup: Record "Idea Evidence Setup";
    begin
        IdEvSetup.FindFirst();
        "Votes Needed to Review" := IdEvSetup.Threshold - "Number of Votes"; //vypocet sloupce votes needed to review
        if "Votes Needed to Review" < 0 then "Votes Needed to Review" := 0;

        VFond := IdEvFunctions.GetFondforVotes(Rec);
        SFond := IdEvFunctions.GetFondforStates(Rec);

    end;
}