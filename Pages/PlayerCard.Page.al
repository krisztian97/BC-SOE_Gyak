page 50100 "Player Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = Player;
    Caption = 'Player Card';
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }
}