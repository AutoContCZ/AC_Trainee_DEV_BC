page 50122 "Idea Evidence Setup"
{
    Caption = 'Idea Evidence Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Idea Evidence Setup";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            field("Idea Evidence Series No."; "Idea Evidence Series Nos.")
            {
                ApplicationArea = All;
                StyleExpr = 'strong';
            }
            field("Threshold"; "Threshold")
            {
                ApplicationArea = All;
                StyleExpr = 'strong';
            }
        }
    }

    trigger OnOpenPage()
    begin
        RESET;
        IF NOT GET THEN BEGIN
            INIT;
            INSERT;
        END;
    end;

}