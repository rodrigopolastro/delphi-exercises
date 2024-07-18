unit untMatrizNumerosAleatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type
  TfrmMain = class(TForm)
    lblTitle: TLabel;
    edtMin: TEdit;
    edtMax: TEdit;
    lblMin: TLabel;
    lblMax: TLabel;
    btnGenerate: TButton;
    memNumbersList: TMemo;
    lblListTitle: TLabel;
    lblSum: TLabel;
    lblAverage: TLabel;
    lblCount: TLabel;
    lblGreatest: TLabel;
    cmbFilter: TComboBox;
    lblNumbersQuantity: TLabel;
    edtNumbersQuantity: TEdit;
    lblSmallest: TLabel;
    btnOrderList: TButton;
    procedure btnGenerateClick(Sender: TObject);
    procedure btnOrderListClick(Sender: TObject);
    procedure cmbFilterChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const MAX_ARRAY_SIZE = 100;
  
type numbersList = array[1..MAX_ARRAY_SIZE] of integer;  
  
var
  frmMain: TfrmMain;
  listSize: Integer;
  fullList: numbersList;
  fullListLength: Integer;

implementation

{$R *.dfm}

function CalcListSum(var list: numbersList; length: Integer): Integer;
	var i, sum: Integer;
begin
	sum := 0;
  for i := 1 to length do
  	sum := sum + list[i];

  Result := sum;
end;

function FindGreatestNumber(var list: numbersList; length: Integer): Integer;
	var i, greatest: Integer;
begin
	greatest := list[1];
  for i := 1 to length do
  begin
    if list[i] > greatest then
    	greatest := list[i]
  end;

  Result := greatest;
end;

function FindSmallestNumber(var list: numbersList; length: Integer): Integer;
	var i, smallest: Integer;
begin
	smallest := list[1];
  for i := 1 to length do
  begin
    if list[i] < smallest then
    	smallest := list[i]
  end;

  Result := smallest;
end;

function GenerateNumbersList(numbersQuantity, min, max: Integer): numbersList;
  var list : numbersList;
  var number, i: Integer;
begin
	Randomize;
	for i := 1 to numbersQuantity do
  begin
    number := Random(max - min + 1) + min;
    list[i] := number;
  end;

  Result := list;
end;

procedure ShowComponents();
begin
  frmMain.lblListTitle.Visible := True;
	frmMain.cmbFilter.Visible := True;
  frmMain.btnOrderList.Visible := True;
  frmMain.memNumbersList.Visible := True;
  frmMain.lblCount.Visible := True;
  frmMain.lblSum.Visible := True;
  frmMain.lblAverage.Visible := True;
  frmMain.lblSmallest.Visible := True;
  frmMain.lblGreatest.Visible := True;
end;

procedure HideInfoComponents();
begin
	frmMain.lblCount.Visible := False;
  frmMain.lblSum.Visible := False;
  frmMain.lblAverage.Visible := False;
  frmMain.lblSmallest.Visible := False;
  frmMain.lblGreatest.Visible := False;
end;

procedure ShowList(var list: numbersList; listLength: Integer);
	var i: Integer;
begin
	frmMain.memNumbersList.Clear;
  if listLength > 0 then
		for i := 1 to listLength do
  		frmMain.memNumbersList.Lines.Append(IntToStr(list[i]))
  else
  	frmMain.memNumbersList.Lines.Append('Lista Vazia');
end;

procedure ShowListInfo(var list: numbersList; listLength: Integer);
  var listSum: Integer;
  var listAverage: Real;
begin
  if listLength > 0 then
  begin
  	frmMain.lblCount.Caption
    	:= 'Quantidade de Números: ' + IntToStr(listLength);

    listSum := CalcListSum(list, listLength);
    listAverage := listSum / listLength;

  	frmMain.lblSum.Caption :=
    	'Soma: ' + IntToStr(listSum);
  	frmMain.lblAverage.Caption :=
    	'Média: ' + FormatFloat('#.##', listAverage);
   	frmMain.lblSmallest.Caption :=
    	'Menor número: ' + IntToStr(FindSmallestNumber(list, listLength));
  	frmMain.lblGreatest.Caption :=
    	'Maior número: ' + IntToStr(FindGreatestNumber(list, listLength));

    ShowComponents();
  end
  else
  	HideInfoComponents();

end;

procedure OrderNumbersList();
	var i, j, aux, listLength: Integer;
  var list: numbersList;
begin
	listLength := frmMain.memNumbersList.Lines.Count;
  for i := 1 to listLength do
    list[i] := StrToInt(frmMain.memNumbersList.Lines[i-1]);

  for i := 1 to listLength do
  	for j := 1 to listLength do
    	if list[i] < list[j] then
      begin
      	aux := list[i];
        list[i] := list[j];
        list[j] := aux;
      end;

  ShowList(list, listLength);
end;

procedure FilterNumbersList(filterOption: Integer);
	var list, filteredList: numbersList;
  var listLength, filteredListLength, i, j: Integer;
begin
	list := fullList;
//  for j := 1 to fullListLength do

//  frmMain.lblTitle.Caption := full
	listLength := fullListLength;
  filteredListLength := 0;

  case filterOption of
    //All numbers (no filter)
    1: begin
      for i := 1 to listLength do
      	filteredList[i] := list[i];
      filteredListLength := listLength;
    end;

  	//Even numbers
    2: begin
    	for i := 1 to listLength do
    		if list[i] mod 2 = 0 then
        begin
       		filteredList[filteredListLength+1] := list[i];
          inc(filteredListLength);
        end;
    end;

    //Odd numbers
    3: begin
    	for i := 1 to listLength do
    		if list[i] mod 2 = 1 then
        begin
       		filteredList[filteredListLength+1] := list[i];
          inc(filteredListLength);
        end;
    end;

    //Positive numbers
    4: begin
    	for i := 1 to listLength do
    		if list[i] > 0 then
        begin
       		filteredList[filteredListLength+1] := list[i];
          inc(filteredListLength);
        end;
    end;

    //Negative numbers
    5: begin
    	for i := 1 to listLength do
    		if list[i] < 0 then
        begin
       		filteredList[filteredListLength+1] := list[i];
          inc(filteredListLength);
        end;
    end;
  end;

  if filteredListLength > 0 then
  	ShowList(filteredList, filteredListLength);
  	ShowListInfo(filteredList, filteredListLength);

end;

procedure GenerateInitialList();
//	var list: numbersList;
	var min, max: Integer;
begin
  fullListLength := StrToInt(frmMain.edtNumbersQuantity.Text);
	min := StrToInt(frmMain.edtMin.Text);
  max := StrToInt(frmMain.edtMax.Text);

  fullList := GenerateNumbersList(fullListLength, min, max);

  ShowList(fullList, fullListLength);
  ShowListInfo(fullList, fullListLength);
  ShowComponents();
end;

procedure TfrmMain.btnGenerateClick(Sender: TObject);
begin
	GenerateInitialList();
end;

procedure TfrmMain.btnOrderListClick(Sender: TObject);
begin
	OrderNumbersList();
end;

procedure TfrmMain.cmbFilterChange(Sender: TObject);
var
  selectedIndex: Integer;
begin
	selectedIndex := frmMain.cmbFilter.ItemIndex;
 	FilterNumbersList(selectedIndex+1);
end;

end.
