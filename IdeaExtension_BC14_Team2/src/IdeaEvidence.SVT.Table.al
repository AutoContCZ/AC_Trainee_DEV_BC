table 50127 "Set Voting Threshold"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Set value"; Integer)
        {
            Caption = 'Set Value';
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(2; "Default Field"; Integer)
        {
            Caption = 'Default field';
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "Default Field")
        {
            Clustered = true;
        }
    }

}