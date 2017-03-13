object fcargarstockbolsa: Tfcargarstockbolsa
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Cargar Stock Bolsa'
  ClientHeight = 164
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 353
    Height = 97
    TabOrder = 0
    object LabeledEdit1: TLabeledEdit
      Left = 48
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 6
      EditLabel.Height = 13
      EditLabel.Caption = '1'
      TabOrder = 0
      Text = '0'
    end
    object LabeledEdit2: TLabeledEdit
      Left = 112
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 6
      EditLabel.Height = 13
      EditLabel.Caption = '2'
      TabOrder = 1
      Text = '0'
    end
    object LabeledEdit3: TLabeledEdit
      Left = 176
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 6
      EditLabel.Height = 13
      EditLabel.Caption = '3'
      TabOrder = 2
      Text = '0'
    end
    object LabeledEdit4: TLabeledEdit
      Left = 240
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 6
      EditLabel.Height = 13
      EditLabel.Caption = '4'
      TabOrder = 3
      Text = '0'
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 103
    Width = 353
    Height = 58
    TabOrder = 1
    object Button1: TButton
      Left = 72
      Top = 13
      Width = 217
      Height = 33
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
