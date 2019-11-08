page 50104 "Application Ideas Categories"
{
    Caption = 'Application Ideas Categories';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Categories Table";
    Editable = false;


    layout
    {
        area(Content)
        {
            repeater(Categories)
            {
                field(Name; Name)
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    var
                        DrillDownCategory: Record "Application Ideas Setup Table";
                    begin
                        DrillDownCategory.FindFirst();
                        DrillDownCategory."Drilldown Category" := Rec.Name;
                        DrillDownCategory.Modify(true);
                        Page.Run(50119);
                    end;
                }

            }
        }
    }
}