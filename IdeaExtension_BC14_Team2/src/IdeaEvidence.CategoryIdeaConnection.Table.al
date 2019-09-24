table 50125 "Category Idea Connection Table"
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
            TableRelation = "Idea Evidence Header";
        }
        field(3; "Category Name"; Text[40])
        {
            Caption = 'Name';
            //DataClassification = CustomerContent;
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup ("Evidence Category Table"."Category Name" where ("Category No." = field ("Category No.")));

        }
        field(4; "Idea Name"; Text[40])
        {
            Caption = 'Name';
            //DataClassification = CustomerContent;
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup ("Idea Evidence Header"."Name" where ("No." = field ("Idea No.")));

        }
    }

    keys
    {
        key(PK; "Category No.", "Idea No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

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