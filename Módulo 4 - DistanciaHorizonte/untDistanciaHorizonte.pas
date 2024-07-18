unit untDistanciaHorizonte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmDistanciaHorizonte = class(TForm)
    lblTitle: TLabel;
    edtHeight: TEdit;
    lblHeightLabel: TLabel;
    btnCalculate: TButton;
    lblHorizonDistance: TLabel;
    procedure btnCalculateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDistanciaHorizonte: TfrmDistanciaHorizonte;

implementation

{$R *.dfm}

procedure TfrmDistanciaHorizonte.btnCalculateClick(Sender: TObject);
const
	EARTH_RADIUS_IN_METERS = 6350 * 1000;

var
	height, horizonDistance: Real;

begin
	height := StrToFloat(frmDistanciaHorizonte.edtHeight.Text);

	//The given point, the center of the earth and the visible horizon point
  //determine a right triangle, so the distance is calculated using the
  //pythogorean theorem:

  //distance^2 + radius^2 = (radius + height)^2
  horizonDistance := SQRT(2*EARTH_RADIUS_IN_METERS*height + height*height);


  frmDistanciaHorizonte.lblHorizonDistance.Caption :=
    'A distância de um ponto nessa altura até o horizonte é ' +
    FormatFloat('0.00', horizonDistance) + ' metros';
  frmDistanciaHorizonte.lblHorizonDistance.Visible := True;


end;

end.
