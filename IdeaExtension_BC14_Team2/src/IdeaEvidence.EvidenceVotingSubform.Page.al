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
    end;

}