table 50130 "Statistics Table EV"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "New"; Integer)
        {
            Caption = 'New';
            FieldClass = FlowField;
            CalcFormula = count ("Idea Evidence Header EV" where(State = const("New")));
        }

        field(2; "NeedsVotes"; Integer)
        {
            Caption = 'Needs more votes';
            FieldClass = FlowField;
            CalcFormula = count ("Idea Evidence Header EV" where(State = const("NeedsVotes")));
        }
        field(3; "UnderReview"; Integer)
        {
            Caption = 'Under review';
            FieldClass = FlowField;
            CalcFormula = count ("Idea Evidence Header EV" where(State = const("UnderReview")));

        }
        field(4; "Planned"; Integer)
        {
            Caption = 'Planned';
            FieldClass = FlowField;
            CalcFormula = count ("Idea Evidence Header EV" where(State = const("Planned")));
        }
        field(5; "Completed"; Integer)
        {
            Caption = 'Completed';
            FieldClass = FlowField;
            CalcFormula = count ("Idea Evidence Header EV" where(State = const("Completed")));
        }
        field(6; "Rejected"; Integer)
        {
            Caption = 'Rejected';
            FieldClass = FlowField;
            CalcFormula = count ("Idea Evidence Header EV" where(State = const("Rejected")));
        }
        field(7; "Primary key"; code[20])
        {
            Caption = 'PK';
            DataClassification = CustomerContent;
        }
        field(8; "Idea most voted for"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(9; "Idea least voted for"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(10; "Total number of votes"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count ("Evidence Voting Table");
        }
        field(11; "Average number of votes"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(12; "Number of ideas"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count ("Idea Evidence Header EV");
        }
        field(13; "Voters"; Integer)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Primary key")
        {
            Clustered = true;
        }
    }
}