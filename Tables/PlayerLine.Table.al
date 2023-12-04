table 50102 "Player Line"
{
    fields
    {
        field(1; "Match No."; Code[20])
        {
            Caption = 'Match No.';
            DataClassification = CustomerContent;
            TableRelation = Match;
            Editable = false;
        }
        field(2; Position; Enum Position)
        {
            Caption = 'Position';
            DataClassification = CustomerContent;
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(4; Team; Enum Team)
        {
            Caption = 'Team';
            DataClassification = CustomerContent;

        }
        field(5; Goals; Integer)
        {
            Caption = 'Goals';
            DataClassification = CustomerContent;
        }
        field(6; "Player Code"; Code[20])
        {
            Caption = 'Player Code';
            DataClassification = CustomerContent;
            TableRelation = Player.Code;

            trigger OnValidate()
            var
                Player: Record Player;
            begin
                if Player.Get(Rec."Player Code") then;
                Rec.Position := Player.Position;
                CheckForMultiplePlayer();
            end;
        }
    }
    keys
    {
        key(Key1; "Match No.", "Line No.")
        {
            Clustered = true;
        }
    }
    var
        AlreadyExistErr: Label 'The player is already on the other team!';

    local procedure CheckForMultiplePlayer()
    var
        PlayerLine: Record "Player Line";
    begin
        PlayerLine.Reset();
        PlayerLine.SetFilter("Match No.", Rec."Match No.");
        PlayerLine.SetFilter("Player Code", Rec."Player Code");
        if not PlayerLine.IsEmpty then
            Error(AlreadyExistErr);
    end;
}