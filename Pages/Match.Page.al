page 50101 Match
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = Match;
    Caption = 'Match';
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
                    Editable = DynamicEditableCard;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Date"; Rec.Date)
                {
                    ApplicationArea = All;
                    Editable = DynamicEditableCard;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            grid(Score)
            {
                field("Home Team"; Rec."Home Team")
                {
                    ApplicationArea = All;
                    Editable = DynamicEditableCard;
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
                    Editable = DynamicEditableCard;
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
                part("Player Lines Home"; "Players Subform Home")
                {
                    ApplicationArea = All;
                    Enabled = DynamicEditableSubForm;
                    SubPageLink = "Match No." = FIELD("No.");
                    UpdatePropagation = Both;
                }
                part("Player Lines Guest"; "Players Subform Guest")
                {
                    ApplicationArea = All;
                    Enabled = DynamicEditableSubForm;
                    SubPageLink = "Match No." = FIELD("No.");
                    UpdatePropagation = Both;
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(PostAction)
            {
                ApplicationArea = All;
                PromotedCategory = Process;
                Promoted = true;
                Caption = 'Post';
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                var
                    PostingMatchMgt: Codeunit "Posting Match Mgt.";
                begin
                    PostingMatchMgt.Posting(Rec);
                end;
            }
            action(ReleaseAction)
            {
                ApplicationArea = All;
                PromotedCategory = Process;
                Promoted = true;
                Caption = 'Release';
                ToolTip = 'Executes the Release action.';
                trigger OnAction()
                begin
                    Release();
                end;
            }
            action(ReopenAction)
            {
                ApplicationArea = All;
                PromotedCategory = Process;
                Promoted = true;
                Caption = 'Open';
                ToolTip = 'Executes the Open action.';
                trigger OnAction()
                begin
                    Reopen();
                end;
            }
            action(RunReport)
            {
                ApplicationArea = All;
                PromotedCategory = Process;
                Promoted = true;
                Caption = 'Report';
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                var
              //      MatchReport: Report "Match Report";
                begin
                    CurrPage.SetSelectionFilter(Rec);
                  //  MatchReport.SetTableView(Rec);
                    //MatchReport.Run();
                end;
            }
        }
    }
    var
        [InDataSet]
        DynamicEditableSubForm: Boolean;
        DynamicEditableCard: Boolean;


    trigger OnAfterGetCurrRecord()
    begin
        if Rec.Status = Rec.Status::Open then begin
            DynamicEditableCard := true;
            DynamicEditableSubForm := true;
        end;
    end;

    local procedure Release()
    begin
        if Rec.Status = Rec.Status::Open then begin
            Rec.Status := Rec.Status::Closed;
            DynamicEditableCard := false;
            DynamicEditableSubForm := false;
            CurrPage.Update();
        end;
    end;

    local procedure Reopen()
    begin
        if Rec.Status = Rec.Status::Closed then begin
            Rec.Status := Rec.Status::Open;
            DynamicEditableCard := true;
            DynamicEditableSubForm := true;
            CurrPage.Update();
        end;
    end;
}