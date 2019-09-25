table 50126 "Voting Notification Table"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Name"; Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3; "Votes"; Integer)
        {
            Caption = 'Votes';
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

}