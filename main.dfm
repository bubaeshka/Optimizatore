object Form1: TForm1
  Left = 430
  Top = 127
  Width = 926
  Height = 660
  Caption = 'Optimizatore 1.3.1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    910
    602)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 424
    Top = 528
    Width = 223
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1075#1088#1091#1078#1077#1085#1085#1099#1093' '#1087#1088#1086#1075#1088#1072#1084#1084':'
  end
  object Label2: TLabel
    Left = 656
    Top = 528
    Width = 3
    Height = 13
    Anchors = [akLeft, akBottom]
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 392
    Width = 393
    Height = 193
    Anchors = [akLeft, akBottom]
    Caption = #1054#1087#1090#1080#1084#1080#1079#1072#1094#1080#1103
    TabOrder = 5
    DesignSize = (
      393
      193)
    object Label5: TLabel
      Left = 12
      Top = 159
      Width = 69
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1064#1080#1088#1080#1085#1072' '#1088#1077#1079#1072':'
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 120
      Width = 177
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1076#1083#1080#1085#1085#1091':'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphRight
    end
    object BitBtn2: TBitBtn
      Left = 200
      Top = 120
      Width = 177
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1072#1088#1091#1102' '#1076#1083#1080#1085#1085#1091':'
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphRight
    end
    object ListView2: TListView
      Left = 8
      Top = 24
      Width = 369
      Height = 89
      Anchors = [akLeft, akBottom]
      Checkboxes = True
      Columns = <
        item
          Caption = #1044#1083#1080#1085#1085#1072' '#1079#1072#1075#1086#1090#1086#1074#1082#1080
          Width = 150
        end
        item
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          Width = 100
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
      OnMouseDown = ListView2MouseDown
    end
    object Edit3: TEdit
      Left = 96
      Top = 156
      Width = 89
      Height = 21
      Anchors = [akLeft, akBottom]
      TabOrder = 3
      Text = '5'
    end
    object Edit1: TEdit
      Left = 240
      Top = 160
      Width = 121
      Height = 21
      TabOrder = 4
      Visible = False
      OnKeyPress = Edit1KeyPress
    end
    object CheckBox1: TCheckBox
      Left = 200
      Top = 160
      Width = 97
      Height = 17
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      TabOrder = 5
      OnClick = CheckBox1Click
    end
  end
  object Button1: TButton
    Left = 472
    Top = 568
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 648
    Top = 568
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 1
    OnClick = Button2Click
  end
  object ListView1: TListView
    Left = 16
    Top = 8
    Width = 874
    Height = 177
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = #1048#1044
        Width = 35
      end
      item
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Width = 75
      end
      item
        Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
        Width = 120
      end
      item
        Caption = #1044#1083#1080#1085#1085#1072
        Width = 90
      end
      item
        AutoSize = True
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      end
      item
        AutoSize = True
        Caption = #1053#1086#1084#1077#1088' '#1089#1073#1086#1088#1082#1080
      end
      item
        Caption = #1047#1072#1075#1086#1090#1086#1074#1082#1072
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
  end
  object Button3: TButton
    Left = 728
    Top = 424
    Width = 121
    Height = 25
    Hint = #1054#1087#1090#1080#1084#1080#1079#1072#1094#1080#1103' '#1088#1072#1089#1082#1088#1086#1103
    Anchors = [akLeft, akBottom]
    Caption = #1054#1087#1090#1080#1084#1080#1079#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 200
    Width = 874
    Height = 185
    Anchors = [akLeft, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object Button4: TButton
    Left = 560
    Top = 568
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    TabOrder = 6
    OnClick = Button4Click
  end
  object OpenDialog1: TOpenDialog
    Left = 824
    Top = 568
  end
  object MainMenu1: TMainMenu
    Left = 792
    Top = 568
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N2Click
      end
      object CadWork1: TMenuItem
        Caption = #1055#1088#1080#1082#1088#1077#1087#1080#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102' CadWork'
        Enabled = False
        OnClick = CadWork1Click
      end
      object N7: TMenuItem
        Caption = #1047#1072#1087#1080#1089#1072#1090#1100' '#1082#1086#1085#1077#1095#1085#1091#1102' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
        Enabled = False
        OnClick = N7Click
      end
      object N22: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100' '#1085#1086#1084#1077#1088#1086#1074
        Enabled = False
        OnClick = N22Click
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N3Click
      end
    end
    object N4: TMenuItem
      Caption = #1050#1072#1076#1074#1086#1088#1082
      Enabled = False
      object N15: TMenuItem
        Caption = #1055#1077#1088#1077#1089#1095#1105#1090' '#1089#1077#1095#1077#1085#1080#1103
        Hint = #1087#1077#1088#1077#1089#1095#1105#1090' '#1074#1099#1089#1086#1090#1099' '#1080#1079#1076#1077#1083#1080#1081
        OnClick = N15Click
      end
      object N18: TMenuItem
        Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100' '#1086#1087#1077#1088#1072#1094#1080#1080
        OnClick = N18Click
      end
      object N19: TMenuItem
        Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1089#1090#1086#1088#1086#1085#1099' '#1088#1077#1079#1082#1080' '#1095#1072#1096#1077#1082' '#1087#1088#1103#1084#1072#1103
        OnClick = N19Click
      end
      object N27: TMenuItem
        Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1089#1090#1086#1088#1086#1085#1099' '#1088#1077#1079#1082#1080' '#1095#1072#1096#1077#1082' '#1087#1086#1083#1091#1073#1088#1091#1089' '#1087#1088#1103#1084#1072#1103
        OnClick = N27Click
      end
      object N25: TMenuItem
        Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1089#1090#1086#1088#1086#1085#1099' '#1088#1077#1079#1082#1080' '#1095#1072#1096#1077#1082' '#1086#1073#1088#1072#1090#1085#1072#1103
        OnClick = N25Click
      end
      object N28: TMenuItem
        Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1089#1090#1086#1088#1086#1085#1099' '#1088#1077#1079#1082#1080' '#1095#1072#1096#1077#1082' '#1087#1086#1083#1091#1073#1088#1091#1089' '#1086#1073#1088#1072#1090#1085#1072#1103
        OnClick = N28Click
      end
      object N6: TMenuItem
        Caption = #1056#1072#1079#1091#1087#1083#1086#1090#1085#1080#1090#1100' '#1092#1072#1081#1083' '#1087#1088#1086#1075#1088#1072#1084#1084' = '#1080#1079#1076#1077#1083#1080#1081
        Visible = False
        OnClick = N6Click
      end
      object N23: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1075#1083#1091#1073#1080#1085#1091' '#1089#1074#1077#1088#1083#1077#1085#1080#1103
        OnClick = N23Click
      end
      object N26: TMenuItem
        Caption = #1059#1073#1088#1072#1090#1100' "'#1087#1088#1086#1087#1080#1083#1099'"'
        OnClick = N26Click
      end
    end
    object N24: TMenuItem
      Caption = #1054#1087#1090#1080#1084#1080#1079#1072#1094#1080#1103
      Enabled = False
      object N8: TMenuItem
        Caption = #1054#1087#1090#1080#1084#1080#1079#1072#1094#1080#1103
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1085#1086#1084#1077#1088#1072
        OnClick = N9Click
      end
      object N17: TMenuItem
        Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1085#1086#1084#1077#1088#1072' ('#1087#1088#1086#1095#1080#1077' '#1080#1079#1076#1077#1083#1080#1103')'
        OnClick = N17Click
      end
    end
    object N20: TMenuItem
      Caption = #1042#1077#1085#1094#1099
      Enabled = False
      object N16: TMenuItem
        Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1084#1077#1089#1090#1072#1084#1080' '#1088#1077#1079#1082#1091' '#1095#1072#1096#1077#1082
        OnClick = N16Click
      end
      object N10: TMenuItem
        Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100' '#1085#1086#1084#1077#1088#1072'('#1042#1077#1085#1094#1099')'
        OnClick = N10Click
      end
    end
    object N11: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      Enabled = False
      object N12: TMenuItem
        Caption = #1047#1072#1087#1080#1089#1072#1090#1100' '#1085#1086#1084#1077#1088' '#1061
        OnClick = N12Click
      end
      object BTL1: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1075#1086#1083#1086#1074#1086#1082' BTL'
        OnClick = BTL1Click
      end
      object N5: TMenuItem
        Caption = #1055#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
        OnClick = N5Click
      end
      object N29: TMenuItem
        Caption = #1057#1083#1080#1103#1085#1080#1077' '#1092#1072#1081#1083#1086#1074
        OnClick = N29Click
      end
      object N30: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1086#1084#1077#1088#1072' '#1089#1073#1086#1088#1082#1080
        OnClick = N30Click
      end
    end
    object N13: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N21: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
        OnClick = N21Click
      end
      object N14: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N14Click
      end
    end
  end
  object OpenDialog2: TOpenDialog
    Left = 760
    Top = 568
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'btl'
    Filter = 'BTL '#1074#1077#1088#1089#1080#1103' 5.0|btl'
    Left = 728
    Top = 568
  end
  object SaveDialog2: TSaveDialog
    DefaultExt = 'txt'
    Left = 856
    Top = 568
  end
end
