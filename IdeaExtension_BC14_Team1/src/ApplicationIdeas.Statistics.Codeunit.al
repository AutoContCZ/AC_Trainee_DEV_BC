codeunit 50105 StatisticCodeUnit
{
    procedure CalculateStatistics()
    var
        StatTable: Record "Ideas Statistics Table" temporary;
    begin
        StatTable.Init();
        StatTable.Insert();
        page.Run(page::Statistics, StatTable);
    end;
}