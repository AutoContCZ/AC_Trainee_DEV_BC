table 50122 "Idea Evidence Setup EV"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary key';
            DataClassification = CustomerContent;

        }
        field(10; "Idea Evidence Series Nos."; Code[10])
        {
            Caption = 'Ideas Evidence Series No.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(11; "Threshold"; Integer)
        {
            Caption = 'Threshold';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}