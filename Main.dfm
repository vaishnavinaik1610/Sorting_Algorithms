object Frm_Main: TFrm_Main
  Left = 0
  Top = 0
  Caption = 'Sorting Algorithms'
  ClientHeight = 362
  ClientWidth = 716
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  StyleName = 'Turquoise Gray'
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object BTN_Sort: TButton
    Left = 280
    Top = 334
    Width = 185
    Height = 25
    Caption = 'Sort'
    DisabledImageName = 'BTN_SOrt'
    TabOrder = 0
    OnClick = BTN_SortClick
  end
  inline Frame_QuickSort: TFrame_Template
    Left = 363
    Top = 8
    Width = 163
    Height = 321
    TabOrder = 1
    ExplicitLeft = 363
    ExplicitTop = 8
    ExplicitHeight = 321
    inherited PN_Template: TPanel
      Height = 321
      ExplicitHeight = 321
      inherited LB_Algorithm: TLabel
        Caption = 'Quick Sort'
      end
      inherited LB_TimeInfo: TLabel
        Top = 278
        ExplicitTop = 278
      end
      inherited ED_ListBox: TMemo
        Height = 246
        ExplicitHeight = 246
      end
    end
  end
  inline Frame_BubbleSort: TFrame_Template
    Left = 11
    Top = 8
    Width = 163
    Height = 320
    TabOrder = 2
    ExplicitLeft = 11
    ExplicitTop = 8
    inherited PN_Template: TPanel
      inherited LB_Algorithm: TLabel
        Caption = 'Bubble Sort'
      end
    end
  end
  inline Frame_MergeSort: TFrame_Template
    Left = 186
    Top = 8
    Width = 163
    Height = 320
    TabOrder = 3
    ExplicitLeft = 186
    ExplicitTop = 8
    inherited PN_Template: TPanel
      inherited LB_Algorithm: TLabel
        Caption = 'Merge Sort'
      end
    end
  end
  inline TFrame_SelectionSort: TFrame_Template
    Left = 540
    Top = 8
    Width = 163
    Height = 320
    TabOrder = 4
    ExplicitLeft = 540
    ExplicitTop = 8
    inherited PN_Template: TPanel
      ExplicitTop = 10
      inherited LB_Algorithm: TLabel
        Caption = 'Selection Sort'
      end
    end
  end
end
