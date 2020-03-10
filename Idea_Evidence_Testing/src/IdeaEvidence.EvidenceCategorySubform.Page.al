page 50126 "Evidence Category Subform"
{
    PageType = ListPart;
    SourceTable = "Category Idea Connec. Table EV";
    Caption = 'Categories';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Category No."; "Category No.")
                {
                    ApplicationArea = All;
                }
                field("Name"; "Category Name")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        IdeaCateg: Record "Evidence Category Table";
                    begin
                        IdeaCateg.Get("Category No.");
                        Page.Run(Page::"Evidence Category Card", IdeaCateg); //oteviram zaznam ze stranky "Evidence Category Card"
                    end;
                }
            }
        }
    }
}
