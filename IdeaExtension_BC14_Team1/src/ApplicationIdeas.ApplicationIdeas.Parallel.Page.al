page 50119 "Application Ideas Parallel"
{
    /*
    This page shares most of its content with the main Application Ideas Page, but this page is used for showing filtered
    categories from the Categories Page, so it's stripped of the unnecessary functions and actions.
    The page also has no UsageCategory (is not searchable) as there is no reason for it to have one.
    */

    Caption = 'Category Entries';
    PageType = List;
    SourceTable = "Main Ideas Table";
    CardPageId = 50111;
    Editable = false;



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

    trigger OnOpenPage()
    var
        DrilldownCategory: Record "Application Ideas Setup Table";
    begin
        DrilldownCategory.FindFirst();

        if DrilldownCategory."Drilldown Category" = 'DATA MIGRATIONS' then begin
            Rec.SETRANGE("Data Migrations", true);
        end;

        if DrilldownCategory."Drilldown Category" = 'DEVELOPMENT' then begin
            Rec.SETRANGE(Development, true);
        end;

        if DrilldownCategory."Drilldown Category" = 'DOCUMENTATION' then begin
            Rec.SETRANGE(Documentation, true);
        end;

        if DrilldownCategory."Drilldown Category" = 'FINANCIAL MANAGEMENT' then begin
            Rec.SETRANGE("Financial Management", true);
        end;

        if DrilldownCategory."Drilldown Category" = 'GENERAL' then begin
            Rec.SETRANGE(General, true);
        end;

        if DrilldownCategory."Drilldown Category" = 'GEOGRAPHIES AND LOCALIZATION' then begin
            Rec.SETRANGE("Geographies and Localization", true);
        end;

        if DrilldownCategory."Drilldown Category" = 'INVENTORY' then begin
            Rec.SETRANGE(Inventory, true);
        end;

        if DrilldownCategory."Drilldown Category" = 'MANUFACTURING' then begin
            Rec.SETRANGE(Manufacturing, true);
        end;

        if DrilldownCategory."Drilldown Category" = 'OFFICE INTEGRATION' then begin
            Rec.SETRANGE("Office Integration", true);
        end;

        if DrilldownCategory."Drilldown Category" = 'OPPORTUNITY MANAGEMENT' then begin
            Rec.SETRANGE("Opportunity Management", true);
        end;

        if DrilldownCategory."Drilldown Category" = 'PROJECT MANAGEMENT' then begin
            Rec.SETRANGE("Project Management", true);
        end;

        if DrilldownCategory."Drilldown Category" = 'PURCHASING' then begin
            Rec.SETRANGE(Purchasing, true);
        end;

        if DrilldownCategory."Drilldown Category" = 'REPORTS AND BUSINESS INTELLIGENCE' then begin
            Rec.SETRANGE("Reports and Business Intell.", true);
        end;

        if DrilldownCategory."Drilldown Category" = 'SALES' then begin
            Rec.SETRANGE(Sales, true);
        end;

        if DrilldownCategory."Drilldown Category" = 'SERVICE ORDER MANAGEMENT' then begin
            Rec.SETRANGE("Service Order Management", true);
        end;

        if DrilldownCategory."Drilldown Category" = 'TENANT ADMINISTRATION' then begin
            Rec.SETRANGE("Tenant Administration", true);
        end;

        if DrilldownCategory."Drilldown Category" = 'WAREHOUSING' then begin
            Rec.SETRANGE(Warehousing, true);
        end;
    end;

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