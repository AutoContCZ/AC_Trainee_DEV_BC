table 50130 "Application Ideas Setup Table"
{
    DataClassification = CustomerContent;


    /*
    Field 11: Voting Threshold, does not appear on the Setup page because it never needs to be manually changed.
    It's used for storing the DrillDown value generated on the Categories page, so the trigger 
    can then filter the parallel Application Ideas Page for the specified category.
    */
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }

        field(10; "Ideas Nos."; Code[10])
        {
            Caption = 'Ideas Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(11; "Voting Threshold"; Integer)
        {
            Caption = 'Voting Threshold';
            DataClassification = CustomerContent;
        }

        field(12; "Drilldown Category"; Code[40])
        {
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