object frmMyForm: TfrmMyForm
  Left = 0
  Top = 0
  Caption = 'frmMyForm'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblMessage: TLabel
    Left = 41
    Top = 48
    Width = 174
    Height = 13
    Caption = 'Insira um n'#250'mero inteiro de 3 d'#237'gitos'
  end
  object lblTitle: TLabel
    Left = 152
    Top = 16
    Width = 164
    Height = 13
    Caption = 'Soma de 2 d'#237'gitos igual ao terceiro'
  end
  object lblResult: TLabel
    Left = 216
    Top = 75
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object edtNumber: TEdit
    Left = 41
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btnEvaluate: TButton
    Left = 40
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Avaliar'
    TabOrder = 1
    OnClick = btnEvaluateClick
  end
end
