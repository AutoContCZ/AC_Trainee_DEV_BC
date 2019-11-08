page 50120 "Application Ideas Setup"
{

    /*
    This page is set to editable only when a User has been given permission to edit Application Ideas Setup
    on the User Setup page.
    */

    Caption = 'Application Ideas Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Application Ideas Setup Table";

    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Editability;
                Caption = 'General Setup';
                field("Ideas Nos."; "Ideas Nos.")
                {
                    ApplicationArea = All;
                }
                field("Voting Threshold"; "Voting Threshold")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    trigger OnOpenPage()
    var
        PermissionSet: Record "User Setup";
        PermissionLabel: Label 'You need to have the permission to edit Application Ideas setup';
    begin
        InsertIfNotExists();
        Editability := true;

        if PermissionSet.Get(Database.UserId()) then begin
            PermissionSet.Get(Database.UserId());
        end;

        if PermissionSet."Allow Application Ideas Setup" <> true then begin
            Message(PermissionLabel);
            Editability := false;
        end;

    end;

    local procedure InsertIfNotExists()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert();
        end;
    end;

    var
        Editability: Boolean;

}
