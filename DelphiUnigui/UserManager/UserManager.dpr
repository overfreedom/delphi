program UserManager;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  fraAdminManager in 'fraAdminManager.pas' {UniFrame1: TUniFrame},
  ufraDeveloperManager in 'ufraDeveloperManager.pas' {fraDeveloperManager: TUniFrame},
  uDMUserManager in 'uDMUserManager.pas' {DMUserManager: TDataModule},
  uLoginForm in 'uLoginForm.pas' {UniLoginForm1: TUniLoginForm},
  uRegisterForm in 'uRegisterForm.pas' {RegisterForm: TUniForm},
  uCodeEdit in 'UIframe\uCodeEdit.pas' {UniFrame2: TUniFrame};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
