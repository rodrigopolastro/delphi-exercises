unit untInteiroTresDigitos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMyForm = class(TForm)
    edtNumber: TEdit;
    lblMessage: TLabel;
    lblTitle: TLabel;
    btnEvaluate: TButton;
    lblResult: TLabel;
    procedure btnEvaluateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMyForm: TfrmMyForm;

implementation

{$R *.dfm}

procedure EvaluateDigits(digit1, digit2, digit3: Integer);
begin
	if digit1 + digit2 = digit3 then
  begin
    frmMyForm.lblResult.Caption :=
    format('TRUE => %d + %d = %d', [digit1, digit2, digit3]);
    Exit();
  end;

  if digit1 + digit3 = digit2 then
  begin
    frmMyForm.lblResult.Caption :=
      format('TRUE => %d + %d = %d', [digit1, digit3, digit2]);
    Exit();
  end;

  if digit2 + digit3 = digit1 then
  begin
  	frmMyForm.lblResult.Caption :=
    	format('TRUE => %d + %d = %d', [digit2, digit3, digit1]);
    Exit();
  end;


  frmMyForm.lblResult.Caption := 'FALSE';
end;

procedure TfrmMyForm.btnEvaluateClick(Sender: TObject);
var
	number, hundreds, tens, units: Integer;
begin
	number := StrToInt(edtNumber.Text);

  hundreds := number div 100;
  number := number - (number div 100)*100;

  tens := number div 10;
  number := number - (number div 10)*10;

  units := number;

  EvaluateDigits(hundreds, tens, units);

end;

end.
