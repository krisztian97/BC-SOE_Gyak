tableextension 50100 "Sales  Receivables" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Match Nos. Series"; Code[10])
        {
            Caption = 'Match Nos. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(50101; "Posted Match Nos. Series"; Code[10])
        {
            Caption = 'Posted Match Nos. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}