codeunit 50108 "Idea Evidence Testing EV"
{
    Subtype = Test;
    // Spouštět v rámci celé Codeunity, první test je nutný pro inicializaci prostředí


    [Test]
    // Test který inicializuje prázdná data v tabulkách, Používán k Teardownu  
    // Zároveň můžeme otestovat zda triggery onDelete nějakým způsobem nezabraňují vyprázděnní tabulek
    procedure Teardown()
    var
        Ideas: Record "Idea Evidence Header EV";
        IdeaCategories: Record "Evidence Category Table";
        IdeaVotingList: Record "Evidence Voting Table";
        ConnectionTable: Record "Category Idea Connec. Table EV";
        Assert: Codeunit Assert;
    begin
        Ideas.DeleteAll(true);
        IdeaCategories.DeleteAll(true);
        IdeaVotingList.DeleteAll(true);
        ConnectionTable.DeleteAll(true);

        Assert.IsTrue(Ideas.Count() = 0, 'Idea Evidence Header Table was not properly emptied');
        Assert.IsTrue(IdeaCategories.Count() = 0, 'Evidence Category Table table was not properly emptied');
    end;

    ////////////
    // Handlery
    ///////////

    [ModalPageHandler] // Výběr číslování pro funcki CreateIdea()
    procedure SelectNumbering(var "No.List": TestPage "No. Series List")
    var
        IdeaEvidenceSetup: Record "Idea Evidence Setup EV";
    begin
        IdeaEvidenceSetup.FindFirst();
        "No.List".GoToKey(IdeaEvidenceSetup."Idea Evidence Series Nos.");
        "No.List".OK().Invoke();
    end;

    [MessageHandler]
    procedure OkInvoker(Msg: Text[1024])
    begin
    end;

    /////////////////
    // Samotné funkce
    /////////////////

    [Test] // Ověřující mázání vztahů v Connection Table při volání triggeru OnDelete()
    [HandlerFunctions('SelectNumbering')]
    procedure "Connection Table Relation Deletion Test"()
    var
        Ideas: Record "Idea Evidence Header EV";
        ConnectionTable: Record "Category Idea Connec. Table EV";
        Assert: Codeunit Assert;
        TestingProcedures: Codeunit TestingProceduresEV;
        EvCodeunit: Codeunit "Idea Evidence Functions EV";
    begin
        TestingProcedures.createCategories();
        TestingProcedures.CreateIdea();
        Ideas.FindFirst();
        EvCodeunit.AddVote(Ideas);
        Ideas.Delete(true);

        Assert.IsTrue(ConnectionTable.Count() = 0, 'Idea and Evidence Voting Relations werent properly deleted');

        Teardown();
    end;


    [Test] // Kontrolující správné určení pole State v závislosti na Thresholdu v krajních hodnotách
    // Přechody Next(-1);Next(1), a stejně tak i FindFirst() v některých případech, 
    // kterými se vlastně neposouváme, slouží pouze k aktualizaci stavu Recordu triggerem OnAfterGetRecord()
    [HandlerFunctions('SelectNumbering')]
    procedure "State Value Check"()
    var
        Ideas: Record "Idea Evidence Header EV";
        Setup: Record "Idea Evidence Setup EV";
        TestingProcedures: Codeunit TestingProceduresEV;
        Assert: Codeunit Assert;
        EvCodeunit: Codeunit "Idea Evidence Functions EV";
        Threshold: Integer;
    begin
        Setup.FindFirst();
        Threshold := Setup.Threshold;

        TestingProcedures.CreateIdea();         // Testování pro defaultní hodnotu
        Ideas.FindFirst();
        Assert.IsTrue(Ideas.State = 0, 'State is not New by default');

        EvCodeunit.CheckVotingThreshold(Ideas); // Testování pro hodnotu 0
        Ideas.FindFirst();
        Assert.IsTrue(Ideas.State = 1, 'State is not Needs more votes');

        TestingProcedures.VoteFor(Ideas, Threshold);    // Testování pro hodnotu Threshold
        EvCodeunit.CheckVotingThreshold(Ideas);
        Ideas.FindFirst();
        Assert.IsTrue(Ideas.State = 2, 'State is not Under review');

        TestingProcedures.CreateIdea();         // Testování pro hodnotu jeden hlas nad Threshold
        Ideas.Next(1);
        Threshold += 1;
        TestingProcedures.VoteFor(Ideas, Threshold);
        EvCodeunit.CheckVotingThreshold(Ideas);
        Ideas.Next(-1);
        Ideas.Next(1);
        Assert.IsTrue(Ideas.State = 2, 'State is not under review');

        TestingProcedures.CreateIdea();         // Testování pro hodnotu jeden hlas pod Threshold
        Ideas.Next(1);
        Threshold += -2;
        TestingProcedures.VoteFor(Ideas, Threshold);
        EvCodeunit.CheckVotingThreshold(Ideas);
        Ideas.Next(-1);
        Ideas.Next(1);
        Assert.IsTrue(Ideas.State = 1, 'State is not Needs more votes');

        // Neprovádíme Teardown, data lze využít v následujícím testu
    end;


    [Test]  // Ověřující zobrazeních správných recordů na page Notifications, a její akce
    // Velká většina testu probíhá v jeho Handleru NotificationsHandler
    // [GIVEN] 4 Ideas with States: Under review, Under review, Needs more votes, Under review
    [HandlerFunctions('SelectNumbering,NotificationsHandler')]
    procedure "Notifications Test"()
    var
        Ideas: Record "Idea Evidence Header EV";
        Setup: Record "Idea Evidence Setup EV";
        TestingProcedures: Codeunit TestingProceduresEV;
        EvCodeunit: Codeunit "Idea Evidence Functions EV";
        IdeasPage: Testpage "Ideas Evidence EV";
    begin
        TestingProcedures.CreateIdea();
        Ideas.FindLast();
        Setup.FindFirst();
        TestingProcedures.VoteFor(Ideas, Setup.Threshold);
        EvCodeunit.CheckVotingThreshold(Ideas);

        IdeasPage.OpenView();
        IdeasPage.Notifications.Invoke(); // Zde probíhá PageHandler NotificationsHandler definovaný níže
        IdeasPage.Close();

        Teardown();
    end;

    [PageHandler]
    procedure NotificationsHandler(var Notifications: TestPage "Notifications EV")
    var
        Ideas: Record "Idea Evidence Header EV";
        Assert: Codeunit Assert;
    begin
        Ideas.FindFirst();
        Notifications.GoToRecord(Ideas);
        Notifications.Approve.Invoke();


        Ideas.Next();
        Notifications.GoToRecord(Ideas);
        Notifications.Disapprove.Invoke();

        Ideas.Next(2);
        Ideas.CalcFields("Number of Votes");
        Notifications.GoToRecord(Ideas);
        Notifications."Mark as completed".Invoke();

        Ideas.Next(-1); //AsserError needs to be done last as it alters count
        asserterror Notifications.GoToRecord(Ideas);
        Assert.ExpectedErrorCode('TestRowNotFound');
    end;


    [Test]  // Ověřující nemožnost několikanásobného hlasování/ odstraňování hlasů
    [HandlerFunctions('SelectNumbering,OkInvoker')]
    procedure "Invalid Vote Actions Test"()
    var
        Ideas: Record "Idea Evidence Header EV";
        TestingProcedures: Codeunit TestingProceduresEV;
        Assert: Codeunit Assert;
        IdeasPage: Testpage "Ideas Evidence EV";
    begin
        TestingProcedures.CreateIdea();
        IdeasPage.OpenView();
        Ideas.FindFirst();
        IdeasPage.GoToRecord(Ideas);
        IdeasPage."Add Vote".Invoke();
        IdeasPage."Add Vote".Invoke();
        Ideas.CalcFields("Number of Votes");
        Assert.AreEqual(1, Ideas."Number of Votes", 'Single user allowed to vote multiple times');

        IdeasPage."Remove Vote".Invoke();
        IdeasPage."Remove Vote".Invoke();
        Ideas.CalcFields("Number of Votes");
        Assert.AreEqual(0, Ideas."Number of Votes", 'Vote removal doesnt function properly');
        IdeasPage.Close();

        Teardown();
    end;


    [Test]  // Test ověřující nemožnost hlasovat pro návrhy se State který to neumožňuje
    [HandlerFunctions('SelectNumbering,OkInvoker')]
    procedure "Expired Idea Vote Addition"()
    var
        Ideas: Record "Idea Evidence Header EV";
        TestingProcedures: Codeunit TestingProceduresEV;
        Assert: Codeunit Assert;
        IdeasPage: Testpage "Ideas Evidence EV";
        i: Integer;
    begin
        for i := 1 to 3 do
            TestingProcedures.CreateIdea();

        Ideas.FindFirst();
        Ideas.State := 3;
        Ideas.Modify();

        Ideas.Next();
        Ideas.State := 4;
        Ideas.Modify();

        Ideas.Next();
        Ideas.State := 5;
        Ideas.Modify();

        IdeasPage.OpenView();
        Ideas.FindFirst();
        IdeasPage.GoToRecord(Ideas);
        IdeasPage."Add Vote".Invoke();
        Ideas.CalcFields("Number of Votes");
        Assert.AreEqual(0, Ideas."Number of Votes", 'Was able to vote for Completed Idea');

        Ideas.Next();
        IdeasPage.GoToRecord(Ideas);
        IdeasPage."Add Vote".Invoke();
        Ideas.CalcFields("Number of Votes");
        Assert.AreEqual(0, Ideas."Number of Votes", 'Was able to vote for Planned Idea');

        Ideas.Next();
        IdeasPage.GoToRecord(Ideas);
        IdeasPage."Add Vote".Invoke();
        Ideas.CalcFields("Number of Votes");
        Assert.AreEqual(0, Ideas."Number of Votes", 'Was able to vote for Rejected Idea');

        IdeasPage.Close();
        Teardown();
    end;


    [Test]  // Test ověřující nemožnost mazat hlasy u návrhů se State který to neumožňuje
    [HandlerFunctions('SelectNumbering,OkInvoker')]
    procedure "Expired Idea Vote Deletion"()
    var
        Ideas: Record "Idea Evidence Header EV";
        TestingProcedures: Codeunit TestingProceduresEV;
        Assert: Codeunit Assert;
        IdeasPage: Testpage "Ideas Evidence EV";
        i: Integer;
    begin
        for i := 1 to 3 do
            TestingProcedures.CreateIdea();

        IdeasPage.OpenView();
        Ideas.FindFirst();
        IdeasPage.GoToRecord(Ideas);
        IdeasPage."Add Vote".Invoke();

        Ideas.Next();
        IdeasPage.GoToRecord(Ideas);
        IdeasPage."Add Vote".Invoke();

        Ideas.Next();
        IdeasPage.GoToRecord(Ideas);
        IdeasPage."Add Vote".Invoke();

        IdeasPage.Close();

        Ideas.FindFirst();
        Ideas.State := 3;
        Ideas.Modify();

        Ideas.Next();
        Ideas.State := 4;
        Ideas.Modify();

        Ideas.Next();
        Ideas.State := 5;
        Ideas.Modify();

        IdeasPage.OpenView();
        Ideas.FindFirst();
        IdeasPage.GoToRecord(Ideas);
        IdeasPage."Remove Vote".Invoke();
        Ideas.CalcFields("Number of Votes");
        Assert.AreEqual(1, Ideas."Number of Votes", 'Was able to remove vote from Completed Idea');

        Ideas.Next();
        IdeasPage.GoToRecord(Ideas);
        IdeasPage."Remove Vote".Invoke();
        Ideas.CalcFields("Number of Votes");
        Assert.AreEqual(1, Ideas."Number of Votes", 'Was able to remove vote from Planned Idea');

        Ideas.Next();
        IdeasPage.GoToRecord(Ideas);
        IdeasPage."Remove Vote".Invoke();
        Ideas.CalcFields("Number of Votes");
        Assert.AreEqual(1, Ideas."Number of Votes", 'Was able to remove vote from Rejected Idea');

        IdeasPage.Close();
        Teardown();
    end;

    [Test]  // Test kontrolující správné hodnoty pole Votes Needed to Review v krajních hodnotách
    [HandlerFunctions('SelectNumbering')]
    procedure "Votes To Review Test"()
    var
        Ideas: Record "Idea Evidence Header EV";
        Setup: Record "Idea Evidence Setup EV";
        TestingProcedures: Codeunit TestingProceduresEV;
        Assert: Codeunit Assert;
        IdeasPage: Testpage "Ideas Evidence EV";
        Threshold: Integer;
        AboveThreshold: Integer;
        BelowThreshold: Integer;
    begin
        Setup.FindFirst();
        Threshold := Setup.Threshold;
        AboveThreshold := Threshold + 1;
        BelowThreshold := Threshold - 1;

        TestingProcedures.CreateIdea();
        Ideas.FindFirst();

        Ideas.CalcFields("Number of Votes");
        IdeasPage.OpenView();
        IdeasPage.GoToRecord(Ideas);
        Assert.AreEqual(Format(Setup.Threshold), IdeasPage."Votes Needed to Review".Value(), 'Votes Needed to Review not implicitly equal to Threshold');
        IdeasPage.Close();

        TestingProcedures.VoteFor(Ideas, Threshold);
        Ideas.CalcFields("Number of Votes");
        IdeasPage.OpenView();
        IdeasPage.GoToRecord(Ideas);
        Assert.AreEqual(Format(0), IdeasPage."Votes Needed to Review".Value(), 'Votes Needed to Review not 0 after voting Threshold times');
        IdeasPage.Close();

        TestingProcedures.CreateIdea();
        Ideas.Next();
        TestingProcedures.VoteFor(Ideas, AboveThreshold);
        Ideas.CalcFields("Number of Votes");
        IdeasPage.OpenView();
        IdeasPage.GoToRecord(Ideas);
        Assert.AreEqual(Format(0), IdeasPage."Votes Needed to Review".Value(), 'Votes Needed to Review not 0 after voting more than Threshold times');
        IdeasPage.Close();

        TestingProcedures.CreateIdea();
        Ideas.Next();
        TestingProcedures.VoteFor(Ideas, BelowThreshold);
        Ideas.CalcFields("Number of Votes");
        IdeasPage.OpenView();
        IdeasPage.GoToRecord(Ideas);
        Assert.AreEqual(Format(1), IdeasPage."Votes Needed to Review".Value(), 'Votes Needed to Review not 1 after voting Threshold-1 times');
        IdeasPage.Close();

        Teardown();
    end;
}