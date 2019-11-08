table 50128 "Vote Records Table"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Submission"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Voting User"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Vote Value"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "No vote","For","Against";
        }
        field(4; "Date & Time of vote"; DateTime)
        {
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "Submission", "Voting User")
        {
            Clustered = true;
        }
    }
}