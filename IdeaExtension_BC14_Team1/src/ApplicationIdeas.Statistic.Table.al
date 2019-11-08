table 50149 "Ideas Statistics Table"
{
    DataClassification = CustomerContent;
    Caption = 'Ideas Statistics Table';


    fields
    {
        field(1; "Needs more votes"; Integer)
        {
            Caption = 'Needs more votes';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where(Status = const("Needs more votes")));
        }

        field(2; "Being voted on"; Integer)
        {
            Caption = 'Being voted on';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where(Status = const("Being voted on")));
        }
        field(3; "Under review"; Integer)
        {
            Caption = 'Under review';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where(Status = const("Under review")));

        }
        field(4; "Planned"; Integer)
        {
            Caption = 'Planned';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where(Status = const("Planned")));
        }
        field(5; "Completed"; Integer)
        {
            Caption = 'Completed';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where(Status = const("Completed")));
        }
        field(7; "Most Votes"; Code[40])

        {
            Editable = false;
            Caption = 'Most Votes';

        }

        field(9; "Count most votes"; integer)

        {
            Editable = false;
            Caption = 'Number of votes';

        }
        field(8; "Least votes"; Code[40])
        {
            Caption = 'Least votes';
            Editable = false;
        }

        field(10; "Count least votes"; integer)

        {
            Editable = false;
            Caption = 'Number of votes';

        }

        field(11; "Number of submitters"; integer)

        {
            Editable = false;
            Caption = 'Number of submitters';
        }

field(12; "Data Migrations"; Integer)
        {
            Editable = false;
            Caption = 'Data Migrations';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Data Migrations" = const(True)));
        }
        field(13; "Development"; Integer)
        {
            Editable = false;
            Caption = 'Development';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Development" = const(True)));
        }
        field(14; "Documentation"; Integer)
        {
            Editable = false;
            Caption = 'Documentation';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Documentation" = const(True)));
        }
        field(15; "Financial Management"; Integer)
        {
            Editable = false;
            Caption = 'Financial Management';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Financial Management" = const(True)));
        }
        field(16; "General"; Integer)
        {
            Editable = false;
            Caption = 'General';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("General" = const(True)));
        }
        field(17; "Geographies and Localization"; Integer)
        {
            Editable = false;
            Caption = 'Geographies and Localization';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Geographies and Localization" = const(True)));
        }
        field(18; "Inventory"; Integer)
        {
            Editable = false;
            Caption = 'Inventory';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Inventory" = const(True)));
        }
        field(19; "Manufacturing"; Integer)
        {
            Editable = false;
            Caption = 'Manufacturing';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Manufacturing" = const(True)));
        }
        field(20; "Office Integration"; Integer)
        {
            Editable = false;
            Caption = 'Office Integration';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Office Integration" = const(True)));
        }
        field(21; "Opportunity Management"; Integer)
        {
            Editable = false;
            Caption = 'Opportunity Management';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Opportunity Management" = const(True)));
        }
        field(22; "Project Management"; Integer)
        {
            Editable = false;
            Caption = 'Project Management';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Project Management" = const(True)));
        }
        field(23; "Purchasing"; Integer)
        {
            Editable = false;
            Caption = 'Purchasing';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Purchasing" = const(True)));
        }
        field(24; "Reports and BI"; Integer)
        {
            Editable = false;
            Caption = 'Reports and BI';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Reports and Business Intell." = const(True)));
        }
        field(25; "Sales"; Integer)
        {
            Editable = false;
            Caption = 'Sales';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Sales" = const(True)));
        }
        field(26; "Service Order Management"; Integer)
        {
            Editable = false;
            Caption = 'Service Order Management';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Service Order Management" = const(True)));
        }
        field(27; "Tenant Administration"; Integer)
        {
            Editable = false;
            Caption = 'Tenant Administration';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Tenant Administration" = const(True)));
        }
        field(28; "Warehousing"; Integer)
        {
            Editable = false;
            Caption = 'Warehousing';
            FieldClass = FlowField;
            CalcFormula = count ("Main Ideas Table" where ("Warehousing" = const(True)));
        }

        field(6; "Primary key"; code[20])
        {
            Caption = 'PK';
            DataClassification = CustomerContent;
        }


    }

    
    keys
    {
        key(PK; "Primary Key")
        {

        }
    }


}

