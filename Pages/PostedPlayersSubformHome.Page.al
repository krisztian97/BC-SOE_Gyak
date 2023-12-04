page 50104 "Posted Players Subform Home"
{
    Caption = 'Posted Player Lines Home';
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Posted Player Line";
    SourceTableView = where(Team = const(Home));
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
                field("Player Code"; Rec."Player Code")
                {
                    ApplicationArea = All;
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
                    ToolTip = 'Specifies the value of the Goals field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Team := Rec.Team::Home;
    end;
}