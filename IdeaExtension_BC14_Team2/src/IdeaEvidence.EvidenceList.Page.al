page 50120 "Ideas Evidence"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Idea Evidence Header";
    Editable = false;
    CardPageId = 50121;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;

                }
                field("Name"; "Name")
                {
                    ApplicationArea = All;
                }
                field("Submitter"; "Submitter")
                {
                    ApplicationArea = All;
                }
                field("Date and Time"; "Date and Time")
                {
                    ApplicationArea = All;
                }
                field("State"; "State")
                {
                    ApplicationArea = All;
                }
                field("Number of Votes"; "Number of Votes") { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Zkontroluj)
            {
                Caption = 'Check voting threshold';
                Image = ApprovalSetup;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process; //Abych dostal tlacitko na action toolbar

                trigger OnAction();
                var
                    Idea_Notification: Record "Voting Notification Table";
                    Pom_Record: Record "Idea Evidence Header";
                    pom: Integer;
                    pom2: Integer;
                    Voting_Threshold: Integer;
                    Notification_Count: Integer;
                begin
                    Voting_Threshold := 0;
                    Pom_Record.FindLast();
                    pom := 0;
                    pom2 := 0;
                    Rec.FindFirst();
                    repeat
                        if (Rec."Number of Votes" > Voting_Threshold) then   //Tady si vytahnu hodnotu hlasu pro vybrany zaznam
                            begin
                            if pom = 1 then begin
                                pom2 := 1;
                            end;
                            Rec."State" := 2;
                            Idea_Notification.Init();
                            Idea_Notification.Validate("No.", Rec."No.");       //Prvni parametr je field v tabulce, ke kteremu patri promenna
                            Idea_Notification.Validate(Name, Rec.Name);         //Druhym parametrem je prislusna hodnota
                            Idea_Notification.Validate(Votes, Rec."Number of Votes");
                            Idea_Notification.Insert(true);
                            Rec.Modify(true);           //Musi byt pri modifikaci zaznamu
                        end;
                        if (Rec."Number of Votes" <= Voting_Threshold) then begin
                            if pom = 1 then begin
                                pom2 := 1;
                            end;
                            Rec."State" := 1;
                            Rec.Modify(true);
                        end;
                        Rec.Next(1);
                        if Rec."No." = Pom_Record."No." then begin
                            pom := 1;
                        end;
                    until pom2 = 1;
                    //Message('Notifikace vytvořeny!');
                    Message(FORMAT(Notification_Count));
                end;
            }
            action(NastavPrah)
            {
                Caption = 'Set voting threshold';
                Image = Calculate;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process; //Abych dostal tlacitko na action toolbar

                trigger OnAction();
                var
                begin
                end;

            }
        }
    }
}
