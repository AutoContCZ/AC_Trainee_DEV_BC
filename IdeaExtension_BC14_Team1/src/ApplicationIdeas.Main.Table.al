table 50105 "Main Ideas Table"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "Ideas List View";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }
        field(2; "Name"; Code[40])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }
        field(4; "Submitter"; Code[20])
        {

            Caption = 'Submitter';
            DataClassification = CustomerContent;
        }
        field(5; "Date of submission"; Date)
        {
            Caption = 'Date of submission';
            DataClassification = CustomerContent;
        }
        field(6; "Description"; Text[500])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }
        field(9; "Status"; Option)
        {
            OptionMembers = "Needs more votes","Being voted on","Under review","Planned","Completed";
            OptionCaption = 'Needs more votes,Being voted on,Under review,Planned,Completed';
            Caption = 'Status';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                IdeasSetup: Record "Application Ideas Setup Table";
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field');
                end;

                IdeasSetup.FindFirst();
                if Rec."Total votes" < IdeasSetup."Voting Threshold" then begin
                    if Rec.Status <> 0 then begin
                        Error('The submission currently needs more votes')
                    end;
                end;
            end;
        }
        field(10; "Total votes"; Integer)
        {
            Caption = 'Total votes';
            DataClassification = CustomerContent;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        ////////// Category fields //////////
        field(50; "Data Migrations"; Boolean)
        {
            Caption = 'Data Migrations';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(51; "Development"; Boolean)
        {
            Caption = 'Development';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(52; "Documentation"; Boolean)
        {
            Caption = 'Documentation';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(53; "Financial Management"; Boolean)
        {
            Caption = 'Financial Management';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(54; "General"; Boolean)
        {
            Caption = 'General';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(55; "Geographies and Localization"; Boolean)
        {
            Caption = 'Geographies and Localization';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(56; "Inventory"; Boolean)
        {
            Caption = 'Inventory';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(57; "Manufacturing"; Boolean)
        {
            Caption = 'Manufacturing';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(58; "Office Integration"; Boolean)
        {
            Caption = 'Office Integration';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(59; "Opportunity Management"; Boolean)
        {
            Caption = 'Opportunity Management';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(60; "Project Management"; Boolean)
        {
            Caption = 'Project Management';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(61; "Purchasing"; Boolean)
        {
            Caption = 'Purchasing';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(62; "Reports and Business Intell."; Boolean)
        {
            Caption = 'Reports and Business Intelligence';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(63; "Sales"; Boolean)
        {
            Caption = 'Sales';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(64; "Service Order Management"; Boolean)
        {
            Caption = 'Service Order Management';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(65; "Tenant Administration"; Boolean)
        {
            Caption = 'Tenant Administration';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        field(66; "Warehousing"; Boolean)
        {
            Caption = 'Warehousing';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec.Submitter <> Database.UserId()) then begin
                    Error('Only the submitter can edit this field')
                end;
            end;
        }

        //////////////////////////////////////
    }

    var
        Vote_Value: Integer;

    trigger OnInsert()
    var
        IdeasSetup: Record "Application Ideas Setup Table"; //table list and which type
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        Rec.Submitter := Database.UserId();
        Rec."Date of submission" := System.Today();

        if "No." = '' then begin //continue when adding numbers manually
            IdeasSetup.Get(); //get value form table
            IdeasSetup.TestField("Ideas Nos."); //Ideas NOs. 
            NoSeriesMgt.InitSeries(IdeasSetup."Ideas Nos.", xRec."No. Series", WorkDate(), "No.", "No. Series");
        end;

    end;

    procedure AssistEditClicked()
    var
        IdeasSetup: Record "Application Ideas Setup Table";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        IdeasSetup.Get();
        IdeasSetup.TestField("Ideas Nos.");
        if NoSeriesMgt.SelectSeries(IdeasSetup."Ideas Nos.", xRec."No. Series", "No. Series") Then begin
            NoSeriesMgt.SetSeries("No.");
        end;
    end;

}

