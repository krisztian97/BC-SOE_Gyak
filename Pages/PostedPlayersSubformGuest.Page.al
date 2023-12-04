page 50107 "Posted Players Subform Guest"
{
    Caption = 'Posted Player Lines Guest';
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Posted Player Line";
     SourceTableView = where(Team = const(Guest));
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
        Rec.Team := Rec.Team::Guest;
    end;
}
