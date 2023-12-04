report 50100 "Match Report"
{
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(Posted; "Posted Match")
        {
            column(No_; "No.")
            {
            }
            column(MatchLbl; MatchLbl)
            {
            }
            column(Date; Date)
            {
            }
            column(Home_Team; "Home Team")
            {
            }
            column(Home_Team_Score; "Home Team Score")
            {
            }
            column(Guest_Team; "Guest Team")
            {
            }
            column(Guest_Team_Score; "Guest Team Score")
            {
            }
            column(Status; Status)
            {
            }
            dataitem(Player_Line; "Player Line")
            {
                DataItemLink = "Match No." = field("No.");
                column(Match_No_; "Match No.")
                {
                }
                column(Line_No_; "Line No.")
                {
                }
                column(Player_Code; "Player Code")
                {
                }
                column(Position; Position)
                {
                }
                column(Team; Team)
                {
                }
                column(Goals; Goals)
                {
                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'src\Reports\MatchReport.rdlc';
        }
    }

    var
        MatchLbl: Label 'Match No.';

}