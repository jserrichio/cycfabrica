object recuperarProducto: TrecuperarProducto
  Left = 0
  Top = 0
  Caption = 'Recuperar producto eliminado'
  ClientHeight = 710
  ClientWidth = 1055
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 8
    Width = 761
    Height = 694
    DataSource = dsqeliminados
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id_prod'
        Title.Caption = 'ID'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombre_prod'
        Title.Caption = 'Nombre'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'num_prod'
        Title.Caption = 'N'#176' articulo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descripcion_prod'
        Title.Caption = 'Descripcion'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo_prod'
        Title.Caption = 'Tipo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sexo_prod'
        Title.Caption = 'Sexo'
        Width = 60
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 767
    Top = 8
    Width = 280
    Height = 694
    TabOrder = 1
    object Button1: TButton
      Left = 53
      Top = 32
      Width = 164
      Height = 25
      Caption = 'Recuperar producto'
      Enabled = False
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object QEliminados: TADOQuery
    Connection = DataModule1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from producto p where p.activo=0 order by p.nombre_prod')
    Left = 840
    Top = 344
  end
  object dsqeliminados: TDataSource
    DataSet = QEliminados
    Left = 800
    Top = 344
  end
end
