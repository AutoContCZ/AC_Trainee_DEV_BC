page 50112 "Ideas List View"
{
    Caption = 'Ideas List View';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
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