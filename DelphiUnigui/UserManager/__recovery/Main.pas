unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses,
  uniGUIForm, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniTreeView,
  uniTreeMenu, Vcl.Menus, uniMainMenu, System.ImageList, Vcl.ImgList, uniButton,
  uniPageControl, uniImageList, uniPanel, uniGUIFrame, fraAdminManager, System.Actions,
  Vcl.ActnList, uniSyntaxEditorBase, uniSyntaxEditor;

type
  TMainForm = class(TUniForm)
    umntmMainMenu: TUniMenuItems;
    unmntmN1: TUniMenuItem;
    untvmglstMainMenu: TUniNativeImageList;
    unmntmN2: TUniMenuItem;
    unmntmN3: TUniMenuItem;
    unmntmN4: TUniMenuItem;
    unmntmN5: TUniMenuItem;
    unpgcntrlMain: TUniPageControl;
    unmntmN6: TUniMenuItem;
    unmntmN7: TUniMenuItem;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    untrmnMainMenu: TUniTreeMenu;
    UniPanel3: TUniPanel;
    procedure untrmnMainMenuSelectionChange(Sender: TObject);
    procedure TabSheetClose(Sender: TObject; var AllowClose: Boolean);
    procedure unpgcntrlMainChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, ServerModule;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.TabSheetClose(Sender: TObject; var AllowClose: Boolean);
var
  _n: TUniTreeNode;
begin
  _n := (Sender as TUniTabSheet).Data;
  if _n is TUniTreeNode then
    (_n as TUniTreeNode).Data := nil;

  if unpgcntrlMain.PageCount = 1 then
    untrmnMainMenu.Selected := nil;
end;

procedure TMainForm.unpgcntrlMainChange(Sender: TObject);
var
  _t: TUniTabSheet;
  _n: TUniTreeNode;
begin
  _t := unpgcntrlMain.ActivePage;
  if Assigned(_t) then
  begin
    _n := _t.Data;
    untrmnMainMenu.Selected := _n;
  end;
end;

procedure TMainForm.untrmnMainMenuSelectionChange(Sender: TObject);
var
  _n: TUniTreeNode;
  _t: TUniTabSheet;
  _frc: TUniFrameClass;
  _fr: TUniFrame;
begin
  _n := untrmnMainMenu.Selected;
  if Assigned(_n) and _n.IsLeaf then
  begin
    if _n.Data = nil then
    begin
      _t := TUniTabSheet.Create(Self);
      _t.PageControl := unpgcntrlMain;
      _t.Caption := _n.Text;
      _t.Closable := True;
      _t.OnClose := TabSheetClose;
      _t.Layout := 'fit';
      if not FrameClassList.Values[_n.Text].IsEmpty then
      begin
        _frc := TUniFrameClass(FindClass(FrameClassList.Values[_n.Text]));
        _fr := _frc.Create(Self);
        _fr.Layout := 'fit';
        _fr.Align := alClient;
        _fr.Parent := _t;
      end;
      _t.Data := _n;
      _n.Data := _t;
    end
    else
    begin
      _t := _n.Data;
    end;
    unpgcntrlMain.ActivePage := _t;
  end;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.

