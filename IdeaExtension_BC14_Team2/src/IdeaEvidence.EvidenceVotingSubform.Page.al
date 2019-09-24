page 50125 "Evidence Voting Subform"
{
    PageType = ListPart;
    SourceTable = "Evidence Voting Table";
    Caption = 'Voting';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User"; "User")
                {
                    ApplicationArea = All;
                }
                field("Vote"; "Vote")
                {
                    ApplicationArea = All;
                }
                field("Note"; "Note")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    // Při novém záznamu předvyplní jméno přihlášeného uživatele
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        EvVotingTable: Record "Evidence Voting Table";
    begin
        "User" := UserID;
        // if Rec."Vote" = true then begin
        //     Rec."Note".Editable = true;
        // end;
    end;

}