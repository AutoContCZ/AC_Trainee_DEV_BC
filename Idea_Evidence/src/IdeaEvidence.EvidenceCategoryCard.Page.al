page 50124 "Evidence Category Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Evidence Category Table";


    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; "Category No.")
                {
                    ApplicationArea = All;
                }
                field("Category Name"; "Category Name")
                {
                    ApplicationArea = All;
                }
            }
            part(Lines; "Ideas in Category Subform EV")
            {
                SubPageLink = "Category No." = field("Category No.");
                ApplicationArea = All;
            }
        }
    }
}