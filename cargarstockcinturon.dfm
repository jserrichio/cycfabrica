object fcargarstockcinturon: Tfcargarstockcinturon
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Cargar Stock Cintur'#243'n'
  ClientHeight = 165
  ClientWidth = 396
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
    Width = 393
    Height = 97
    TabOrder = 0
    object LabeledEdit1: TLabeledEdit
      Left = 32
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 12
      EditLabel.Height = 13
      EditLabel.Caption = '90'
      TabOrder = 0
      Text = '0'
    end
    object LabeledEdit2: TLabeledEdit
      Left = 96
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 12
      EditLabel.Height = 13
      EditLabel.Caption = '95'
      TabOrder = 1
      Text = '0'
    end
    object LabeledEdit3: TLabeledEdit
      Left = 160
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 18
      EditLabel.Height = 13
      EditLabel.Caption = '100'
      TabOrder = 2
      Text = '0'
    end
    object LabeledEdit4: TLabeledEdit
      Left = 224
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 18
      EditLabel.Height = 13
      EditLabel.Caption = '105'
      TabOrder = 3
      Text = '0'
    end
    object LabeledEdit5: TLabeledEdit
      Left = 288
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 18
      EditLabel.Height = 13
      EditLabel.Caption = '110'
      TabOrder = 4
      Text = '0'
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 103
    Width = 393
    Height = 58
    TabOrder = 1
    object Button1: TButton
      Left = 51
      Top = 13
      Width = 286
      Height = 33
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
