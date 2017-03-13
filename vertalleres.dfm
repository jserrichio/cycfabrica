object fvertalleres: Tfvertalleres
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Talleres'
  ClientHeight = 428
  ClientWidth = 688
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 686
    Height = 427
    TabOrder = 0
    object Panel1: TPanel
      Left = 13
      Top = 16
      Width = 660
      Height = 57
      TabOrder = 0
      object LabeledEdit1: TLabeledEdit
        Left = 13
        Top = 21
        Width = 172
        Height = 21
        EditLabel.Width = 37
        EditLabel.Height = 13
        EditLabel.Caption = 'Nombre'
        TabOrder = 0
      end
      object LabeledEdit2: TLabeledEdit
        Left = 198
        Top = 21
        Width = 139
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'Tel'#233'fono'
        ReadOnly = True
        TabOrder = 1
      end
      object LabeledEdit4: TLabeledEdit
        Left = 350
        Top = 21
        Width = 139
        Height = 21
        EditLabel.Width = 43
        EditLabel.Height = 13
        EditLabel.Caption = 'Direcci'#243'n'
        ReadOnly = True
        TabOrder = 2
      end
      object LabeledEdit5: TLabeledEdit
        Left = 503
        Top = 21
        Width = 138
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'E-Mail'
        ReadOnly = True
        TabOrder = 3
      end
    end
    object Panel3: TPanel
      Left = 13
      Top = 352
      Width = 660
      Height = 65
      TabOrder = 1
      object Button2: TButton
        Left = 32
        Top = 16
        Width = 97
        Height = 33
        Caption = 'Aceptar'
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 304
        Top = 16
        Width = 153
        Height = 33
        Caption = 'Agregar taller nuevo'
        TabOrder = 1
        OnClick = Button3Click
      end
      object Button1: TButton
        Left = 479
        Top = 16
        Width = 153
        Height = 33
        Caption = 'Modificar taller actual'
        Enabled = False
        TabOrder = 2
        OnClick = Button1Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 13
      Top = 87
      Width = 660
      Height = 259
      DataSource = DataModule1.dsqtaller
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'nombre_taller'
          Title.Caption = 'Nombre'
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dni_taller'
          Title.Caption = 'DNI / CUIT / CUIL'
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'telefono_taller'
          Title.Caption = 'Tel'#233'fono'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'direccion_taller'
          Title.Caption = 'Direcci'#243'n'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'localidad_taller'
          Title.Caption = 'Localidad'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email_taller'
          Title.Caption = 'E-Mail'
          Width = 99
          Visible = True
        end>
    end
  end
end
