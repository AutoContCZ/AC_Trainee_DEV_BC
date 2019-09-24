table 50124 "Evidence Voting Table"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Idea No.1"; Code[10])
        {
            Caption = 'Idea No.';
            DataClassification = CustomerContent;
            //Editable = false;
            //ValidateTableRelation = false;
            TableRelation = "Idea Evidence Header";

        }
        field(2; "User"; Code[40])
        {
            Caption = 'User';
            DataClassification = CustomerContent;
            //Editable = false;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(3; "Note"; Text[40])
        {
            Caption = 'Note';
            DataClassification = CustomerContent;
            //Editable = false;
        }
        field(4; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        // field(5; "Vote"; Boolean)
        // {
        //     Caption = 'Vote';
        //     DataClassification = CustomerContent;
        // }
    }

    keys
    {
        key(PK; "Idea No.1", "User")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        IdeaEvidenceHeader: Record "Idea Evidence Header";
    begin
        // Rec."User" := UserId; //nefunguje
        // Validate(Rec."User");
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}