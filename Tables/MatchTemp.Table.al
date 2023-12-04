table 50105 "Match Temp"
{
    TableType = Temporary;
    fields
    {
        field(1; Entry; Integer)
        {
            Caption = 'Entry';
            DataClassification = ToBeClassified;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(4; "Home Team"; Code[20])
        {
            Caption = 'Home Team';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(5; "Guest Team"; Code[20])
        {
            Caption = 'Guest Team';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(6; "Home Team Score"; Integer)
        {
            Caption = 'Home Team Score';
            FieldClass = FlowField;
            CalcFormula = Sum("Player Line".Goals where(Team = const(Team::Home)));
        }
        field(7; "Guest Team Score"; Integer)
        {
            Caption = 'Guest Team Score';
            FieldClass = FlowField;
            CalcFormula = Sum("Player Line".Goals where(Team = const(Team::Guest)));
        }
        field(8; Status; Enum "Status")
        {
            Caption = 'Status';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(9; "Match Name"; Text[100])
        {
            Caption = 'Match Name';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; Entry)
        {
            Clustered = true;
        }
    }
}