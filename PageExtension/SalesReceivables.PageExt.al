pageextension 50100 "Sales Receivables" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter(Prices)
        {
            group(Match)
            {
                field("Match Nos. Series"; Rec."Match Nos. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Match Nos. Series field.';
                }
                field("Posted Match Nos. Series"; Rec."Posted Match Nos. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Match Nos. Series field.';
                }
            }
        }
    }
}
