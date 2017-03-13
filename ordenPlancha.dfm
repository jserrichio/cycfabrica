object fOrdenPlancha: TfOrdenPlancha
  Left = 0
  Top = 0
  Caption = 'Crear orden planchado'
  ClientHeight = 330
  ClientWidth = 216
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabeledEdit1: TLabeledEdit
    Left = 48
    Top = 96
    Width = 121
    Height = 21
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'Taller'
    TabOrder = 0
    OnClick = LabeledEdit1Click
  end
  object LabeledEdit2: TLabeledEdit
    Left = 48
    Top = 144
    Width = 121
    Height = 21
    EditLabel.Width = 82
    EditLabel.Height = 13
    EditLabel.Caption = 'Costo por unidad'
    TabOrder = 1
    OnChange = LabeledEdit2Change
  end
  object LabeledEdit3: TLabeledEdit
    Left = 48
    Top = 192
    Width = 121
    Height = 21
    EditLabel.Width = 43
    EditLabel.Height = 13
    EditLabel.Caption = 'Cantidad'
    TabOrder = 2
  end
  object LabeledEdit4: TLabeledEdit
    Left = 48
    Top = 232
    Width = 121
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Total'
    TabOrder = 3
  end
  object Button1: TButton
    Left = 64
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 4
    OnClick = Button1Click
  end
  object LabeledEdit5: TLabeledEdit
    Left = 48
    Top = 40
    Width = 121
    Height = 21
    EditLabel.Width = 43
    EditLabel.Height = 13
    EditLabel.Caption = 'Producto'
    Enabled = False
    TabOrder = 5
    OnClick = LabeledEdit5Click
  end
end
