table 50103 "Posted Match"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(2; Date; Date)
        {
            Caption = 'Date';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(3; "Home Team"; Text[100])
        {
            Caption = 'Home Team';
            Editable = false;
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(4; "Guest Team"; Text[100])
        {
            Caption = 'Guest Team';
            Editable = false;
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(5; "Home Team Score"; Integer)
        {
            Caption = 'Home Team Score';
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Player Line".Goals where(Team = const(Team::Home)));
        }
        field(6; "Guest Team Score"; Integer)
        {
            Caption = 'Guest Team Score';
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Player Line".Goals where(Team = const(Team::Guest)));
        }
        field(8; "Posted Date"; Date)
        {
            Caption = 'Posted Date';
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