object fConfirmarCorte: TfConfirmarCorte
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Confirmaci'#243'n de Corte'
  ClientHeight = 546
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 177
    Top = 499
    Width = 122
    Height = 33
    Caption = 'Aceptar'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 499
    Width = 129
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 239
    Width = 329
    Height = 76
    TabOrder = 1
    object LabeledEdit1: TLabeledEdit
      Left = 24
      Top = 28
      Width = 273
      Height = 21
      EditLabel.Width = 124
      EditLabel.Height = 16
      EditLabel.Caption = 'Productos entregados'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 173
    Width = 329
    Height = 76
    TabOrder = 0
    object LabeledEdit2: TLabeledEdit
      Left = 24
      Top = 32
      Width = 273
      Height = 21
      EditLabel.Width = 90
      EditLabel.Height = 13
      EditLabel.Caption = 'Ingrese su nombre'
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 313
    Width = 329
    Height = 105
    TabOrder = 2
    object LabeledEdit3: TLabeledEdit
      Left = 24
      Top = 52
      Width = 273
      Height = 21
      EditLabel.Width = 104
      EditLabel.Height = 16
      EditLabel.Caption = 'Productos fallados'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 8
    Width = 329
    Height = 165
    Caption = 'Datos del corte'
    TabOrder = 7
    object LabeledEdit4: TLabeledEdit
      Left = 48
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = 'Taller'
      ReadOnly = True
      TabOrder = 0
    end
    object LabeledEdit5: TLabeledEdit
      Left = 192
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 74
      EditLabel.Height = 13
      EditLabel.Caption = 'Fecha del corte'
      ReadOnly = True
      TabOrder = 1
    end
    object LabeledEdit7: TLabeledEdit
      Left = 48
      Top = 80
      Width = 121
      Height = 21
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'Producto'
      ReadOnly = True
      TabOrder = 2
    end
    object LabeledEdit8: TLabeledEdit
      Left = 48
      Top = 120
      Width = 121
      Height = 21
      EditLabel.Width = 83
      EditLabel.Height = 13
      EditLabel.Caption = 'Cantidad pedidos'
      ReadOnly = True
      TabOrder = 3
    end
    object LabeledEdit9: TLabeledEdit
      Left = 192
      Top = 120
      Width = 121
      Height = 21
      EditLabel.Width = 87
      EditLabel.Height = 13
      EditLabel.Caption = 'Cantidad restante'
      ReadOnly = True
      TabOrder = 4
    end
  end
  object CheckBox1: TCheckBox
    Left = 25
    Top = 448
    Width = 97
    Height = 17
    Caption = 'Enviar a plancha'
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 177
    Top = 448
    Width = 120
    Height = 17
    Caption = 'Incrementar Stock'
    TabOrder = 4
    OnClick = CheckBox2Click
  end
end
