object FMercaderiaEnTaller: TFMercaderiaEnTaller
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Mercaderia en talleres'
  ClientHeight = 468
  ClientWidth = 724
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
  object fmercaderiaEnTalleres: TDBGrid
    Left = 2
    Top = 141
    Width = 719
    Height = 267
    DataSource = DataModule1.dsqmercaderia
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = fmercaderiaEnTalleresDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'Tipo'
        Width = 27
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'num_corte'
        Title.Caption = 'N'#176' Corte'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombre_prod'
        Title.Caption = 'Producto'
        Width = 209
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha'
        Title.Caption = 'Fecha'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombre_taller'
        Title.Caption = 'Taller'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cantidad'
        Title.Caption = 'Cantidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cantidad_restante'
        Title.Caption = 'Resta'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'costo_total'
        Title.Caption = 'Costo'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 2
    Top = 3
    Width = 351
    Height = 65
    TabOrder = 1
    object Label1: TLabel
      Left = 19
      Top = 9
      Width = 30
      Height = 13
      Caption = 'Desde'
    end
    object Label2: TLabel
      Left = 141
      Top = 9
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 16
      Top = 27
      Width = 105
      Height = 21
      Date = 41619.678001215280000000
      Time = 41619.678001215280000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 138
      Top = 27
      Width = 105
      Height = 21
      Date = 41619.678001215280000000
      Time = 41619.678001215280000000
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 5
    Top = 409
    Width = 716
    Height = 59
    TabOrder = 2
    object Button1: TButton
      Left = 299
      Top = 12
      Width = 137
      Height = 33
      Caption = 'Salir'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 92
      Top = 12
      Width = 138
      Height = 33
      Caption = 'Confirmar corte'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel3: TPanel
    Left = 359
    Top = 3
    Width = 361
    Height = 65
    TabOrder = 3
    object LabeledEdit1: TLabeledEdit
      Left = 15
      Top = 27
      Width = 228
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = 'Taller'
      TabOrder = 0
      OnChange = LabeledEdit1Change
    end
  end
  object Panel4: TPanel
    Left = 2
    Top = 72
    Width = 719
    Height = 66
    TabOrder = 4
    object RadioGroup1: TRadioGroup
      Left = 398
      Top = 10
      Width = 193
      Height = 40
      Caption = 'Filtros'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Ninguno'
        'Fecha'
        'Taller')
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object RadioGroup2: TRadioGroup
      Left = 35
      Top = 10
      Width = 230
      Height = 40
      Caption = 'Tipo'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Confecci'#243'n'
        'Plancha')
      TabOrder = 1
    end
  end
end
