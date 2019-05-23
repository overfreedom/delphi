unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses,
  uniGUIForm, uniButton, uniGUIBaseClasses, uniSyntaxEditorBase,
  uniSyntaxEditorEx;

type
  TMainForm = class(TUniForm)
    unsyntxdtx1: TUniSyntaxEditEx;
    ubtn1: TUniButton;
    ubtn2: TUniButton;
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
  uniGUIVars, MainModule, uniGUIApplication, uniGUIUtils, uniLogger;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.ubtn1Click(Sender: TObject);
begin

  with unsyntxdtx1.lines do
  begin
    BeginUpdate;
    Clear;
    Add('BaseURL:' + UniSession.BaseURL);
    Add('DataModules.Count:' + UniSession.DataModules.Count.ToString);
    Add('FormsList.Count:' + UniSession.FormsList.Count.ToString);
    Add('FormsList[0].UnitName:' + TUniForm(UniSession.FormsList[0]).UnitName);
    //返回请求http标头（header）的HTTP_X_FORWARDED_FOR值，一般是请求的IP地址，如果该请求是通过代理转发的
    //某些代理会把原请求的IP地址写进HTTP_X_FORWARDED_FOR，否则就是代理的IP地址
    Add('ForwardedIP:' + UniSession.ForwardedIP);
    Add('FullUniPath:' + UniSession.FullUniPath);
    Add('URLPath:' + UniSession.URLPath);
    Add('UniPath:' + UniSession.UniPath);
    //从请求头Host参数提取出来的
    Add('Host:' + UniSession.Host);
    Add('IsDesktop:' + UniSession.IsDesktop.ToString());
    Add('IsIE:' + UniSession.IsIE.ToString());
    Add('IsAjax:' + UniSession.IsAjax.ToString());
    Add('IsPhone:' + UniSession.IsPhone.ToString());
    Add('IsTerminated:' + UniSession.IsTerminated.ToString());
    Add('ServerMonitor:' + UniSession.ServerMonitor.ToString());
    Add('SSL:' + UniSession.SSL.ToString());
//    It reports if the active theme is using borders (as a window) or not (as a page).
    Add('ThemeBorderless:' + UniSession.ThemeBorderless.ToString());
    Add('UserAgent:' + UniSession.UserAgent);
    Add('UrlReferer:' + UniSession.UrlReferer);
    Add('UserData:' + UniSession.UserData.ToString);
    UniSession.AddCustomFile('test.css');
//    UniSession.AddException(unsyntxdtx1, EPathTooLongException.Create('??how to use'));
    UniSession.AddJS('alert("hell")');
//    UniSession.AddToComponentCleanup(unsyntxdtx1); //浏览器清掉了控件
//    UniSession.AfterConstruction;
    UniSession.AfterCreateJS('aftercreatejs','alert("after createjs")');
//    UniSession.AfterHandleRequest;
    Add('AllowSynchronousOps:' + UniSession.AllowSynchronousOps.ToString());
//    UniSession.BeforeHandleRequest;
    UniSession.BrowserWindow('http://www.baidu.com', 200, 200, '?search=1+1');
//    UniSession.CallbackTarget('');
//    UniSession.CallbackUrl();
//    UniSession.CallbackUrlBase64();
//    UniSession.CallbackUrlEx();
    UniSession.Log('hell wold log');  //路径下的log目录 写log
//    UniSession.JSONDirect('{"name":"milkon"}');
//    UniSession.LockSession;
//    UniSession.ReleaseSession;
//    UniSession.ResetEvent;
    UniSession.SendFile('e:\\test.html');   //发文件，浏览器下载
//    UniSession.SendResponse('responsestr send');
//    UniSession.SendStream();
//    UniSession.SetAuxPath('??');
//    UniSession.SetStressTestMode;
    Add('UniVersion:' + UniSession.UniVersion);
    UniSession.ShowAlert('show alert');
//    UniSession.UrlRedirect('http://www.qq.com');
    EndUpdate;
  end;
end;

procedure TMainForm.ubtn2Click(Sender: TObject);
var
  _logger: TUniLogger;
begin
  with unsyntxdtx1.Lines do
  try
    _logger := TUniLogger.Create(nil);
    BeginUpdate;
    Clear;
    FormatSettings.ShortTimeFormat := 'yyyy-mm-dd';
    _logger.RootPath:= 'e:\\';
    _logger.Path := 'log';
    _logger.AddLog('normal','logtest');
    uniGUIUtils.EmptyFolder('E:\\test\',True,_logger);
//    ArrangeVCLTabs();
    Add('IsUniCmpInstance(unsyntxdtx1):'+IsUniCmpInstance(unsyntxdtx1).ToString());
    Add('uniFileStreamToHash'+ uniFileStreamToHash('e:\\test.html'));

    EndUpdate;
  finally
    FreeAndNil(_logger);
  end;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.

