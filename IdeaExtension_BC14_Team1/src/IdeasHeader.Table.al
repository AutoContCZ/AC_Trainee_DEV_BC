//Hlavní tabulka ze které si bere page data. Nemusí mít žádný caption protože je na pozadí.

table 50105 "Ideas Header"
{
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }
        field(2; "Name"; Code[20])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }
        field(3; "Category"; Option)
        {
            Caption = 'Category';
            OptionMembers = "Správa","Finance","Integrace","Nákup a závazky","Nákupní doklady","Prodej a marketing","Prodejní doklady";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }
        field(4; "Submitter"; Code[20])
        {

            Caption = 'Submitter';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }
        field(5; "Date of submission"; Date)
        {
            Caption = 'Date of submission';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }
        field(6; "Description"; Text[500])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }
        field(7; "MyVote"; Option)
        {
            OptionMembers = "No vote","For","Against";
            Caption = 'My Vote';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if Rec.MyVote <> xRec.MyVote then begin
                    Message('Zde doplnit to samé co bude v triggeru z přímé změny z akce');
                end;
            end;

        }
        field(8; "Date & Time of vote"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(9; "Status"; Option)
        {
            OptionMembers = "Needs more votes","Being voted on","Under review","Planned","Completed";
            Caption = 'Status';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field');
                end;

                if Rec."Total votes" < 10 then begin
                    if Rec.Status <> 0 then begin
                        Error('The submition currently needs more votes')
                    end;

                end;
            end;
        }
        field(10; "Total votes"; Integer)
        {
            Caption = 'Total votes';
            DataClassification = CustomerContent;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

    }

    var
        Vote_Value: Integer;

    trigger OnInsert()
    var
        IdeasSetup: Record "Ideas Setup"; //table list and which type
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        Rec.Submitter := Database.UserId();
        Rec."Date of submission" := System.Today();

        if "No." = '' then begin //continue when adding numbers manually
            IdeasSetup.Get(); //get value form table
            IdeasSetup.TestField("Ideas Nos."); //Ideas NOs. 
            NoSeriesMgt.InitSeries(IdeasSetup."Ideas Nos.", xRec."No. Series", WorkDate(), "No.", "No. Series");
        end;

    end;

    trigger OnModify()
    begin

    end;

    procedure AssistEditClicked()
    var
        IdeasSetup: Record "Ideas Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IdeasSetup.Get();
        IdeasSetup.TestField("Ideas Nos.");
        if NoSeriesMgt.SelectSeries(IdeasSetup."Ideas Nos.", xRec."No. Series", "No. Series") Then begin
            NoSeriesMgt.SetSeries("No.");
        end;
    end;
}

