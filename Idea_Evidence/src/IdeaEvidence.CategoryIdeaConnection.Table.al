table 50125 "Category Idea Connec. Table EV"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Category No."; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Evidence Category Table";

        }
        field(2; "Idea No."; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Idea Evidence Header EV";
        }
        field(3; "Category Name"; Text[40])
        {
            Caption = 'Name';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup ("Evidence Category Table"."Category Name" where("Category No." = field("Category No.")));

        }
        field(4; "Idea Name"; Text[40])
        {
            Caption = 'Name';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup ("Idea Evidence Header EV"."Name" where("No." = field("Idea No.")));

        }
    }

    keys
    {
        key(PK; "Category No.", "Idea No.")
        {
            Clustered = true;
        }
    }
}