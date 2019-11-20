page 50112 "Ideas List View"
{
    /*
    This page is also not searchable as there is no need for it to be
    */

    Caption = 'Ideas List View';
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
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                    Style = Strong;

                }
                field("Total votes"; "Total votes")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

}