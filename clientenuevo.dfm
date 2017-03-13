object fclientenuevo: Tfclientenuevo
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Cliente'
  ClientHeight = 440
  ClientWidth = 384
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
  object Panel1: TPanel
    Left = -1
    Top = 0
    Width = 386
    Height = 441
    TabOrder = 0
    object Label1: TLabel
      Left = 80
      Top = 24
      Width = 229
      Height = 13
      Caption = 'INGRESE LOS DATOS DEL CLIENTE / SUCURSAL'
    end
    object Button1: TButton
      Left = 208
      Top = 384
      Width = 121
      Height = 33
      Caption = 'Guardar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 56
      Top = 384
      Width = 121
      Height = 33
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object LabeledEdit1: TLabeledEdit
      Left = 56
      Top = 72
      Width = 273
      Height = 21
      EditLabel.Width = 85
      EditLabel.Height = 13
      EditLabel.Caption = 'DNI / CUIL / CUIT'
      TabOrder = 2
    end
    object LabeledEdit2: TLabeledEdit
      Left = 56
      Top = 120
      Width = 273
      Height = 21
      EditLabel.Width = 135
      EditLabel.Height = 13
      EditLabel.Caption = 'Nombre y apellido / Sucursal'
      TabOrder = 3
    end
    object LabeledEdit3: TLabeledEdit
      Left = 56
      Top = 168
      Width = 273
      Height = 21
      EditLabel.Width = 42
      EditLabel.Height = 13
      EditLabel.Caption = 'Tel'#233'fono'
      TabOrder = 4
    end
    object LabeledEdit4: TLabeledEdit
      Left = 56
      Top = 216
      Width = 273
      Height = 21
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'Direcci'#243'n'
      TabOrder = 5
    end
    object LabeledEdit5: TLabeledEdit
      Left = 56
      Top = 262
      Width = 273
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'Localidad'
      TabOrder = 6
    end
    object LabeledEdit6: TLabeledEdit
      Left = 56
      Top = 312
      Width = 273
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'E-Mail'
      TabOrder = 7
    end
    object RadioGroup1: TRadioGroup
      Left = 56
      Top = 339
      Width = 273
      Height = 39
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sucursal'
        'Franquicia')
      TabOrder = 8
    end
  end
end
