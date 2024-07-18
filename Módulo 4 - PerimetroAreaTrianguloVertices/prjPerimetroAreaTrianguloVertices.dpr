program prjPerimetroAreaTrianguloVertices;

uses
  Vcl.Forms,
  untPerimetroAreaTrianguloVertices in 'untPerimetroAreaTrianguloVertices.pas' {frmMyForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMyForm, frmMyForm);
  Application.Run;
end.
