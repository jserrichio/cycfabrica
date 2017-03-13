object fingresarPago: TfingresarPago
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Registrar Pago'
  ClientHeight = 474
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 2
    Top = 2
    Width = 391
    Height = 471
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 17
      Width = 72
      Height = 13
      Caption = 'Forma de Pago'
    end
    object LabeledEdit3: TLabeledEdit
      Left = 208
      Top = 37
      Width = 145
      Height = 21
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = 'Monto'
      TabOrder = 0
      Text = '0'
    end
    object ComboBox1: TComboBox
      Left = 40
      Top = 37
      Width = 145
      Height = 21
      ItemIndex = 0
      TabOrder = 1
      Text = 'Forma de pago'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Forma de pago'
        'Efectivo'
        'Cheque')
    end
    object Panel2: TPanel
      Left = 16
      Top = 67
      Width = 361
      Height = 116
      TabOrder = 2
      object LabeledEdit1: TLabeledEdit
        Left = 192
        Top = 26
        Width = 145
        Height = 21
        EditLabel.Width = 29
        EditLabel.Height = 13
        EditLabel.Caption = 'Banco'
        Enabled = False
        TabOrder = 0
      end
      object LabeledEdit2: TLabeledEdit
        Left = 24
        Top = 26
        Width = 145
        Height = 21
        EditLabel.Width = 67
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#176' de Cheque'
        Enabled = False
        TabOrder = 1
      end
      object LabeledEdit4: TLabeledEdit
        Left = 192
        Top = 77
        Width = 145
        Height = 21
        EditLabel.Width = 20
        EditLabel.Height = 13
        EditLabel.Caption = 'D'#237'as'
        Enabled = False
        TabOrder = 2
      end
      object DateTimePicker1: TDateTimePicker
        Left = 24
        Top = 77
        Width = 145
        Height = 21
        Date = 41683.635265868060000000
        Time = 41683.635265868060000000
        Enabled = False
        TabOrder = 3
      end
    end
    object Button1: TButton
      Left = 46
      Top = 424
      Width = 121
      Height = 33
      Caption = 'Aceptar'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 230
      Top = 424
      Width = 123
      Height = 33
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = Button2Click
    end
    object LabeledEdit5: TLabeledEdit
      Left = 40
      Top = 208
      Width = 313
      Height = 21
      EditLabel.Width = 60
      EditLabel.Height = 13
      EditLabel.Caption = 'Observaci'#243'n'
      TabOrder = 5
    end
  end
end
