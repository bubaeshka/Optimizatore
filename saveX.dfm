object Form5: TForm5
  Left = 412
  Top = 329
  Width = 372
  Height = 99
  BorderIcons = [biSystemMenu]
  Caption = #1047#1072#1087#1080#1089#1072#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#8470' X '#1074' '#1092#1072#1081#1083
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 16
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 168
    Top = 16
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 264
    Top = 16
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'btl'
    Filter = 'BTL version 5.0|btl'
    Left = 128
    Top = 24
  end
end
