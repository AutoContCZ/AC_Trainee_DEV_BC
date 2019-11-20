tableextension 50101 "Application Ideas User Setup" extends "User Setup"
{
    fields
    {
        field(50105; "Allow Application Ideas Setup"; Boolean)
        {
            Caption = 'Allow Application Ideas Setup';
            DataClassification = CustomerContent;
        }
    }
}

pageextension 50110 "Application Ideas User Page" extends "User Setup"
{
    layout
    {
        addafter(Email)
        {
            field("Allow Application Ideas Setup"; "Allow Application Ideas Setup")
            {
                ApplicationArea = All;
                Caption = 'Allow Application Ideas Setup';
            }
        }
    }
}