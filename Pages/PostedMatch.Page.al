page 50106 "Posted Match"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Posted Match";
    Caption = 'Posted Match';
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {

            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Date"; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
            }
            grid(Score)
            {
                field("Home Team"; Rec."Home Team")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Home Team field.';
                }
                field("Home Team Score"; Rec."Home Team Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Home Team Score field.';
                }
                field("Guest Team"; Rec."Guest Team")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Guest Team field.';
                }
                field("Guest Team Score"; Rec."Guest Team Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Guest Team Score field.';
                }
            }
            grid("Player Lines")
            {
                part("Posted Player Lines Home"; "Posted Players Subform Home")
                {
                    ApplicationArea = All;
                    SubPageLink = "Match No." = FIELD("No.");
                    UpdatePropagation = Both;
                    Editable = false;
                }
                part("Posted Player Lines Guest"; "Posted Players Subform Guest")
                {
                    ApplicationArea = All;
                    SubPageLink = "Match No." = FIELD("No.");
                    UpdatePropagation = Both;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

        }
    }
}