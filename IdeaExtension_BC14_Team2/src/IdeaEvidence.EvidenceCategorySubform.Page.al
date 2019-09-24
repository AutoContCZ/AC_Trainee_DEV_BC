page 50126 "Evidence Category Subform"
{
    PageType = ListPart;
    SourceTable = "Category Idea Connection Table";
    Caption = 'Categories';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                // field("Voting No."; "Voting No.")
                // {
                //     ApplicationArea = All;
                //     // trigger OnAssistEdit()
                //     // begin
                //     //     Rec.AssistEditClicked();
                //     // end;

                // }
                field("Category No."; "Category No.")
                {
                    ApplicationArea = All;
                }
                field("Name"; "Category Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
