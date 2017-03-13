object Corte_pendiente: TCorte_pendiente
  Left = 0
  Top = 0
  Caption = 'Corte_pendiente'
  ClientHeight = 614
  ClientWidth = 784
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
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 769
    Height = 65
    TabOrder = 0
    object LabeledEdit1: TLabeledEdit
      Left = 24
      Top = 22
      Width = 121
      Height = 21
      EditLabel.Width = 57
      EditLabel.Height = 13
      EditLabel.Caption = 'N'#176' de Corte'
      TabOrder = 0
      OnChange = LabeledEdit1Change
    end
    object CheckBox1: TCheckBox
      Left = 576
      Top = 24
      Width = 169
      Height = 17
      Caption = 'Ocultar cortes confeccionados'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 79
    Width = 769
    Height = 353
    DataSource = DataModule1.DSQCorte_pendiente
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDblClick = DBGrid1DblClick
  end
  object Panel2: TPanel
    Left = 8
    Top = 438
    Width = 769
    Height = 83
    TabOrder = 2
    object LabeledEdit2: TLabeledEdit
      Left = 280
      Top = 32
      Width = 121
      Height = 21
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'Producto'
      ReadOnly = True
      TabOrder = 0
    end
    object LabeledEdit3: TLabeledEdit
      Left = 624
      Top = 32
      Width = 121
      Height = 21
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'Cantidad'
      ReadOnly = True
      TabOrder = 1
    end
    object LabeledEdit4: TLabeledEdit
      Left = 96
      Top = 32
      Width = 121
      Height = 21
      EditLabel.Width = 57
      EditLabel.Height = 13
      EditLabel.Caption = 'N'#176' de Corte'
      ReadOnly = True
      TabOrder = 2
    end
    object LabeledEdit5: TLabeledEdit
      Left = 448
      Top = 32
      Width = 121
      Height = 21
      EditLabel.Width = 56
      EditLabel.Height = 13
      EditLabel.Caption = 'Id Producto'
      ReadOnly = True
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = 7
    Top = 527
    Width = 769
    Height = 83
    TabOrder = 3
    object Button2: TButton
      Left = 120
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 0
    end
    object Button3: TButton
      Left = 424
      Top = 32
      Width = 195
      Height = 25
      Caption = 'Confeccionar corte'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
end
