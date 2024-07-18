unit untPerimetroAreaTrianguloVertices;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Math, Vcl.ExtCtrls;

type
  TfrmMyForm = class(TForm)
    lblTitle: TLabel;
    lblVertice1: TLabel;
    lblVertice2: TLabel;
    lblVertice3: TLabel;
    lblX1: TLabel;
    lblX2: TLabel;
    lblX3: TLabel;
    lblY1: TLabel;
    lblY2: TLabel;
    lblY3: TLabel;
    edtX1: TEdit;
    edtX2: TEdit;
    edtX3: TEdit;
    edtY1: TEdit;
 		edtY2: TEdit;
    edtY3: TEdit;
    btnCalculate: TButton;
    btnClear: TButton;
    lblPerimeter: TLabel;
    lblArea: TLabel;
    Label1: TLabel;
    lblMessage: TLabel;
    pbxDrawing: TPaintBox;
    procedure btnClearClick(Sender: TObject);
    procedure btnCalculateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMyForm: TfrmMyForm;
  x1, y1, x2, y2, x3, y3: Real;

const
  canvasWidth = 300;
	canvasHeight = 300;
  canvasGridSquareSize = 20;

implementation

{$R *.dfm}

procedure GetVerticesValues();
begin
	x1 := StrToFloat(frmMyForm.edtX1.Text);
  y1 := StrToFloat(frmMyForm.edtY1.Text);
  x2 := StrToFloat(frmMyForm.edtX2.Text);
  y2 := StrToFloat(frmMyForm.edtY2.Text);
  x3 := StrToFloat(frmMyForm.edtX3.Text);
  y3 := StrToFloat(frmMyForm.edtY3.Text);
end;

procedure ClearFields();
begin
	frmMyForm.edtX1.Text := '';
  frmMyForm.edtX2.Text := '';
  frmMyForm.edtX3.Text := '';
  frmMyForm.edtY1.Text := '';
  frmMyForm.edtY2.Text := '';
  frmMyForm.edtY3.Text := '';

  frmMyForm.lblMessage.Visible := False;
  frmMyForm.lblPerimeter.Visible := False;
  frmMyForm.lblArea.Visible := False;
end;

function CalcSideLength(x1, y1, x2, y2: Real): Real;
var
	xDiffSquared, yDiffSquared: Real;
begin
  xDiffSquared := Power((x2-x1), 2);
  yDiffSquared := Power((y2-y1), 2);

	Result := sqrt(xDiffSquared + yDiffSquared);
end;

procedure WriteVerticeName(x, y: Real; name: Char);
var yCoordInCanvas: Real;
const letterApproxHeight = 10;
begin
	yCoordInCanvas := canvasHeight - y - letterApproxHeight;

  frmMyForm.pbxDrawing.Canvas.Brush.Color := clSkyBlue;
  frmMyForm.pbxDrawing.Canvas.Font.Size := 12;
  frmMyForm.pbxDrawing.Canvas.Font.Color := clNavy;
	frmMyForm.pbxDrawing.Canvas.TextOut(
  	trunc(x),
    trunc(yCoordInCanvas),
  	name);
end;

procedure WriteSideLength(x1, y1, x2, y2: Real);
var
	sideLength: Real;
  middlePointX, middlePointY: Integer;
begin
	sideLength := CalcSideLength(x1, y1, x2, y2);
  middlePointX := trunc((x1 + x2) / 2);
  middlePointY := trunc((y1 + y2) / 2);

  frmMyForm.pbxDrawing.Canvas.Brush.Color := clSkyBlue;
  frmMyForm.pbxDrawing.Canvas.Font.Size := 10;
  frmMyForm.pbxDrawing.Canvas.Font.Color := clRed;
	frmMyForm.pbxDrawing.Canvas.TextOut(
  	middlePointX,
    canvasHeight - middlePointY,
  	FormatFloat('0.00', sideLength));
end;

function CalcPerimeter() : Real;
var
	side1, side2, side3: Real;

begin
	GetVerticesValues();

	side1 := CalcSideLength(x1, y1, x2, y2);
  side2 := CalcSideLength(x1, y1, x3, y3);
  side3 := CalcSideLength(x2, y2, x3, y3);

  Result := side1 + side2 + side3;
end;

function CalcArea(): Real;
begin
	GetVerticesValues();

	Result := 1/2 * abs( x1*(y2 - y3) + x2*(y3 - y1) + x3*(y1 - y2) );
end;

procedure ClearCanvas();
begin
	frmMyForm.pbxDrawing.Canvas.Pen.Color := clWhite;
  frmMyForm.pbxDrawing.Canvas.Brush.Color := clWhite;
	frmMyForm.pbxDrawing.Canvas.Rectangle(0, 0, canvasWidth, canvasHeight);
end;

procedure DrawCanvasGrid();
var
 	numberOfSquares, counter : Integer;
begin
	numberOfSquares := trunc(canvasWidth / canvasGridSquareSize);

  frmMyForm.pbxDrawing.Canvas.Pen.Color := clBlack;
  frmMyForm.pbxDrawing.Canvas.Pen.Width := 1;

  //horizontal lines
	for counter := 0 to numberOfSquares+1 do
  begin
  	frmMyForm.pbxDrawing.Canvas.MoveTo(0, counter*canvasGridSquareSize);
    frmMyForm.pbxDrawing.Canvas.LineTo(300, counter*canvasGridSquareSize);
  end;

  //vertical lines
  for counter := 0 to numberOfSquares+1 do
  begin
  	frmMyForm.pbxDrawing.Canvas.MoveTo(counter*canvasGridSquareSize, 0);
    frmMyForm.pbxDrawing.Canvas.LineTo(counter*canvasGridSquareSize, 300);
  end;
end;

procedure DrawTriangle();
begin
	GetVerticesValues();

  frmMyForm.pbxDrawing.Canvas.Pen.Color := clRed;
  frmMyForm.pbxDrawing.Canvas.Pen.Width := 3;

	frmMyForm.pbxDrawing.Canvas.MoveTo(trunc(x1), trunc(canvasHeight - y1));
	frmMyForm.pbxDrawing.Canvas.LineTo(trunc(x2), trunc(canvasHeight - y2));
  WriteSideLength(x1, y1, x2, y2);

  frmMyForm.pbxDrawing.Canvas.MoveTo(trunc(x2), trunc(canvasHeight - y2));
	frmMyForm.pbxDrawing.Canvas.LineTo(trunc(x3), trunc(canvasHeight - y3));
  WriteSideLength(x2, y2, x3, y3);

  frmMyForm.pbxDrawing.Canvas.MoveTo(trunc(x3), trunc(canvasHeight - y3));
	frmMyForm.pbxDrawing.Canvas.LineTo(trunc(x1), trunc(canvasHeight - y1));
  WriteSideLength(x3, y3, x1, y1);

  WriteVerticeName(x1, y1, 'A');
  WriteVerticeName(x2, y2, 'B');
  WriteVerticeName(x3, y3, 'C');
end;

procedure TfrmMyForm.btnClearClick(Sender: TObject);
begin
  ClearCanvas();
  DrawCanvasGrid();
end;

procedure TfrmMyForm.FormCreate(Sender: TObject);
begin
  frmMyForm.pbxDrawing.Visible := True;
  ClearCanvas();
  DrawCanvasGrid();

  Application.ProcessMessages;

  frmMyForm.pbxDrawing.Refresh;
  frmMyForm.pbxDrawing.Repaint;
end;

procedure TfrmMyForm.btnCalculateClick(Sender: TObject);
var 
	triangleArea : Real;
begin
  triangleArea := CalcArea();
	if triangleArea > 0 then
		begin
    	ClearCanvas();
      DrawCanvasGrid();
    	DrawTriangle();

    	frmMyForm.lblMessage.Visible := False;

      frmMyForm.lblPerimeter.Caption :=
        'Perímetro do Triângulo: ' +
        FormatFloat('0.00', CalcPerimeter());
      frmMyForm.lblPerimeter.Visible := True;

      frmMyForm.lblArea.Caption := 
        'Área do Triângulo: ' + 
        FormatFloat('0.00', triangleArea);
      frmMyForm.lblArea.Visible := True;
    end
  else
  	begin
    	frmMyForm.lblPerimeter.Visible := False;
      frmMyForm.lblArea.Visible := False;
     
      frmMyForm.lblMessage.Caption :=
        'Os três pontos informados não formam um triângulo. área:' +
        FloatToStr(triangleArea);
      frmMyForm.lblMessage.Visible := True;
    end;
end;

end.


