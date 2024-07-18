program prjMatrizNumerosAleatorios;

uses
  Vcl.Forms,
  untMatrizNumerosAleatorios in 'untMatrizNumerosAleatorios.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
