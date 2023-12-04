page 50110 "Matches"
{
    PageType = List;
    SourceTable = "Match Temp";
    SourceTableTemporary = true;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(List)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Match Name"; Rec."Match Name")
                {
                    Caption = 'Match Name';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CreateMatchName() field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Home Team Score"; Rec."Home Team Score")
                {

                    ToolTip = 'Specifies the value of the Home Team Score field.';
                }
                field("Guest Team Score"; Rec."Guest Team Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Guest Team Score field.';
                }

            }
        }
    }
    trigger OnOpenPage()
    begin
        MatchQuery.Open();
        EntryNo := 0;
        while MatchQuery.Read()
         do begin
            EntryNo += 1;
            Rec.Entry := EntryNo;
            Rec."No." := MatchQuery.No_;
            Rec.Date := MatchQuery.Date;
            Rec."Home Team Score" := MatchQuery.Home_Team_Score;
            Rec."Guest Team Score" := MatchQuery.Guest_Team_Score;
            Rec."Home Team Score" := MatchQuery.Home_Team_Score;
            Rec."Match Name" := MatchQuery.Home_Team + ' - ' + MatchQuery.Guest_Team;
            Rec.Insert();
        end;
        MatchQuery.Close();
    end;

    var
        MatchQuery: Query Match;
        EntryNo: Integer;
}