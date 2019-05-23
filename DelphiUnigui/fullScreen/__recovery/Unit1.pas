unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniButton, uniLabel,
  uniGUIBaseClasses, uniEdit, uniDBEdit;

type
  TUniLoginForm1 = class(TUniLoginForm)
    UniDBEdit1: TUniDBEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    procedure UniLoginFormAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniLoginForm1: TUniLoginForm1;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function UniLoginForm1: TUniLoginForm1;
begin
  Result := TUniLoginForm1(UniMainModule.GetFormInstance(TUniLoginForm1));
end;

procedure TUniLoginForm1.UniLoginFormAjaxEvent(Sender: TComponent;
  EventName: string; Params: TUniStrings);
begin

end;

initialization
  RegisterAppFormClass(TUniLoginForm1);

end.
