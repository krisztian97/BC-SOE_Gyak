codeunit 50102 "Match Mgt."
{
    procedure InitNo(var Match: Record Match)
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if Match."No." = '' then begin
            if SalesReceivablesSetup.Get() then;
            SalesReceivablesSetup.TestField("Match Nos. Series");
            Match."No." := NoSeriesMgt.GetNextNo(SalesReceivablesSetup."Match Nos. Series", Today, true);
        end;
    end;
}