table 50106 "Categories Table"

{

    DataClassification = CustomerContent;

    fields
    {
        field(1; Name; Code[40])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
    }


    keys
    {
        key(PK; "Name")
        {
            Clustered = true;
        }
    }
}