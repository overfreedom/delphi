unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DBClient, Datasnap.Provider;

type
  TUniMainModule = class(TUniGUIMainModule)
    fdconYLDB: TFDConnection;
    fdqryAccount: TFDQuery;

    DBillPre1: TDataSource;
    dsp1: TDataSetProvider;
    cds1: TClientDataSet;
    fdmngrConnection: TFDManager;
  private
    { Private declarations }
  public
    { Public declarations }
    function getRandomStr(len: Integer): string;

  end;

function UniMainModule: TUniMainModule;



implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

function TUniMainModule.getRandomStr(len: Integer): string;
begin
  const letter = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  const num = '0123456789';
  const totalstr = letter + num;
  const totallen = Length(letter + num);
  var randomstr: string := '';


  while (Length(randomstr) < len) do
  begin
    Randomize;
    randomstr := randomstr + PChar(totalstr)[Random(totallen)]; //必须把string转成pchar，否则随机到0得到的是#0
  end;
  Exit(randomstr);
end;



initialization
  RegisterMainModuleClass(TUniMainModule);
end.
