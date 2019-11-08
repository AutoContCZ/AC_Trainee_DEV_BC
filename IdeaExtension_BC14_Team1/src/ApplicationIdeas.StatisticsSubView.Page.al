page 50113 "Submitter View"
{
    Caption = 'View of submitters';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Vote Records Table";
    CardPageId = 50111;
    Editable = false;


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Voting User"; "Voting User")
                {
                    ApplicationArea = All;
                    Style = Strong;

                    trigger OnDrillDown()
                    var
                        votingRec: record "Vote Records Table";
                    begin
                        votingRec.SetFilter("Voting User", "Voting User");
                        page.Runmodal(page::"Application Ideas Vote Records", votingRec);
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        pom: Record "Vote Records Table";
        last: Record "Vote Records Table";
    begin
        rec.SetCurrentKey("Voting User");
        last.SetCurrentKey("Voting User");
        pom.SetCurrentKey("Voting User");
        rec.FindFirst();
        rec.Mark(true);
        pom := rec;
        last.FindLast();

        repeat
            pom.next();
            if rec."Voting User" <> pom."Voting User" then begin
                rec := pom;
                rec.Mark(true);
            end;
        until rec."Voting User" = last."Voting User";

        rec.MarkedOnly(true);
    end;
}