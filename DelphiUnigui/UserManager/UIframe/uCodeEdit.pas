unit uCodeEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniSyntaxEditorBase,
  uniSyntaxEditorEx;

type
  TUniFrame2 = class(TUniFrame)
    UniSyntaxEditEx1: TUniSyntaxEditEx;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



end.
