unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses,
  uniGUIForm, uniGUIBaseClasses, uniButton, uniMemo;

type
  TMainForm = class(TUniForm)
    ubtn1: TUniButton;
    unm1: TUniMemo;
    ubtn2: TUniButton;
    unm2: TUniMemo;
    procedure ubtn1Click(Sender: TObject);
    procedure ubtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.ubtn1Click(Sender: TObject);
begin
  for var i := 0 to 1000 do
  begin
    with TFDquery.Create(nil) do
    try
      var fdcon := TFDConnection.Create(nil);
      try
        fdcon.ConnectionDefName := 'MSSQL_Pool';
        var bgtick: Cardinal := GetTickCount;
        if not fdcon.Connected then
          fdcon.Connected := True;

        Connection := fdcon;
        Open('SELECT * FROM s_user');
        unm1.Lines.Add('第' + i.ToString + '次，用时' + (GetTickCount - bgtick).ToString);
        fdcon.Connected := False;
      finally
        FreeAndNil(fdcon);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TMainForm.ubtn2Click(Sender: TObject);
begin
  for var i := 0 to 1000 do
  begin
    with TFDquery.Create(nil) do
    begin
      var bgtick: Cardinal := GetTickCount;
      if not UniMainModule.fdcon2.Connected then
        UniMainModule.fdcon2.Connected := True;
      try
        Connection := UniMainModule.fdcon2;
        Open('SELECT * FROM s_user');
        unm2.Lines.Add('第' + i.ToString + '次，用时' + (GetTickCount - bgtick).ToString);
      finally
        UniMainModule.fdcon2.Connected := False;
      end;
    end;
  end;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.

