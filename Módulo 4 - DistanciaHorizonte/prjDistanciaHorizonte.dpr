program prjDistanciaHorizonte;

uses
  Vcl.Forms,
  untDistanciaHorizonte in 'untDistanciaHorizonte.pas' {frmDistanciaHorizonte};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDistanciaHorizonte, frmDistanciaHorizonte);
  Application.Run;
end.
