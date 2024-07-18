object frmMyForm: TfrmMyForm
  Left = 0
  Top = 0
  Caption = 'frmMyForm'
  ClientHeight = 472
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitle: TLabel
    Left = 188
    Top = 16
    Width = 303
    Height = 13
    Caption = 'Calcular Per'#237'metro e '#193'rea de Tri'#226'ngulo a partir de seus v'#233'rtices'
  end
  object lblVertice1: TLabel
    Left = 32
    Top = 63
    Width = 43
    Height = 13
    Caption = 'V'#233'rtice A'
  end
  object lblX1: TLabel
    Left = 32
    Top = 85
    Width = 6
    Height = 13
    Caption = 'X'
  end
  object lblY1: TLabel
    Left = 100
    Top = 85
    Width = 6
    Height = 13
    Caption = 'Y'
  end
  object lblVertice2: TLabel
    Left = 32
    Top = 116
    Width = 42
    Height = 13
    Caption = 'V'#233'rtice B'
  end
  object lblX2: TLabel
    Left = 32
    Top = 138
    Width = 6
    Height = 13
    Caption = 'X'
  end
  object lblY2: TLabel
    Left = 100
    Top = 137
    Width = 6
    Height = 13
    Caption = 'Y'
  end
  object lblVertice3: TLabel
    Left = 32
    Top = 172
    Width = 43
    Height = 13
    Caption = 'V'#233'rtice C'
  end
  object lblX3: TLabel
    Left = 32
    Top = 194
    Width = 6
    Height = 13
    Caption = 'X'
  end
  object lblY3: TLabel
    Left = 100
    Top = 193
    Width = 6
    Height = 13
    Caption = 'Y'
  end
  object lblPerimeter: TLabel
    Left = 215
    Top = 389
    Width = 56
    Height = 13
    Caption = 'lblPerimeter'
    Visible = False
  end
  object lblArea: TLabel
    Left = 215
    Top = 408
    Width = 33
    Height = 13
    Caption = 'lblArea'
    Visible = False
  end
  object Label1: TLabel
    Left = 80
    Top = 248
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object lblMessage: TLabel
    Left = 215
    Top = 63
    Width = 278
    Height = 13
    Caption = 'Insira as coordenaadas dos v'#233'rtices e clique em "Calcular"'
    Visible = False
  end
  object pbxDrawing: TPaintBox
    Left = 215
    Top = 82
    Width = 301
    Height = 301
    Color = clWhite
    ParentColor = False
  end
  object btnCalculate: TButton
    Left = 32
    Top = 232
    Width = 125
    Height = 33
    Caption = 'Calcular'
    TabOrder = 0
    OnClick = btnCalculateClick
  end
  object edtX1: TEdit
    Left = 44
    Top = 82
    Width = 45
    Height = 21
    TabOrder = 1
  end
  object edtY1: TEdit
    Left = 112
    Top = 82
    Width = 45
    Height = 21
    TabOrder = 2
  end
  object btnClear: TButton
    Left = 32
    Top = 271
    Width = 125
    Height = 34
    Caption = 'Limpar Campos'
    TabOrder = 3
    OnClick = btnClearClick
  end
  object edtX2: TEdit
    Left = 44
    Top = 135
    Width = 45
    Height = 21
    TabOrder = 4
  end
  object edtY2: TEdit
    Left = 112
    Top = 134
    Width = 45
    Height = 21
    TabOrder = 5
  end
  object edtX3: TEdit
    Left = 44
    Top = 191
    Width = 45
    Height = 21
    TabOrder = 6
  end
  object edtY3: TEdit
    Left = 112
    Top = 190
    Width = 45
    Height = 21
    TabOrder = 7
  end
end
