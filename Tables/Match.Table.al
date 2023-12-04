table 50101 Match
{
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; Date; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(3; "Home Team"; Code[20])
        {
            Caption = 'Home Team';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(4; "Guest Team"; Code[20])
        {
            Caption = 'Guest Team';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(5; "Home Team Score"; Integer)
        {
            Caption = 'Home Team Score';
            FieldClass = FlowField;
            CalcFormula = Sum("Player Line".Goals where(Team = const(Team::Home)));
        }
        field(6; "Guest Team Score"; Integer)
        {
            Caption = 'Guest Team Score';
            FieldClass = FlowField;
            CalcFormula = Sum("Player Line".Goals where(Team = const(Team::Guest)));
        }
        field(7; Status; Enum "Status")
        {
            Caption = 'Status';
            Editable = false;
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
}