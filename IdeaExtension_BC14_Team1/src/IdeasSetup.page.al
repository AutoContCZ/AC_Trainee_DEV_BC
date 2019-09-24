page 50120 "Ideas Management Setup"
{
    Caption = 'Ideas Management Setup';
    PageType = Card;
    SourceTable = "Ideas Setup";
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Ideas Nos."; "Ideas Nos.")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        InsertIfNotExists();
    end;

    local procedure InsertIfNotExists()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert();
        end;
    end;
}
