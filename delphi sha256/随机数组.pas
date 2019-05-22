unit 随机数组;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    btn1: TButton;
    btn2: TButton;
    dbmmo1: TDBMemo;
    btn3: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
    function genRandomStr: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  IdHashSHA, IdSSLOpenSSL, IdSSLOpenSSLHeaders, uIdSSLOpenSSL, System.StrUtils;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  IdOpenSSLSetLibPath('F:\delphi workspace\Win32\Debug');

//  var _rsa_methon : RSA_METHOD;
//  var _prsa: PRSA;


  if  not IdSSLOpenSSLHeaders.Load then
    ShowMessage('can''t Loaded');

//  _rsa_methon.rsa_keygen();
  if TIdHashSHA256.IsAvailable then
  begin

    var txt: string := Edit1.Text;
    var _sha256: TIdHashSHA256;
    _sha256 := TIdHashSHA256.Create;
    txt := _sha256.HashStringAsHex(txt);
    ShowMessage(Length(txt).ToString);
  end;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  btn2.Enabled := False;
  try
    var rs: string;
    rs := genRandomStr;
    with TStringList.Create do
    try
      if FileExists('e:\\1.txt') then
        LoadFromFile('e:\\1.txt');
      Add('随机数：' + rs + '长度：' + length(rs).ToString);
      SaveToFile('e:\\1.txt');
    finally
      Free;
    end;
    dbmmo1.Lines.Add('随机数：' + rs + '长度：' + length(rs).ToString);
  finally
    btn2.Enabled := True;
  end;
//  ShowMessage(randomstr);
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  var str: string := 'aabbcc';
  str := LeftStr(str+ genRandomStr,4);
  ShowMessage(str);
end;

function TForm1.genRandomStr: string;
begin

  const letter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  const num = '0123456789';
  const totalstr = letter + num;
  const totallen = Length(letter + num);
  var randomstr: string := '';

  while (Length(randomstr) < 30) do
  begin
    Randomize;
    randomstr := randomstr + PChar(totalstr)[Random(totallen)];
  end;
  Exit(randomstr);
end;

end.

