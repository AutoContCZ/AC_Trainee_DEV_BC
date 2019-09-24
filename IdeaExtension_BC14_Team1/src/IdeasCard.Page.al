page 50111 "Ideas Card"
{

    PageType = Document;
    SourceTable = "Ideas Header";

    layout
    {
        area(content)
        {
            group(Information)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                }

                field("Category"; Category)
                {
                    ApplicationArea = All;
                    Style = StrongAccent;
                }
                field("Description"; "Description")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Status"; "Status")
                {
                    ApplicationArea = All;
                }

            }

        }
    }

    var

}