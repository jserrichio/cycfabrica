object fobservaciones: Tfobservaciones
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Observaciones'
  ClientHeight = 217
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 330
    Height = 129
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 8
    Top = 143
    Width = 330
    Height = 66
    TabOrder = 1
    object Button1: TButton
      Left = 200
      Top = 16
      Width = 91
      Height = 33
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object fobservaciones: TButton
      Left = 40
      Top = 16
      Width = 89
      Height = 33
      Caption = 'Borrar'
      TabOrder = 1
      OnClick = fobservacionesClick
    end
  end
end
