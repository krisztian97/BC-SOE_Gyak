page 50109 "Posted Match List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Posted Match";
    CardPageId = "Posted Match";
    UsageCategory = Lists;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
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
                field("Match Name"; CreateMatchName())
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
                    ApplicationArea = All;
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

    local procedure CreateMatchName(): Text
    begin
        exit(Rec."Home Team" + ' | ' + Rec."Guest Team");
    end;
}