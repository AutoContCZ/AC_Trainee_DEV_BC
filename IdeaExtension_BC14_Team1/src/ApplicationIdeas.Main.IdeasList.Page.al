page 50110 "Application Ideas"
{
    Caption = 'Application Ideas';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Main Ideas Table";
    CardPageId = 50111;



    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        AssistEditClicked();
                    end;

                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                    Style = Strong;

                }
                field("Date of submission"; "Date of submission")
                {
                    ApplicationArea = All;

                }
                field("Submitter"; "Submitter")
                {
                    ApplicationArea = All;
                    Style = StrongAccent;

                }
                field("Status"; "Status")
                {
                    ApplicationArea = All;
                }
                field("Total votes"; "Total votes")
                {
                    ApplicationArea = All;
                    StyleExpr = TotalVotesStyle;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(Categories)
            {
                Caption = 'Categories';
                Image = Accounts;

                action("Set Filters")
                {
                    ApplicationArea = All;
                    Caption = 'Set Filters';
                    Image = EditFilter;

                    trigger OnAction()
                    begin
                        Page.Run(50108);
                    end;
                }
                action("Filter")
                {
                    ApplicationArea = All;
                    Caption = 'Filter records';
                    Image = UseFilters;

                    trigger OnAction()
                    var
                        DialogTable: Record "Category Filter Dialog Table";
                    begin
                        DialogTable.FindFirst();
                        if DialogTable."Data Migrations" = True then begin
                            Rec.SETRANGE("Data Migrations", true);
                        end;

                        if DialogTable.Development = True then begin
                            Rec.SETRANGE(Development, true);
                        end;

                        if DialogTable.Documentation = True then begin
                            Rec.SETRANGE(Documentation, true);
                        end;

                        if DialogTable."Financial Management" = True then begin
                            Rec.SETRANGE("Financial Management", true);
                        end;

                        if DialogTable.General = True then begin
                            Rec.SETRANGE(General, true);
                        end;

                        if DialogTable."Geographies and Localization" = True then begin
                            Rec.SETRANGE("Geographies and Localization", true);
                        end;

                        if DialogTable.Inventory = True then begin
                            Rec.SETRANGE(Inventory, true);
                        end;

                        if DialogTable.Manufacturing = True then begin
                            Rec.SETRANGE(Manufacturing, true);
                        end;

                        if DialogTable."Office Integration" = True then begin
                            Rec.SETRANGE("Office Integration", true);
                        end;

                        if DialogTable."Opportunity Management" = True then begin
                            Rec.SETRANGE("Opportunity Management", true);
                        end;

                        if DialogTable."Project Management" = True then begin
                            Rec.SETRANGE("Project Management", true);
                        end;

                        if DialogTable.Purchasing = True then begin
                            Rec.SETRANGE(Purchasing, true);
                        end;

                        if DialogTable."Reports and Business Intell." = True then begin
                            Rec.SETRANGE("Reports and Business Intell.", true);
                        end;

                        if DialogTable.Sales = True then begin
                            Rec.SETRANGE(Sales, true);
                        end;

                        if DialogTable."Service Order Management" = True then begin
                            Rec.SETRANGE("Service Order Management", true);
                        end;

                        if DialogTable."Tenant Administration" = True then begin
                            Rec.SETRANGE("Tenant Administration", true);
                        end;

                        if DialogTable.Warehousing = True then begin
                            Rec.SETRANGE(Warehousing, true);
                        end;

                    end;
                }
                action("Clear Filters")
                {
                    ApplicationArea = All;
                    Caption = 'Clear Filters';
                    Image = ClearFilter;

                    trigger OnAction()
                    begin
                        Rec.SETRANGE("Data Migrations");
                        Rec.SETRANGE(Development);
                        Rec.SETRANGE(Documentation);
                        Rec.SETRANGE("Financial Management");
                        Rec.SETRANGE(General);
                        Rec.SETRANGE("Geographies and Localization");
                        Rec.SETRANGE(Inventory);
                        Rec.SETRANGE(Manufacturing);
                        Rec.SETRANGE("Office Integration");
                        Rec.SETRANGE("Opportunity Management");
                        Rec.SETRANGE("Project Management");
                        Rec.SETRANGE(Purchasing);
                        Rec.SETRANGE("Reports and Business Intell.");
                        Rec.SETRANGE(Sales);
                        Rec.SETRANGE("Service Order Management");
                        Rec.SETRANGE("Tenant Administration");
                        Rec.SETRANGE(Warehousing);
                    end;
                }
            }

            action(VoteFor)
            {
                Caption = 'Vote for';
                Image = Approval;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    VoteOperations: Codeunit "Vote Operations";
                    VotesSource: Record "Vote Records Table";
                    forLabel: Label 'You have already voted this way';
                begin


                    if VotesSource.Get(Rec."No.", Database.UserId()) then begin
                        VotesSource.Get(Rec."No.", Database.UserId());
                        if VotesSource."Vote Value" = 1 then begin
                            Message(forLabel);
                        end else begin
                            VotesSource."Vote Value" := 1;
                            VotesSource."Date & Time of vote" := CurrentDateTime();
                            VotesSource.Modify(true);
                        end;
                    end else begin
                        VoteOperations.RecCreatorFor(Rec);
                    end;

                    VoteOperations.RecCalcVotes(Rec);
                end;
            }
            action(VoteAgainst)
            {
                Caption = 'Vote against';
                Image = Cancel;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    VoteOperations: Codeunit "Vote Operations";
                    VotesSource: Record "Vote Records Table";
                    againstLabel: Label 'You have already voted this way';
                begin
                    if VotesSource.Get(Rec."No.", Database.UserId()) then begin
                        VotesSource.Get(Rec."No.", Database.UserId());
                        if VotesSource."Vote Value" = 2 then begin
                            Message(againstLabel);
                        end else begin
                            VotesSource."Vote Value" := 2;
                            VotesSource."Date & Time of vote" := CurrentDateTime();
                            VotesSource.Modify(true);
                        end;
                    end else begin
                        VoteOperations.RecCreatorAgainst(Rec);
                    end;

                    VoteOperations.RecCalcVotes(Rec);
                end;
            }
            action(VoteRemove)
            {
                Caption = 'Remove my vote';
                Image = CloseDocument;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    VotesSource: Record "Vote Records Table";
                    VoteOperations: Codeunit "Vote Operations";
                    removeLabel: Label 'You have no recorded vote for this suggestion';
                begin
                    if VotesSource.Get(Rec."No.", Database.UserId()) then begin
                        VotesSource.Get(Rec."No.", Database.UserId());
                        VotesSource.Delete();
                    end else begin
                        Message(removeLabel);
                    end;

                    VoteOperations.RecCalcVotes(Rec);
                end;

            }
            action(Statistic)
            {
                Caption = 'Statistic';
                Image = Statistics;
                ApplicationArea = All;

                trigger OnAction()
                var
                    localstatistic: Codeunit StatisticCodeUnit;
                begin
                    localstatistic.CalculateStatistics();
                end;
            }

        }
        area(Reporting)
        {
            action(UserReport)
            {
                Caption = 'Summary report';
                Image = Report;
                ApplicationArea = All;

                trigger OnAction()
                var
                    LocalRec: Record "Main Ideas Table";
                begin
                    CurrPage.SetSelectionFilter(LocalRec);
                    Report.Run(Report::"Application Ideas Report", true, false, LocalRec);
                end;
            }

        }
    }
    var
        TotalVotesStyle: Text[20];

    trigger OnAfterGetRecord()
    begin
        TotalVotesStyle := VotesProcedure()
    end;

    local procedure VotesProcedure(): text[20]
    begin
        if Rec."Total votes" = 0 then begin
            exit('Ambiguous')
        end;
        if Rec."Total votes" > 0 then begin
            exit('Favorable')
        end;
        if Rec."Total votes" < 0 then begin
            exit('Unfavorable')
        end;
    end;

}