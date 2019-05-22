unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TForm1 = class(TForm)
    medtorginStr: TMaskEdit;
    medtPar: TMaskEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TButton;
    procedure FormCreate(Sender: TObject);
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
  System.RegularExpressions;

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  if TRegEx.IsMatch(medtorginStr.Text,medtPar.Text) then
    ShowMessage('match')
  else
    ShowMessage('not match');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//  var str: string :='5,4,14,15,53,121,32,121,342,21,12,1,22';
//  const pattern = '^2,|,2,|,2$';
//  if TRegEx.IsMatch(str,pattern) then
//    ShowMessage('match')
//  else
//    ShowMessage('not match');
end;

end.
