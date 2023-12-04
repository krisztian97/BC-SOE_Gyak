codeunit 50100 "Posting Match Mgt."
{
    procedure Posting(Match: Record Match)
    begin
        Match.TestField(Status, Status::Closed);
        CreatePostedMatch(Match);
        DeleteMatch(Match);
    end;

    local procedure CreatePostedMatch(Match: Record Match)
    var
        PostedMatch: Record "Posted Match";
        PlayerLine: Record "Player Line";
        PostedPlayerLine: Record "Posted Player Line";
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PostedMatchCard: Page "Posted Match";
    begin
        if SalesReceivablesSetup.Get() then;
        SalesReceivablesSetup.TestField("Posted Match Nos. Series");

        PostedMatch.Init();
        PostedMatch."No." := NoSeriesMgt.GetNextNo(SalesReceivablesSetup."Posted Match Nos. Series", Today, true);
        PostedMatch.TransferFields(Match, false);
        PostedMatch."Posted Date" := Today;
        PostedMatch.Insert();

        PlayerLine.Reset();
        PlayerLine.SetFilter("Match No.", Match."No.");
        PostedPlayerLine.Init();

        if PlayerLine.FindSet() then
            repeat
                PostedPlayerLine.TransferFields(PlayerLine);
                PostedPlayerLine."Match No." := PostedMatch."No.";
                PostedPlayerLine.Insert();
            until PlayerLine.Next() = 0;

        PostedMatchCard.SetRecord(PostedMatch);
        PostedMatchCard.Run();
    end;

    local procedure DeleteMatch(Match: Record Match)
    var
        PlayerLine: Record "Player Line";
    begin
        PlayerLine.Reset();
        PlayerLine.SetRange("Match No.", Match."No.");
        PlayerLine.DeleteAll();

        Match.Delete();
    end;
}