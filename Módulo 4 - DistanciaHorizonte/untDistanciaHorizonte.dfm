object frmDistanciaHorizonte: TfrmDistanciaHorizonte
  Left = 0
  Top = 0
  Caption = 'frmDistanciaHorizonte'
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
  object lblTitle: TLabel
    Left = 160
    Top = 16
    Width = 159
    Height = 13
    Caption = 'Calcular dist'#226'ncia at'#233' o horizonte'
  end
  object lblHeightLabel: TLabel
    Left = 40
    Top = 53
    Width = 119
    Height = 13
    Caption = 'Altura do ponto (metros)'
  end
  object lblHorizonDistance: TLabel
    Left = 40
    Top = 112
    Width = 87
    Height = 13
    Caption = 'lblHorizonDistance'
    Visible = False
  end
  object edtHeight: TEdit
    Left = 40
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btnCalculate: TButton
    Left = 176
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 1
    OnClick = btnCalculateClick
  end
end
