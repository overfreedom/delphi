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
    //��������http��ͷ��header����HTTP_X_FORWARDED_FORֵ��һ���������IP��ַ�������������ͨ������ת����
    //ĳЩ������ԭ�����IP��ַд��HTTP_X_FORWARDED_FOR��������Ǵ����IP��ַ
    Add('ForwardedIP:' + UniSession.ForwardedIP);
    Add('FullUniPath:' + UniSession.FullUniPath);
    Add('URLPath:' + UniSession.URLPath);
    Add('UniPath:' + UniSession.UniPath);
    //������ͷHost������ȡ������
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
//    UniSession.AddToComponentCleanup(unsyntxdtx1); //���������˿ؼ�
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
    UniSession.Log('hell wold log');  //·���µ�logĿ¼ дlog
//    UniSession.JSONDirect('{"name":"milkon"}');
//    UniSession.LockSession;
//    UniSession.ReleaseSession;
//    UniSession.ResetEvent;
    UniSession.SendFile('e:\\test.html');   //���ļ������������
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

