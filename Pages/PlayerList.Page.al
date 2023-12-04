page 50103 "Player List"
{
    PageType = List;
    ApplicationArea = All;
    CardPageId = "Player Card";
    SourceTable = Player;
    Editable = false;
    UsageCategory = Lists;
    RefreshOnActivate = true;
    layout
    {
        area(Content)
        {
            repeater(List)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Position field.';
                }
            }
        }
    }

}