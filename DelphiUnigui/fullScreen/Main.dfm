object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 375
  ClientWidth = 916
  Caption = 'MainForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  ActiveControl = UniPanel1
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel
    Left = 0
    Top = 57
    Width = 193
    Height = 318
    Hint = ''
    Align = alLeft
    TabOrder = 0
    Caption = 'UniPanel2'
    ExplicitTop = 0
    ExplicitHeight = 375
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 0
    Width = 916
    Height = 57
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = 'UniPanel1'
  end
  object UniPanel3: TUniPanel
    Left = 193
    Top = 57
    Width = 723
    Height = 318
    Hint = ''
    Align = alClient
    TabOrder = 2
    Caption = 'UniPanel1'
    ExplicitLeft = 8
    ExplicitWidth = 193
    object UniDBGrid1: TUniDBGrid
      Left = 1
      Top = 58
      Width = 721
      Height = 259
      Hint = ''
      DataSource = UniMainModule.DBillPre1
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
    end
    object UniPanel4: TUniPanel
      Left = 1
      Top = 1
      Width = 721
      Height = 57
      Hint = ''
      Align = alTop
      TabOrder = 2
      Caption = 'UniPanel3'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 916
    end
  end
end
