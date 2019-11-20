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
            TableRelation = "Idea Evidence Header"; //Asi jenom pokud je to PK

        }
        field(2; "Name"; Code[50])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(3; "User"; Code[40])
        {
            Caption = 'User';
            DataClassification = CustomerContent;
            //Editable = false;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(4; "Vote value"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(5; "Number of votes"; Integer)
        {
            //FieldClass = FlowField;
            //CalcFormula = count ("Evidence Voting Table" where ("Idea No.1" = field ("User"))); // pocitadlo hlasu pro urcity napad
        }
        field(6; "Number of Voters"; Integer)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Idea No.1", "User")
        {
            Clustered = true;
        }
    }
}