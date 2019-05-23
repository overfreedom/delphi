unit fraAdminManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIFrame, uniLabel,
  uniEdit, uniGUIBaseClasses, uniPanel, ServerModule, uniBasicGrid, uniDBGrid,
  uniDBNavigator, uDMUserManager, Data.DB, uniSplitter, uniButton;

type
  TfraAdminManager = class(TUniFrame)
    undbgrdAdmin: TUniDBGrid;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniDBNavigator1: TUniDBNavigator;
    dsAdmin: TDataSource;
    UniPanel4: TUniPanel;
    UniPanel5: TUniPanel;
    UniPanel6: TUniPanel;
    UniPanel7: TUniPanel;
    undbgrd1: TUniDBGrid;
    undbgrd2: TUniDBGrid;
    UniEdit1: TUniEdit;
    UniPanel8: TUniPanel;
    ubtn1: TUniButton;
    ubtn2: TUniButton;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation


{$R *.dfm}

procedure TfraAdminManager.UniFrameCreate(Sender: TObject);
begin

  DMUserManager.fdqryAdmin.Open();
  var i, j: Integer;
  var remoteip: string;
  remoteip := UniSession.RemoteIP;

  i := 1;
  j := 2;
  UniEdit1.Text := remoteip;
end;

initialization
  RegisterClass(TfraAdminManager);
  ServerModule.FrameClassList.AddPair('管理员账号', 'TfraAdminManager')

end.

