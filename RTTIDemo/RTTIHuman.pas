unit RTTIHuman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RTTI,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//  THuman = class(TForm)
//  public
//    name: string;
//    age: Integer;
//    constructor Create;
//  end;

//procedure CreateInstance();

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ THuman }

//constructor THuman.Create;
//begin
//  name := 'john';
//  age := 18;
//end;

procedure CreateInstance();
var
  someclass: TClass;
  c: TRttiContext;
  t: TRttiType;
  v: TValue;
//  human1, human2, human3: THuman;
begin
//  someclass:= THuman;

  // Invoke RTTI
  c:= TRttiContext.Create;
  t:= c.GetType(someclass);

  // Variant 1a - instantiates a THuman object but calls constructor of TObject
//  human1:= THuman(t.AsInstance.MetaclassType.Create);

  // Variant 1b - same result as 1a
//  human2:= THuman(someclass.Create);

  // Variant 2 - works fine
  v:= t.GetMethod('Create').Invoke(t.AsInstance.MetaclassType,[]);
//  human3:= THuman(v.AsObject);

  // free RttiContext record (see text below) and the rest
  c.Free;

//  human1.Destroy;
//  human2.Destroy;
//  human3.Destroy;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  CreateInstance;
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  someclass: TClass;
  c: TRttiContext;
  t: TRttiType;
  intance: TRttiInstanceType;
  v: TValue;
  name,age: TValue;
begin
  c := TRttiContext.Create;
  t := c.FindType('uHuman.THuman');
  intance := t as TRttiInstanceType;
//  v := t.GetMethod('Create').Invoke(t.AsInstance.MetaclassType, []);
  v := intance.GetMethod('Create').Invoke(intance.MetaclassType, []);
  age := Tvalue.
  age := intance.GetField('age').SetValue(v.AsObject,);

  name := intance.GetField('name').GetValue(v.AsObject);
  ShowMessage(name.ToString);
  FreeAndNil(t);
  c.Free;
end;

end.

