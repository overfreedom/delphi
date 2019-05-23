unit uRegisterForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uDMUserManager,
  uniButton, uniLabel, uniGUIBaseClasses, uniEdit, uniDBEdit, Data.DB,
  MainModule, IdHashSHA, IdSSLOpenSSL, IdSSLOpenSSLHeaders;

type
  TRegisterForm = class(TUniForm)
    ds1: TDataSource;
    undbdtemail: TUniDBEdit;
    unlbl1: TUniLabel;
    undbdtuser_id: TUniDBEdit;
    unlbl2: TUniLabel;
    undbdtphone: TUniDBEdit;
    unlbl3: TUniLabel;
    undbdtuser_name: TUniDBEdit;
    unlbl4: TUniLabel;
    undbdtpwd_sha256: TUniDBEdit;
    unlbl5: TUniLabel;
    ubtn1: TUniButton;
    procedure UniFormCreate(Sender: TObject);
    procedure ubtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function RegisterForm: TRegisterForm;

implementation

uses
  uniGUIApplication, System.StrUtils;

{$R *.dfm}
function RegisterForm: TRegisterForm;
begin
  Result := TRegisterForm(UniMainModule.GetFormInstance(TRegisterForm));
end;

procedure TRegisterForm.ubtn1Click(Sender: TObject);
begin
  try

    var _sha256: TIdHashSHA256;
    _sha256 := TIdHashSHA256.Create;
    var pwd_sha256: string;
    if not LoadOpenSSLLibrary then
    begin
      ShowMessage('º”‘ÿdll ß∞‹°£');
      Exit;
    end;
    if IdSSLOpenSSLHeaders.Load then
    begin
      pwd_sha256 := DMUserManager.fdqrysys_user.FieldByName('pwd_sha256').AsString;
      DMUserManager.fdqrysys_user.FieldByName('pwd_salt').AsString := UniMainModule.getRandomStr(256);
      DMUserManager.fdqrysys_user.FieldByName('pwd_sha256').AsString := _sha256.HashStringAsHex(LeftStr(pwd_sha256 + DMUserManager.fdqrysys_user.FieldByName('pwd_salt').AsString,256));
    end;

    DMUserManager.fdqrysys_user.Post;
    showmessage('◊¢≤·≥…π¶');
    ModalResult := mrOk;
  except
    ShowMessage('something wrong on post!')
  end;

end;

procedure TRegisterForm.UniFormCreate(Sender: TObject);
begin
  with uDMUserManager.DMUserManager.fdqrysys_user do
  begin
    Close;
    Params.ParamByName('user_id').AsString := '-9999';
    Open;
    Append;
  end;

end;

end.

