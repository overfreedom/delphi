unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses,
  uniGUIForm, uniGUIBaseClasses, uniSyntaxEditorBase, uniSyntaxEditorEx,
  uniSyntaxEditor, uniEdit, uSynEditExport, uSynExportHTML, uniButton, uniBitBtn,
  uniMenuButton, uniMemo;

type
  TMainForm = class(TUniForm)
    unsyntxdtx1: TUniSyntaxEditEx;
    ubtn1: TUniButton;
    ubtn2: TUniButton;
    undt1: TUniEdit;
    ubtn3: TUniButton;
    ubtn4: TUniButton;
    unm1: TUniMemo;
    procedure ubtn3Click(Sender: TObject);
    procedure ubtn4Click(Sender: TObject);
    procedure UniFormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure unsyntxdtx1AjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure UniFormShow(Sender: TObject);
  private
    procedure codeSave;
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.ubtn3Click(Sender: TObject);
begin
  codeSave();
end;

procedure TMainForm.ubtn4Click(Sender: TObject);
begin
  ShowMessage('compile');
end;

procedure TMainForm.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  unm1.Lines.Add(Format('%d', [Key]));
end;

procedure TMainForm.UniFormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F9 then
  begin
    ubtn4.Click;
  end;
  if (Char(Key) in ['S', 's']) and (ssCtrl in Shift) then
  begin
    ubtn3.Click;
  end;

end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
  unsyntxdtx1.OnKeyDown := EditKeyDown;
end;

procedure TMainForm.codeSave();
begin
  ShowMessage('save' + #10#13 + unsyntxdtx1.Lines.Text);
end;

procedure TMainForm.unsyntxdtx1AjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
begin

  unm1.Lines.Add(Format('%s, %s, %s', [Sender.Name,EventName,Params.Text]));
  if EventName = 'codeSave' then
    codeSave()
end;

initialization
  RegisterAppFormClass(TMainForm);

end.

