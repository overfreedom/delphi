unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm1 = class(TForm)
    idhtp1: TIdHTTP;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  SynCommons;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  responsestr: string;
  v: Variant;
begin
  responsestr := idhtp1.Get('http://rosscafe.weunit.cn:7123/getid');
  ShowMessage(responsestr);
  VariantLoadJSON(v,responsestr);

  ShowMessage(v.uuid);
end;

end.

