table 50109 "Category Filter Dialog Table"
{
    DataClassification = CustomerContent;


    /*
    Field 1 does not appear on the Dialog page, as not to change the name of the first table record
    when altering the actual first shown field, Data Migrations.
    */
    fields
    {
        field(1; "Category Filter"; Code[1])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Data Migrations"; Boolean)
        {
            Caption = 'Data Migrations';
            DataClassification = CustomerContent;
        }
        field(3; "Development"; Boolean)
        {
            Caption = 'Development';
            DataClassification = CustomerContent;
        }
        field(4; "Documentation"; Boolean)
        {
            Caption = 'Documentation';
            DataClassification = CustomerContent;
        }
        field(5; "Financial Management"; Boolean)
        {
            Caption = 'Financial Management';
            DataClassification = CustomerContent;
        }
        field(6; "General"; Boolean)
        {
            Caption = 'General';
            DataClassification = CustomerContent;
        }
        field(7; "Geographies and Localization"; Boolean)
        {
            Caption = 'Geographies and Localization';
            DataClassification = CustomerContent;
        }
        field(8; "Inventory"; Boolean)
        {
            Caption = 'Inventory';
            DataClassification = CustomerContent;
        }
        field(9; "Manufacturing"; Boolean)
        {
            Caption = 'Manufacturing';
            DataClassification = CustomerContent;
        }
        field(10; "Office Integration"; Boolean)
        {
            Caption = 'Office Integration';
            DataClassification = CustomerContent;
        }
        field(11; "Opportunity Management"; Boolean)
        {
            Caption = 'Opportunity Management';
            DataClassification = CustomerContent;
        }
        field(12; "Project Management"; Boolean)
        {
            Caption = 'Project Management';
            DataClassification = CustomerContent;
        }
        field(13; "Purchasing"; Boolean)
        {
            Caption = 'Purchasing';
            DataClassification = CustomerContent;
        }
        field(14; "Reports and Business Intell."; Boolean)
        {
            Caption = 'Reports and Business Intelligence';
            DataClassification = CustomerContent;
        }
        field(15; "Sales"; Boolean)
        {
            Caption = 'Sales';
            DataClassification = CustomerContent;
        }
        field(16; "Service Order Management"; Boolean)
        {
            Caption = 'Service Order Management';
            DataClassification = CustomerContent;
        }
        field(17; "Tenant Administration"; Boolean)
        {
            Caption = 'Tenant Administration';
            DataClassification = CustomerContent;
        }
        field(18; "Warehousing"; Boolean)
        {
            Caption = 'Warehousing';
            DataClassification = CustomerContent;
        }

    }
}