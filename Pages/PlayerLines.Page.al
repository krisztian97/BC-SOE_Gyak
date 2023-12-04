page 50111 "Player Lines"
{
    PageType = List;
    SourceTable = "Player Line";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Match No."; Rec."Match No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Match No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Player Code"; Rec."Player Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Player Code field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field(Team; Rec.Team)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Team field.';
                }
                field(Goals; Rec.Goals)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Goals field.';
                }
            }
        }
    }
}