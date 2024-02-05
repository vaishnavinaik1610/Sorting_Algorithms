object Frame_Template: TFrame_Template
  Left = 0
  Top = 0
  Width = 163
  Height = 320
  TabOrder = 0
  object PN_Template: TPanel
    Left = 0
    Top = 0
    Width = 163
    Height = 320
    Align = alClient
    TabOrder = 0
    object LB_Algorithm: TLabel
      Left = 1
      Top = 1
      Width = 161
      Height = 25
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Sorting Algorithm'
      Layout = tlCenter
      ExplicitWidth = 159
    end
    object LB_TimeInfo: TLabel
      AlignWithMargins = True
      Left = 11
      Top = 277
      Width = 151
      Height = 42
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      AutoSize = False
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentColor = False
      ParentFont = False
      WordWrap = True
      StyleElements = [seClient, seBorder]
      ExplicitLeft = 10
      ExplicitWidth = 153
    end
    object ED_ListBox: TMemo
      AlignWithMargins = True
      Left = 11
      Top = 29
      Width = 141
      Height = 245
      Margins.Left = 10
      Margins.Right = 10
      Align = alClient
      EditMargins.Left = 40
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      StyleName = 'Turquoise Gray'
    end
  end
end
