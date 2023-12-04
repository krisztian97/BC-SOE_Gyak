codeunit 50101 "Match Handler"
{
    [EventSubscriber(ObjectType::Table, Database::Match, 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnBeforeInsertEvent(var Rec: Record Match)
    var
        MatchMgt: Codeunit "Match Mgt.";
    begin
        MatchMgt.InitNo(Rec);
    end;
}