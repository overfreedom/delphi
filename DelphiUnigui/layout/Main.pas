unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniButton, uniGUIBaseClasses,
  uniPanel, uniBitBtn, UniFSButton, uniMultiItem, uniComboBox, uniEdit;

type
  TMainForm = class(TUniForm)
    UniPanel3: TUniPanel;
    UniPanel1: TUniPanel;
    undtVerifyURL: TUniEdit;
    undtVerifyPort: TUniEdit;
    UniPanel2: TUniPanel;
    undt1: TUniEdit;
    undt2: TUniEdit;
    uncmbx_Lang: TUniComboBox;
    undtIntfPort: TUniEdit;
    fsbtnConfirm: TUniFSButton;
    undtIntfURL: TUniEdit;
    undtIntfPwd: TUniEdit;
    undtIntfUser: TUniEdit;
    procedure UniFormReady(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
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

procedure TMainForm.UniFormAfterShow(Sender: TObject);
begin
  UniSession.SendResponse(Format('document.getElementById("%s").style["padding"]="50px"',[UniPanel1.JSId]));
end;

procedure TMainForm.UniFormReady(Sender: TObject);
begin
  ShowMessage(UniPanel2.JSId);

end;

initialization
  RegisterAppFormClass(TMainForm);

end.
