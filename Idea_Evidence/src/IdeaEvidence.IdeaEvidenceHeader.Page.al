page 50120 "Ideas Evidence EV"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Idea Evidence Header EV";
    Editable = false;
    CardPageId = "Idea Evidence Card EV";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    Width = 2;
                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                    StyleExpr = 'strong';
                    trigger OnDrillDown()
                    var
                        IdeaEvid: Record "Idea Evidence Header EV";
                    begin
                        IdeaEvid.Get("No.");
                        Page.Run(Page::"Idea Evidence Card EV", IdeaEvid);
                    end;
                }
                field("Submitter"; "Submitter")
                {
                    ApplicationArea = All;
                    Width = 4;
                }
                field("Date and Time"; "Date and Time")
                {
                    ApplicationArea = All;
                    Width = 8;
                }
                field("State"; "State")
                {
                    ApplicationArea = All;
                    StyleExpr = SFond; //nastaveni stylu pisma
                    trigger OnDrillDown()
                    var
                        IdEvHeader: Record "Idea Evidence Header EV";
                    begin
                        IdEvHeader.Get("No.");
                        IdEvHeader.SetFilter("State", format(IdEvHeader."State"));
                        Page.Run(Page::"Filtered Ideas EV", IdEvHeader);
                    end;
                }
                field("Number of Votes"; "Number of Votes")
                {
                    ApplicationArea = All;
                    StyleExpr = VFond;
                    Width = 2;
                }
                field("Votes Needed to Review"; "Votes Needed to Review")
                {
                    ApplicationArea = All;
                    Width = 8;
                }
            }
        }
        area(FactBoxes)
        {
            part(Lines; "Evidence Category Subform")
            {
                SubPageLink = "Idea No." = field("No."); // Vazba mezi evidence category subform a category idea connection
                ApplicationArea = All;
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
                    EvCodeunit: Codeunit "Idea Evidence Functions EV";
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
                    IdEvHeader: Record "Idea Evidence Header EV";
                begin
                    IdEvHeader.SetFilter(State, 'Vyhodnocuje se');
                    Page.Run(Page::"Notifications EV", "IdEvHeader");
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
                    IdEvHead: Record "Idea Evidence Header EV";
                    EvCodeunit: Codeunit "Idea Evidence Functions EV";
                begin
                    CurrPage.SetSelectionFilter(IdEvHead);
                    EvCodeunit.AddVote(IdEvHead);
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
                    IdEvHead: Record "Idea Evidence Header EV";
                    EvCodeunit: Codeunit "Idea Evidence Functions EV";
                begin
                    CurrPage.SetSelectionFilter(IdEvHead);
                    EvCodeunit.RemoveVote(IdEvHead);
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
                    localstatistic: Codeunit "StatisticsCodeUnit EV";
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
        IdEvSetup: Record "Idea Evidence Setup EV";
        IdEvFunctions: Codeunit "Idea Evidence Functions EV";
    begin
        IdEvSetup.FindFirst();
        if (("State") < 3) then begin       //Abychom nepocitali pro napady,za ktere uz nelze hlasovat pokud se zmeni threshold
            "Votes Needed to Review" := IdEvSetup.Threshold - "Number of Votes"; //vypocet sloupce votes needed to review
            if "Votes Needed to Review" < 0 then "Votes Needed to Review" := 0;
        end;

        VFond := IdEvFunctions.GetFondforVotes(Rec);
        SFond := IdEvFunctions.GetFondforStates(Rec);

    end;
}