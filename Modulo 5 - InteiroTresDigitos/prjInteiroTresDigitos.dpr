program prjInteiroTresDigitos;

uses
  Vcl.Forms,
  untInteiroTresDigitos in 'untInteiroTresDigitos.pas' {frmMyForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMyForm, frmMyForm);
  Application.Run;
end.
