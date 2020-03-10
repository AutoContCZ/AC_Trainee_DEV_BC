page 50135 "Voting Users EV"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Evidence Voting Table";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("User"; "User")
                {
                    StyleExpr = 'strong';
                    ApplicationArea = All;
                }
                field("Number of votes"; "Number of votes")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                        EvVotRec: Record "Evidence Voting Table";
                    begin
                        EvVotRec.SetFilter("User", Rec."User");
                        //IdEvHeader.Get(poradi_zaznamu_max);   //pro konkretni zaznam
                        Page.Run(Page::"Voting List EV", EvVotRec);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        EvVotRec: Record "Evidence Voting Table";
        EvVotRecordLast: Record "Evidence Voting Table";
    begin
        Rec.SetCurrentKey("User");                   //Nastavim sort na User
        EvVotRec.SetCurrentKey("User");              //Nastavim sort na User u pomocneho zaznamu
        EvVotRecordLast.SetCurrentKey("User");
        Rec.FindFirst();                            //Vytahneme prvni zaznam
        Rec.Mark(true);                             //Oznacime ho
        EvVotRec := Rec;                            //Do pomocneho zaznamu vlozime prvni zaznam
        EvVotRecordLast.FindLast();                 //Do pomocneho zaznamu vlozime posledni zaznam
        repeat
            EvVotRec.next();
            if Rec."User" <> EvVotRec."User" then begin
                Rec := EvVotRec;                   //Zde ukladame vzdycky dalsi nove jmeno
                Rec.Mark(true);
            end;
        until Rec."User" = EvVotRecordLast."User";
        Rec.MarkedOnly(true);
    end;

    trigger OnAfterGetRecord()
    var
        EvVotRec: Record "Evidence Voting Table";
    begin
        EvVotRec.SetFilter("User", Rec."User");
        "Number of votes" := EvVotRec.Count();
    end;
}