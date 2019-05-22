program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  SysUtils,
  RTTI;

type
  TAttrTest2 = class(TCustomAttribute)
  private
     FId : Integer;
  public
     constructor Create(aID : Integer);
     property ID : Integer read FID write FID;
  end;

  [TAttrTest2(1)]
  [TAttrTest2(2)]
  [TAttrTest2(3)]
  TMyObject = Class(TObject)
  end;

{ TAttrTest2 }

constructor TAttrTest2.Create(aID: Integer);
begin
 FID := aId;
end;

var
 c : TRttiContext;
 t : TRttiType;
 a : TCustomAttribute;
begin
   c := TRttiContext.Create;
   try
     t := c.GetType(TMyObject);
     for a in  t.GetAttributes do
     begin
       Writeln((a as TAttrTest2).ID);
     end;
   finally
     c.Free
   end;
   readln;
end.
