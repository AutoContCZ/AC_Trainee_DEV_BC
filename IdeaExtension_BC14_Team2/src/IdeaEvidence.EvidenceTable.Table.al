table 50120 "Idea Evidence Header"
{
    DataClassification = CustomerContent;
    DataCaptionFields = "Name";

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Name"; Text[40])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; "Description"; Text[300])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(4; "Submitter"; Code[50])
        {
            Caption = 'Submitter';
            DataClassification = CustomerContent;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(5; "Date and Time"; DateTime)
        {
            Caption = 'Date and Time';
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(7; "State"; Option)
        {
            Caption = 'State';
            OptionMembers = New,NeedsVotes,UnderReview,Completed,Planned,Rejected;
            OptionCaption = 'New,Needs Votes,Under Review,Completed,Planned,Rejected';
        }
        field(8; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(9; "Number of Votes"; Integer)
        {
            Caption = 'Votes';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = count ("Evidence Voting Table" where ("Idea No.1" = field ("No."))); // pocitadlo hlasu pro urcity napad
            //                    tabulka z ktere beru data     propojeni mezi seznamem napadu a poradim hlasovani
            // dodelat aby se na cislo nedalo kliknout
        }
        field(10; "Votes Needed to Review"; Integer)
        {
            Caption = 'Votes needed to review';
            //FieldClass = FlowField;
            Editable = false;
            //CalcFormula = sum (field ("Number of Votes"));
            //CalcFormula = lookup ("Idea Evidence Setup".Threshold where ("Idea Evidence Series Nos." = field ("No. Series")));
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        IdeasEvidenceSetup: Record "Idea Evidence Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            IdeasEvidenceSetup.Get();
            IdeasEvidenceSetup.TestField("Idea Evidence Series Nos.");
            NoSeriesMgt.InitSeries(IdeasEvidenceSetup."Idea Evidence Series Nos.", xRec."No. Series", WorkDate(), "No.", "No. Series");

        end;
        Rec."Date and Time" := CurrentDateTime;
        Validate(Rec."Date and Time");
    end;

    procedure AssistEditClicked()
    var
        IdeaEvidenceSetup: Record "Idea Evidence Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IdeaEvidenceSetup.Get();
        IdeaEvidenceSetup.TestField("Idea Evidence Series Nos.");

        if NoSeriesMgt.SelectSeries(IdeaEvidenceSetup."Idea Evidence Series Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
        end;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    var
        CategoryIdeaConnTable: Record "Category Idea Connection Table";
        IdeaVotingTable: Record "Evidence Voting Table";
    begin
        CategoryIdeaConnTable.SetRange(CategoryIdeaConnTable."Idea No.", Rec."No.");
        CategoryIdeaConnTable.DeleteAll(true); //pro smazání určitých záznamů je prvně potřeba nastavit RANGE
        IdeaVotingTable.SetRange(IdeaVotingTable."Idea No.1", Rec."No.");
        IdeaVotingTable.DeleteAll(true);
    end;

    trigger OnRename()
    begin

    end;

}