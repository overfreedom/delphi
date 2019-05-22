program RTTIDemo;
{$STRONGLINKTYPES ON}
uses
  Vcl.Forms,
  RTTIHuman in 'RTTIHuman.pas' {Form1},
  uHuman in 'uHuman.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
