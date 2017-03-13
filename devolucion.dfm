object fdevolucion: Tfdevolucion
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSizeToolWin
  Caption = 'Devoluci'#243'n por falla'
  ClientHeight = 201
  ClientWidth = 261
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
  object Panel1: TPanel
    Left = 2
    Top = 1
    Width = 255
    Height = 134
    TabOrder = 0
    object LabeledEdit1: TLabeledEdit
      Left = 22
      Top = 37
      Width = 208
      Height = 21
      EditLabel.Width = 112
      EditLabel.Height = 13
      EditLabel.Caption = 'Origen de la devoluci'#243'n'
      TabOrder = 0
      OnClick = LabeledEdit1Click
    end
    object LabeledEdit2: TLabeledEdit
      Left = 23
      Top = 84
      Width = 207
      Height = 21
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'Producto'
      TabOrder = 1
      OnClick = LabeledEdit2Click
    end
  end
  object Panel2: TPanel
    Left = 2
    Top = 137
    Width = 255
    Height = 60
    TabOrder = 1
    object Button1: TButton
      Left = 139
      Top = 16
      Width = 91
      Height = 31
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 24
      Top = 16
      Width = 93
      Height = 31
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
