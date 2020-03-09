page 50123 "Evidence Category Page"
{
    Caption = 'Idea Categories';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Evidence Category Table";
    Editable = false; //True v pripade, ze chceme primo editovatelny seznam (musi se zakomentovat cardpageid)
    CardPageId = 50124;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; "Category No.")
                {
                    ApplicationArea = All;
                    //Editable = false;
                }
                field("Name"; "Category Name")
                {
                    ApplicationArea = All;
                    StyleExpr = 'strong';
                }
                field("Posts"; "Posts")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }
}