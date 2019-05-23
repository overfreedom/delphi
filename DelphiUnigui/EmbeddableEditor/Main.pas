unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses,
  uniSyntaxEditorBase, uniSyntaxEditorEx, Unit1, uniButton;

type
  TMainForm = class(TUniForm)
    ubtn1: TUniButton;
    procedure ubtn1Click(Sender: TObject);
  private
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

procedure TMainForm.ubtn1Click(Sender: TObject);
begin
  UniForm1.ShowModalN;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
