object fventa: Tfventa
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Nueva venta'
  ClientHeight = 529
  ClientWidth = 803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = -3
    Width = 801
    Height = 532
    Caption = 'Panel1'
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 504
      Top = -17
      Width = 293
      Height = 498
      TabOrder = 0
      object LabeledEdit1: TLabeledEdit
        Left = 16
        Top = 40
        Width = 257
        Height = 21
        EditLabel.Width = 83
        EditLabel.Height = 13
        EditLabel.Caption = 'Cliente / Sucursal'
        TabOrder = 0
        OnClick = LabeledEdit1Click
      end
      object LabeledEdit2: TLabeledEdit
        Left = 16
        Top = 80
        Width = 257
        Height = 21
        EditLabel.Width = 43
        EditLabel.Height = 13
        EditLabel.Caption = 'Producto'
        TabOrder = 1
        OnClick = LabeledEdit2Click
      end
      object LabeledEdit3: TLabeledEdit
        Left = 16
        Top = 264
        Width = 145
        Height = 21
        EditLabel.Width = 43
        EditLabel.Height = 13
        EditLabel.Caption = 'Cantidad'
        TabOrder = 2
        Text = '1'
      end
      object Button1: TButton
        Left = 72
        Top = 389
        Width = 153
        Height = 35
        Caption = 'Agregar Producto'
        Enabled = False
        TabOrder = 5
        OnClick = Button1Click
      end
      object Button4: TButton
        Left = 72
        Top = 438
        Width = 153
        Height = 35
        Caption = 'Eliminar Producto'
        TabOrder = 6
        OnClick = Button4Click
      end
      object panelpantalon: TPanel
        Left = 14
        Top = 113
        Width = 269
        Height = 126
        ParentCustomHint = False
        TabOrder = 7
        object RadioGroup3: TRadioGroup
          Left = 4
          Top = 6
          Width = 261
          Height = 115
          Caption = 'Seleccione el talle'
          Columns = 6
          Items.Strings = (
            '26'
            '28'
            '30'
            '32'
            '34'
            '36'
            '38'
            '40'
            '42'
            '44'
            '46'
            '48'
            '50'
            '52'
            '54'
            '56'
            '58'
            '60')
          TabOrder = 0
        end
      end
      object panelcinturon: TPanel
        Left = 17
        Top = 118
        Width = 273
        Height = 126
        TabOrder = 8
        Visible = False
        object RadioGroup2: TRadioGroup
          Left = 3
          Top = 6
          Width = 267
          Height = 116
          Caption = 'Seleccione el talle'
          Columns = 5
          Items.Strings = (
            '90'
            '95'
            '100'
            '105'
            '110')
          TabOrder = 0
        end
      end
      object panelremera: TPanel
        Left = 17
        Top = 113
        Width = 273
        Height = 126
        TabOrder = 9
        Visible = False
        object RadioGroup1: TRadioGroup
          Left = 8
          Top = 18
          Width = 259
          Height = 101
          Caption = 'Seleccione el talle'
          Columns = 6
          Items.Strings = (
            'XS'
            'S'
            'M'
            'L'
            'XL'
            'XXL')
          TabOrder = 0
        end
      end
      object ComboBox1: TComboBox
        Left = 16
        Top = 349
        Width = 145
        Height = 21
        ItemIndex = 0
        TabOrder = 4
        Text = 'Forma de pago'
        Items.Strings = (
          'Forma de pago'
          'Efectivo'
          'Cuenta corriente')
      end
      object LabeledEdit5: TLabeledEdit
        Left = 16
        Top = 312
        Width = 81
        Height = 21
        EditLabel.Width = 76
        EditLabel.Height = 13
        EditLabel.Caption = 'Precio al p'#250'blico'
        TabOrder = 3
        Text = '0.00'
      end
      object panelninos: TPanel
        Left = 17
        Top = 118
        Width = 273
        Height = 126
        TabOrder = 10
        Visible = False
        object RadioGroup4: TRadioGroup
          Left = 3
          Top = 6
          Width = 267
          Height = 116
          Caption = 'Seleccione el talle'
          Columns = 5
          Items.Strings = (
            '1'
            '2'
            '4'
            '6'
            '8'
            '10'
            '12'
            '14'
            '16')
          TabOrder = 0
        end
      end
      object LabeledEdit6: TLabeledEdit
        Left = 136
        Top = 312
        Width = 81
        Height = 21
        EditLabel.Width = 81
        EditLabel.Height = 13
        EditLabel.Caption = 'Precio por mayor'
        TabOrder = 11
        Text = '0.00'
      end
    end
    object GroupBox2: TGroupBox
      Left = 10
      Top = 447
      Width = 488
      Height = 66
      TabOrder = 1
      object Button2: TButton
        Left = 328
        Top = 16
        Width = 129
        Height = 33
        Caption = 'Confirmar Venta'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 176
        Top = 16
        Width = 129
        Height = 33
        Caption = 'Cancelar Venta'
        TabOrder = 2
        OnClick = Button3Click
      end
      object LabeledEdit4: TLabeledEdit
        Left = 25
        Top = 24
        Width = 121
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Total'
        TabOrder = 0
        Text = '0'
      end
    end
    object StringGrid1: TStringGrid
      Left = 10
      Top = 15
      Width = 488
      Height = 426
      RowCount = 2
      FixedRows = 0
      TabOrder = 2
    end
  end
end
