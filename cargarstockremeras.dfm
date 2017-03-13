object fcargarstockremeras: Tfcargarstockremeras
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Cargar Stock Remera/Camisa/Campera'
  ClientHeight = 170
  ClientWidth = 498
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
    Width = 497
    Height = 105
    TabOrder = 0
    object LabeledEdit1: TLabeledEdit
      Left = 32
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 12
      EditLabel.Height = 13
      EditLabel.Caption = 'XS'
      TabOrder = 0
      Text = '0'
    end
    object LabeledEdit2: TLabeledEdit
      Left = 96
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 6
      EditLabel.Height = 13
      EditLabel.Caption = 'S'
      TabOrder = 1
      Text = '0'
    end
    object LabeledEdit3: TLabeledEdit
      Left = 160
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 8
      EditLabel.Height = 13
      EditLabel.Caption = 'M'
      TabOrder = 2
      Text = '0'
    end
    object LabeledEdit4: TLabeledEdit
      Left = 224
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 5
      EditLabel.Height = 13
      EditLabel.Caption = 'L'
      TabOrder = 3
      Text = '0'
    end
    object LabeledEdit5: TLabeledEdit
      Left = 288
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 11
      EditLabel.Height = 13
      EditLabel.Caption = 'XL'
      TabOrder = 4
      Text = '0'
    end
    object LabeledEdit6: TLabeledEdit
      Left = 352
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 17
      EditLabel.Height = 13
      EditLabel.Caption = 'XXL'
      TabOrder = 5
      Text = '0'
    end
    object LabeledEdit7: TLabeledEdit
      Left = 416
      Top = 48
      Width = 65
      Height = 21
      EditLabel.Width = 23
      EditLabel.Height = 13
      EditLabel.Caption = 'XXXL'
      TabOrder = 6
      Text = '0'
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 111
    Width = 497
    Height = 58
    TabOrder = 1
    object Button1: TButton
      Left = 118
      Top = 11
      Width = 275
      Height = 33
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
