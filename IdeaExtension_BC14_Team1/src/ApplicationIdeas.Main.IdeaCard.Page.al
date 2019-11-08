page 50111 "Application Ideas Card"
{
    Caption = 'Application Idea Card';
    PageType = Document;
    SourceTable = "Main Ideas Table";

    layout
    {
        area(content)
        {
            group(Information)
            {
                Caption = 'Information';
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                }
                field("Status"; "Status")
                {
                    ApplicationArea = All;
                }

            }
            group(DescriptionGroup)
            {
                ShowCaption = False;
                field("Description"; "Description")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }
            group(Categories)
            {
                Caption = 'Categories';

                group(CategoryGroup1)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup1Visibility;

                    field("Data Migrations"; "Data Migrations")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup2)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup2Visibility;

                    field("Development"; "Development")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup3)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup3Visibility;

                    field("Documentation"; "Documentation")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup4)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup4Visibility;

                    field("Financial Management"; "Financial Management")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup5)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup5Visibility;

                    field("General"; "General")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup6)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup6Visibility;

                    field("Geographies and Localization"; "Geographies and Localization")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup7)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup7Visibility;

                    field("Inventory"; "Inventory")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup8)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup8Visibility;

                    field("Manufacturing"; "Manufacturing")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup9)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup9Visibility;

                    field("Office Integration"; "Office Integration")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup10)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup10Visibility;

                    field("Opportunity Management"; "Opportunity Management")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup11)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup11Visibility;

                    field("Project Management"; "Project Management")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup12)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup12Visibility;

                    field("Purchasing"; "Purchasing")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup13)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup13Visibility;

                    field("Reports and Business Intelligence"; "Reports and Business Intell.")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup14)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup14Visibility;

                    field("Sales"; "Sales")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup15)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup15Visibility;

                    field("Service Order Management"; "Service Order Management")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup16)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup16Visibility;

                    field("Tenant Administration"; "Tenant Administration")
                    {
                        ApplicationArea = All;
                    }
                }
                group(CategoryGroup17)
                {
                    ShowCaption = False;
                    Visible = CategoryGroup17Visibility;

                    field("Warehousing"; "Warehousing")
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    var
        CategoryGroup1Visibility: Boolean;
        CategoryGroup2Visibility: Boolean;
        CategoryGroup3Visibility: Boolean;
        CategoryGroup4Visibility: Boolean;
        CategoryGroup5Visibility: Boolean;
        CategoryGroup6Visibility: Boolean;
        CategoryGroup7Visibility: Boolean;
        CategoryGroup8Visibility: Boolean;
        CategoryGroup9Visibility: Boolean;
        CategoryGroup10Visibility: Boolean;
        CategoryGroup11Visibility: Boolean;
        CategoryGroup12Visibility: Boolean;
        CategoryGroup13Visibility: Boolean;
        CategoryGroup14Visibility: Boolean;
        CategoryGroup15Visibility: Boolean;
        CategoryGroup16Visibility: Boolean;
        CategoryGroup17Visibility: Boolean;

    trigger OnOpenPage()
    begin
        CategoryGroup1Visibility := true;
        CategoryGroup2Visibility := true;
        CategoryGroup3Visibility := true;
        CategoryGroup4Visibility := true;
        CategoryGroup5Visibility := true;
        CategoryGroup6Visibility := true;
        CategoryGroup7Visibility := true;
        CategoryGroup8Visibility := true;
        CategoryGroup9Visibility := true;
        CategoryGroup10Visibility := true;
        CategoryGroup11Visibility := true;
        CategoryGroup12Visibility := true;
        CategoryGroup13Visibility := true;
        CategoryGroup14Visibility := true;
        CategoryGroup15Visibility := true;
        CategoryGroup16Visibility := true;
        CategoryGroup17Visibility := true;



        if (Rec.Submitter <> Database.UserId()) then begin

            if (Rec."Data Migrations" = false) then begin
                CategoryGroup1Visibility := false;
            end;

            if (Rec.Development = false) then begin
                CategoryGroup2Visibility := false;
            end;

            if (Rec.Documentation = false) then begin
                CategoryGroup3Visibility := false;
            end;

            if (Rec."Financial Management" = false) then begin
                CategoryGroup4Visibility := false;
            end;

            if (Rec.General = false) then begin
                CategoryGroup5Visibility := false;
            end;

            if (Rec."Geographies and Localization" = false) then begin
                CategoryGroup6Visibility := false;
            end;

            if (Rec.Inventory = false) then begin
                CategoryGroup7Visibility := false;
            end;

            if (Rec.Manufacturing = false) then begin
                CategoryGroup8Visibility := false;
            end;

            if (Rec."Office Integration" = false) then begin
                CategoryGroup9Visibility := false;
            end;

            if (Rec."Opportunity Management" = false) then begin
                CategoryGroup10Visibility := false;
            end;

            if (Rec."Project Management" = false) then begin
                CategoryGroup11Visibility := false;
            end;

            if (Rec.Purchasing = false) then begin
                CategoryGroup12Visibility := false;
            end;

            if (Rec."Reports and Business Intell." = false) then begin
                CategoryGroup13Visibility := false;
            end;

            if (Rec.Sales = false) then begin
                CategoryGroup14Visibility := false;
            end;

            if (Rec."Service Order Management" = false) then begin
                CategoryGroup15Visibility := false;
            end;

            if (Rec."Tenant Administration" = false) then begin
                CategoryGroup16Visibility := false;
            end;

            if (Rec.Warehousing = false) then begin
                CategoryGroup17Visibility := false;
            end;
        end;
    end;

}