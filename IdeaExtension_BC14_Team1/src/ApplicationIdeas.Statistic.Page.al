page 50149 "Statistics"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Ideas Statistics Table";
    Editable = false;
    Caption = 'Statistics';

    layout
    {
        area(content)
        {
            group("Categories of Ideas")
            {
                Caption = 'General';
                field("Needs more votes"; "Needs more votes")
                {
                    ApplicationArea = All;

                }
                field("Being voted on"; "Being voted on")
                {
                    ApplicationArea = All;
                }

                field("Under review"; "Under review")
                {
                    ApplicationArea = All;
                }
                field("Planned"; "Planned")
                {
                    ApplicationArea = All;
                }
                field("Completed"; "Completed")
                {
                    ApplicationArea = All;
                }
            }
            group("Extrems")
            {
                Caption = 'Extrems';
                field("Most Votes"; "Most Votes")
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    begin
                        page.Run(page::"Application Ideas Card", maxi);
                    end;

                }
                field("Count most votes"; "Count most votes")
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    begin
                        page.Run(page::"Application Ideas Card", maxi);
                    end;
                }

                field("Least Votes"; "Least Votes")
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    var
                    begin
                        page.Run(page::"Application Ideas Card", mini);
                    end;
                }

                field("Count least votes"; "Count least votes")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    begin
                        page.Run(page::"Application Ideas Card", mini);
                    end;
                }
            }

            group("Submitters")
            {
                Caption = 'Submitters';
                field("Number of submitters"; "Number of submitters")
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    begin
                        page.Run(page::"Submitter View");
                    end;

                }
            }
            group("Categories")
            {

                Caption = 'Categories';
                field("Data Migrations"; "Data Migrations")
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Data Migrations", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Development"; "Development")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Development", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Documentation"; "Documentation")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Documentation", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Financial Management"; "Financial Management")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Financial Management", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("General"; "General")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("General", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Geographies and Localization"; "Geographies and Localization")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Geographies and Localization", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Inventory"; "Inventory")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Inventory", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Manufacturing"; "Manufacturing")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Manufacturing", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Office Integration"; "Office Integration")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Office Integration", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Opportunity Management"; "Opportunity Management")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Opportunity Management", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Project Management"; "Project Management")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Project Management", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Purchasing"; "Purchasing")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Purchasing", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Reports and Business Intelligence"; "Reports and BI")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Reports and Business Intell.", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Sales"; "Sales")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Sales", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Service Order Management"; "Service Order Management")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Service Order Management", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Tenant Administration"; "Tenant Administration")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Tenant Administration", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }
                field("Warehousing"; "Warehousing")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        catRec: record "Main Ideas Table";
                    begin
                        catRec.SetFilter("Warehousing", 'true');
                        page.Run(page::"Application Ideas", catRec);
                    end;
                }

            }
        }
    }
    actions
    {

    }
    trigger OnOpenPage()
    var
        pom1: Record "Vote Records Table";
        last: Record "Vote Records Table";
    begin
        sub.SetCurrentKey("Voting User");
        last.SetCurrentKey("Voting User");
        pom1.SetCurrentKey("Voting User");
        sub.FindFirst();
        submitter := 1;
        pom1 := sub;
        last.FindLast();

        repeat
            pom1.next();
            if sub."Voting User" <> pom1."Voting User" then begin
                sub := pom1;
                submitter := submitter + 1;
            end;
        until sub."Voting User" = last."Voting User";


        pom.SetCurrentKey("Total votes");
        pom.FindLast();
        maxi := pom;
        pom.FindFirst();
        mini := pom;

    end;

    trigger OnAfterGetRecord()
    begin
        pom.FindFirst();
        "Most Votes" := maxi.Name;
        "Count most votes" := maxi."Total votes";
        "Least votes" := mini.Name;
        "Count least votes" := mini."Total votes";
        "Number of submitters" := submitter;
    end;

    var
        mini: Record "Main Ideas Table";
        maxi: Record "Main Ideas Table";
        pom: record "Main Ideas Table";
        submitter: integer;
        sub: record "Vote Records Table";
        cat: Record "Categories Table";
}




