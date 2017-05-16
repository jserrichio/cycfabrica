object fcuentaCorriente: TfcuentaCorriente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cuenta Corriente'
  ClientHeight = 682
  ClientWidth = 1264
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1265
    Height = 681
    ActivePage = TabSheet3
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Clientes'
      object Panel1: TPanel
        Left = 968
        Top = 3
        Width = 286
        Height = 638
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 11
          Top = 107
          Width = 264
          Height = 150
          Caption = 'Fecha'
          TabOrder = 0
          object Label3: TLabel
            Left = 32
            Top = 25
            Width = 30
            Height = 13
            Caption = 'Desde'
          end
          object Label4: TLabel
            Left = 32
            Top = 85
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object DateTimePicker1: TDateTimePicker
            Left = 32
            Top = 47
            Width = 201
            Height = 21
            Date = 41681.665290416670000000
            Time = 41681.665290416670000000
            ShowCheckbox = True
            Checked = False
            Enabled = False
            TabOrder = 0
          end
          object DateTimePicker2: TDateTimePicker
            Left = 32
            Top = 104
            Width = 201
            Height = 21
            Date = 41681.665290416670000000
            Time = 41681.665290416670000000
            ShowCheckbox = True
            Checked = False
            Enabled = False
            TabOrder = 1
          end
        end
        object GroupBox3: TGroupBox
          Left = 10
          Top = 15
          Width = 264
          Height = 77
          Caption = 'Cliente'
          TabOrder = 1
          object LabeledEdit1: TLabeledEdit
            Left = 32
            Top = 36
            Width = 201
            Height = 21
            EditLabel.Width = 9
            EditLabel.Height = 13
            EditLabel.Caption = '   '
            ReadOnly = True
            TabOrder = 0
            Text = 'Todos los clientes'
            OnChange = LabeledEdit1Change
            OnClick = LabeledEdit1Click
          end
        end
        object GroupBox4: TGroupBox
          Left = 11
          Top = 297
          Width = 264
          Height = 81
          Caption = 'Saldo del cliente'
          TabOrder = 2
          object LabeledEdit2: TLabeledEdit
            Left = 24
            Top = 40
            Width = 209
            Height = 21
            EditLabel.Width = 12
            EditLabel.Height = 13
            EditLabel.Caption = '    '
            ReadOnly = True
            TabOrder = 0
            Text = '0'
          end
        end
        object Button1: TButton
          Left = 52
          Top = 481
          Width = 186
          Height = 32
          Caption = 'Ingresar Pago'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 52
          Top = 545
          Width = 186
          Height = 32
          Caption = 'Imprimir'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
      end
      object Panel2: TPanel
        Left = 5
        Top = 8
        Width = 957
        Height = 633
        TabOrder = 1
        object Label2: TLabel
          Left = 152
          Top = 12
          Width = 84
          Height = 13
          Caption = 'Todos los clientes'
        end
        object Label1: TLabel
          Left = 16
          Top = 10
          Width = 127
          Height = 16
          Caption = 'Remitos del cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBGrid1: TDBGrid
          Left = 16
          Top = 40
          Width = 921
          Height = 577
          DataSource = DataModule1.dsqcccliente
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'nombre_cli'
              Title.Caption = 'Cliente'
              Width = 149
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fecha_venta'
              Title.Caption = 'Fecha'
              Width = 136
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Subtotal'
              Title.Caption = 'Total'
              Visible = True
            end>
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Pagos'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 968
        Top = 3
        Width = 286
        Height = 638
        TabOrder = 0
        object GroupBox6: TGroupBox
          Left = 11
          Top = 107
          Width = 264
          Height = 150
          Caption = 'Fecha'
          TabOrder = 0
          object Label5: TLabel
            Left = 32
            Top = 25
            Width = 30
            Height = 13
            Caption = 'Desde'
          end
          object Label6: TLabel
            Left = 32
            Top = 85
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object DateTimePicker3: TDateTimePicker
            Left = 32
            Top = 47
            Width = 201
            Height = 21
            Date = 41681.665290416670000000
            Time = 41681.665290416670000000
            ShowCheckbox = True
            Checked = False
            Enabled = False
            TabOrder = 0
          end
          object DateTimePicker4: TDateTimePicker
            Left = 32
            Top = 104
            Width = 201
            Height = 21
            Date = 41681.665290416670000000
            Time = 41681.665290416670000000
            ShowCheckbox = True
            Checked = False
            Enabled = False
            TabOrder = 1
          end
        end
        object GroupBox7: TGroupBox
          Left = 10
          Top = 15
          Width = 264
          Height = 77
          Caption = 'Cliente'
          TabOrder = 1
          object LabeledEdit5: TLabeledEdit
            Left = 24
            Top = 36
            Width = 201
            Height = 21
            EditLabel.Width = 21
            EditLabel.Height = 13
            EditLabel.Caption = '       '
            TabOrder = 0
            OnChange = LabeledEdit5Change
          end
        end
        object GroupBox8: TGroupBox
          Left = 11
          Top = 321
          Width = 264
          Height = 81
          Caption = 'Saldo del cliente'
          TabOrder = 2
          object LabeledEdit6: TLabeledEdit
            Left = 24
            Top = 40
            Width = 209
            Height = 21
            EditLabel.Width = 15
            EditLabel.Height = 13
            EditLabel.Caption = '     '
            TabOrder = 0
            Text = '0'
          end
        end
        object Button4: TButton
          Left = 52
          Top = 545
          Width = 186
          Height = 32
          Caption = 'Imprimir'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object Button9: TButton
          Left = 52
          Top = 497
          Width = 186
          Height = 32
          Caption = 'Eliminar Pago'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = Button9Click
        end
      end
      object Panel4: TPanel
        Left = 7
        Top = 3
        Width = 955
        Height = 638
        TabOrder = 1
        object DBGrid2: TDBGrid
          Left = 9
          Top = 15
          Width = 928
          Height = 610
          DataSource = DataModule1.dsQpagos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = DBGrid2CellClick
          OnDblClick = DBGrid2DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'nombre_cli'
              Title.Caption = 'Cliente'
              Width = 170
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fecha'
              Title.Caption = 'Fecha'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'monto'
              Title.Caption = 'Monto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'forma_de_pago'
              Title.Caption = 'Forma de pago'
              Width = 86
              Visible = True
            end>
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Talleres'
      ImageIndex = 2
      object Panel5: TPanel
        Left = 968
        Top = 3
        Width = 286
        Height = 647
        TabOrder = 0
        object GroupBox9: TGroupBox
          Left = 16
          Top = 350
          Width = 264
          Height = 85
          Caption = 'Saldo del taller'
          TabOrder = 0
          object LabeledEdit13: TLabeledEdit
            Left = 32
            Top = 40
            Width = 201
            Height = 21
            EditLabel.Width = 3
            EditLabel.Height = 13
            TabOrder = 0
          end
        end
        object GroupBox10: TGroupBox
          Left = 19
          Top = 179
          Width = 264
          Height = 150
          Caption = 'Fecha'
          TabOrder = 1
          object Label7: TLabel
            Left = 32
            Top = 25
            Width = 30
            Height = 13
            Caption = 'Desde'
          end
          object Label8: TLabel
            Left = 32
            Top = 85
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object DateTimePicker5: TDateTimePicker
            Left = 32
            Top = 47
            Width = 201
            Height = 21
            Date = 41681.665290416670000000
            Time = 41681.665290416670000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 0
          end
          object DateTimePicker6: TDateTimePicker
            Left = 32
            Top = 104
            Width = 201
            Height = 21
            Date = 41681.665290416670000000
            Time = 41681.665290416670000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 1
          end
        end
        object GroupBox11: TGroupBox
          Left = 18
          Top = 23
          Width = 264
          Height = 77
          Caption = 'Taller'
          TabOrder = 2
          object LabeledEdit8: TLabeledEdit
            Left = 32
            Top = 36
            Width = 201
            Height = 21
            EditLabel.Width = 9
            EditLabel.Height = 13
            EditLabel.Caption = '   '
            TabOrder = 0
            OnChange = LabeledEdit8Change
            OnClick = LabeledEdit8Click
          end
        end
        object Button3: TButton
          Left = 52
          Top = 545
          Width = 186
          Height = 32
          Caption = 'Ingresar Cobro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = Button3Click
        end
        object Button5: TButton
          Left = 52
          Top = 601
          Width = 186
          Height = 32
          Caption = 'Imprimir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = Button5Click
        end
      end
      object Panel6: TPanel
        Left = 5
        Top = 8
        Width = 957
        Height = 642
        Caption = 'Panel2'
        TabOrder = 1
        object Label9: TLabel
          Left = 152
          Top = 12
          Width = 91
          Height = 13
          Caption = 'seleccione un taller'
        end
        object Label10: TLabel
          Left = 16
          Top = 10
          Width = 118
          Height = 16
          Caption = 'Remitos del taller:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBGrid3: TDBGrid
          Left = 16
          Top = 40
          Width = 921
          Height = 593
          DataSource = DataModule1.dsqcctaller
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'fecha'
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'num_corte'
              Title.Caption = 'N'#176' de corte'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'num_prod'
              Title.Caption = 'N'#176' Producto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nombre_prod'
              Title.Caption = 'Producto'
              Width = 171
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nombre_taller'
              Title.Caption = 'Taller'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'controlado_por'
              Title.Caption = 'Controlado por'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'costo_unidad'
              Title.Caption = 'Costo unidad'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cantidad_entregada'
              Title.Caption = 'Entregados'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cantidad_fallada'
              Title.Caption = 'Fallados'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'pagar'
              Title.Caption = 'Total $'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'deuda'
              Title.Caption = 'Saldo $'
              Width = 44
              Visible = True
            end>
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Cobros'
      ImageIndex = 3
      object Panel7: TPanel
        Left = 7
        Top = 3
        Width = 947
        Height = 647
        TabOrder = 0
        object DBGrid4: TDBGrid
          Left = 9
          Top = 15
          Width = 920
          Height = 618
          DataSource = DataModule1.dsQCobros
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = DBGrid4CellClick
          OnDblClick = DBGrid4DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'nombre_taller'
              Title.Caption = 'Taller'
              Width = 171
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'fecha'
              Title.Caption = 'Fecha de cobro'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'monto'
              Title.Caption = 'Monto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'forma_de_pago'
              Title.Caption = 'Forma de pago'
              Width = 117
              Visible = True
            end>
        end
      end
      object Panel8: TPanel
        Left = 960
        Top = 3
        Width = 286
        Height = 638
        TabOrder = 1
        object GroupBox13: TGroupBox
          Left = 11
          Top = 324
          Width = 264
          Height = 85
          Caption = 'Saldo del taller'
          TabOrder = 0
          object LabeledEdit7: TLabeledEdit
            Left = 32
            Top = 40
            Width = 201
            Height = 21
            EditLabel.Width = 3
            EditLabel.Height = 13
            TabOrder = 0
          end
        end
        object GroupBox14: TGroupBox
          Left = 11
          Top = 107
          Width = 264
          Height = 150
          Caption = 'Fecha'
          TabOrder = 1
          object Label11: TLabel
            Left = 32
            Top = 25
            Width = 30
            Height = 13
            Caption = 'Desde'
          end
          object Label12: TLabel
            Left = 32
            Top = 85
            Width = 28
            Height = 13
            Caption = 'Hasta'
          end
          object DateTimePicker7: TDateTimePicker
            Left = 32
            Top = 47
            Width = 201
            Height = 21
            Date = 41681.665290416670000000
            Time = 41681.665290416670000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 0
          end
          object DateTimePicker8: TDateTimePicker
            Left = 32
            Top = 104
            Width = 201
            Height = 21
            Date = 41681.665290416670000000
            Time = 41681.665290416670000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 1
          end
        end
        object GroupBox15: TGroupBox
          Left = 10
          Top = 15
          Width = 264
          Height = 77
          Caption = 'Taller'
          TabOrder = 2
          object LabeledEdit11: TLabeledEdit
            Left = 32
            Top = 36
            Width = 201
            Height = 21
            EditLabel.Width = 15
            EditLabel.Height = 13
            EditLabel.Caption = '     '
            TabOrder = 0
          end
        end
        object Button6: TButton
          Left = 52
          Top = 585
          Width = 186
          Height = 32
          Caption = 'Imprimir'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 52
          Top = 501
          Width = 186
          Height = 32
          Caption = 'Eliminar cobro'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 52
          Top = 463
          Width = 186
          Height = 32
          Caption = 'Ingresar Cobro'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = Button3Click
        end
      end
    end
  end
end
