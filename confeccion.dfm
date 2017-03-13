object fconfeccion: Tfconfeccion
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Nueva Confecci'#243'n'
  ClientHeight = 663
  ClientWidth = 823
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
  object Panel_avios: TPanel
    Left = 2
    Top = 348
    Width = 822
    Height = 252
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 515
      Top = 15
      Width = 294
      Height = 218
      TabOrder = 0
      object LabeledEdit2: TLabeledEdit
        Left = 18
        Top = 79
        Width = 255
        Height = 21
        EditLabel.Width = 21
        EditLabel.Height = 13
        EditLabel.Caption = 'Avio'
        ReadOnly = True
        TabOrder = 0
        OnClick = LabeledEdit2Click
      end
      object LabeledEdit3: TLabeledEdit
        Left = 18
        Top = 119
        Width = 255
        Height = 21
        EditLabel.Width = 43
        EditLabel.Height = 13
        EditLabel.Caption = 'Cantidad'
        TabOrder = 1
        Text = '1'
      end
      object Button1: TButton
        Left = 156
        Top = 163
        Width = 117
        Height = 33
        Caption = 'Agregar Avio'
        TabOrder = 2
        OnClick = Button1Click
      end
      object Button4: TButton
        Left = 18
        Top = 163
        Width = 117
        Height = 33
        Caption = 'Eliminar Avio'
        Enabled = False
        TabOrder = 3
        OnClick = Button4Click
      end
    end
    object StringGrid1: TStringGrid
      Left = 10
      Top = 15
      Width = 487
      Height = 218
      ColCount = 3
      RowCount = 2
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 1
      OnClick = StringGrid1Click
    end
  end
  object botones: TGroupBox
    Left = 0
    Top = 599
    Width = 822
    Height = 61
    TabOrder = 2
    object Button2: TButton
      Left = 529
      Top = 15
      Width = 152
      Height = 33
      Caption = 'Confirmar confecci'#243'n'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 352
      Top = 15
      Width = 148
      Height = 33
      Caption = 'Cancelar confecci'#243'n'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object Panel_productos: TPanel
    Left = 0
    Top = -4
    Width = 823
    Height = 349
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 22
      Top = 6
      Width = 788
      Height = 155
      TabOrder = 0
      object LabeledEdit6: TLabeledEdit
        Left = 16
        Top = 32
        Width = 257
        Height = 21
        EditLabel.Width = 98
        EditLabel.Height = 13
        EditLabel.Caption = 'Nombre de producto'
        TabOrder = 0
        OnClick = LabeledEdit6Click
      end
      object LabeledEdit7: TLabeledEdit
        Left = 646
        Top = 69
        Width = 120
        Height = 21
        EditLabel.Width = 43
        EditLabel.Height = 13
        EditLabel.Caption = 'Cantidad'
        TabOrder = 5
        Text = '1'
        OnExit = LabeledEdit7Exit
      end
      object LabeledEdit4: TLabeledEdit
        Left = 646
        Top = 32
        Width = 137
        Height = 21
        EditLabel.Width = 101
        EditLabel.Height = 13
        EditLabel.Caption = 'Costo Unidad Prenda'
        TabOrder = 4
        Text = '1'
        OnExit = LabeledEdit4Exit
      end
      object LabeledEdit5: TLabeledEdit
        Left = 646
        Top = 120
        Width = 121
        Height = 21
        EditLabel.Width = 85
        EditLabel.Height = 13
        EditLabel.Caption = 'Costo Total Corte'
        ReadOnly = True
        TabOrder = 6
        Text = '1'
      end
      object LabeledEdit8: TLabeledEdit
        Left = 18
        Top = 69
        Width = 257
        Height = 21
        EditLabel.Width = 73
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#186' de producto'
        ReadOnly = True
        TabOrder = 1
      end
      object LabeledEdit1: TLabeledEdit
        Left = 18
        Top = 109
        Width = 255
        Height = 21
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'Taller'
        ReadOnly = True
        TabOrder = 2
        OnClick = LabeledEdit1Click
      end
      object LabeledEdit9: TLabeledEdit
        Left = 306
        Top = 32
        Width = 255
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'N'#186' de corte'
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 22
      Top = 167
      Width = 788
      Height = 154
      TabOrder = 1
      object Button7: TButton
        Left = 196
        Top = 40
        Width = 105
        Height = 33
        Caption = 'Observaciones'
        TabOrder = 0
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 196
        Top = 95
        Width = 105
        Height = 34
        Caption = 'Costura'
        TabOrder = 1
        OnClick = Button8Click
      end
      object CheckListBox1: TCheckListBox
        Left = 472
        Top = 51
        Width = 137
        Height = 70
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 19
        Items.Strings = (
          'Fliselina'
          'Tira limpieza'
          'Muestra')
        ParentFont = False
        TabOrder = 2
      end
    end
  end
end
