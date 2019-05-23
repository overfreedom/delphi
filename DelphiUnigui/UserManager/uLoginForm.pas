unit uLoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses,
  uniGUIForm, uniButton, uniLabel, uniGUIBaseClasses, uniEdit, uniDBEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TUniLoginForm1 = class(TUniLoginForm)
    unlbl1: TUniLabel;
    unlbl2: TUniLabel;
    ubtn1: TUniButton;
    ubtn2: TUniButton;
    undtuser_id: TUniEdit;
    undtpwd: TUniEdit;
    procedure ubtn2Click(Sender: TObject);
    procedure ubtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniLoginForm1: TUniLoginForm1;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uRegisterForm, uDMUserManager;

function UniLoginForm1: TUniLoginForm1;
begin
  Result := TUniLoginForm1(UniMainModule.GetFormInstance(TUniLoginForm1));
end;

procedure TUniLoginForm1.ubtn1Click(Sender: TObject);
begin
  var err: string;
  if DMUserManager.UserVerifitcation(undtuser_id.Text,undtpwd.Text, err) then
  begin
    ShowMessage('登录成功');
    ModalResult := mrOk;
    exit;
  end;

  if err.IsEmpty then
    ShowMessage('用户名/密码错误')
  else
    showmessage(err);
end;

procedure TUniLoginForm1.ubtn2Click(Sender: TObject);
begin
   RegisterForm.ShowModal();
end;


initialization
  RegisterAppFormClass(TUniLoginForm1);

end.

