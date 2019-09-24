page 50122 "Idea Evidence Setup"
{
    Caption = 'Idea Evidence Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Idea Evidence Setup";

    layout
    {
        area(Content)
        {
            field("Idea Evidence Series Nos."; "Idea Evidence Series Nos.")
            {
                ApplicationArea = All;
            }
            field("Idea Evid. Voting Series No."; "Idea Evid. Voting Series Nos.")
            {
                ApplicationArea = All;
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