unit ufraDeveloperManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, ServerModule, uniDBNavigator, Data.DB,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniTreeView;

type
  TfraDeveloperManager = class(TUniFrame)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniTreeView1: TUniTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  RegisterClass(TfraDeveloperManager);
  ServerModule.FrameClassList.AddPair('¿ª·¢ÕßÕËºÅ', 'TfraDeveloperManager')


end.
