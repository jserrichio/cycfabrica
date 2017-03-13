object fcostura: Tfcostura
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Costura'
  ClientHeight = 218
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 361
    Height = 145
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 8
    Top = 159
    Width = 361
    Height = 51
    TabOrder = 1
    object Button1: TButton
      Left = 216
      Top = 8
      Width = 89
      Height = 33
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object fobservaciones: TButton
      Left = 56
      Top = 8
      Width = 89
      Height = 33
      Caption = 'Borrar'
      TabOrder = 1
      OnClick = fobservacionesClick
    end
  end
end
