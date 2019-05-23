unit uDMUserManager;

interface

uses
  SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait;

type
  TDMUserManager = class(TDataModule)
    fdqryAdmin: TFDQuery;
    fdqryDeveloper: TFDQuery;
    fdconUserManangerDemo: TFDConnection;
    fdqrysys_user: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function UserVerifitcation(userid, pwd: string; err: string = ''): Boolean;
  end;

function DMUserManager: TDMUserManager;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule, IdHashSHA, IdSSLOpenSSLHeaders,
  System.StrUtils;

function DMUserManager: TDMUserManager;
begin
  Result := TDMUserManager(UniMainModule.GetModuleInstance(TDMUserManager));
end;

function TDMUserManager.UserVerifitcation(userid, pwd: string; err: string = ''): Boolean;
begin
  fdqrysys_user.Close;
  fdqrysys_user.ParamByName('user_id').AsString := userid;
  fdqrysys_user.Open();

  if fdqrysys_user.RecordCount = 0 then
    Exit(False);

  var _salt, _pwd_sha256, pwd_shaed: string;
  _pwd_sha256 := fdqrysys_user.FieldByName('pwd_sha256').AsString;
  _salt := fdqrysys_user.FieldByName('pwd_salt').AsString;
  var _sha256: TIdHashSHA256;
  var _rsa_method: RSA_METHOD;
  IdSSLOpenSSLHeaders.Load;
  var _prsa: PRSA;

  _rsa_method.rsa_keygen();
  if not TIdHashSHA256.IsAvailable then
  begin
    err := '加载sha256dll失败';
    Exit(False);
  end;

  _sha256 := TIdHashSHA256.Create;
  pwd_shaed := _sha256.HashStringAsHex(LeftStr(pwd + _salt, 256));

  if pwd_shaed.Equals(_pwd_sha256) then
    Exit(True);
  Result := False;
end;

initialization
  RegisterModuleClass(TDMUserManager);

end.

