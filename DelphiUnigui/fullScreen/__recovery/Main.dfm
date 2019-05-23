object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 411
  ClientWidth = 916
  Caption = 'MainForm'
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  ActiveControl = UniPanel1
  Layout = 'fit'
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel
    Left = 0
    Top = 57
    Width = 193
    Height = 354
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
    Height = 354
    Hint = ''
    Align = alClient
    TabOrder = 2
    Caption = 'UniPanel1'
    Layout = 'fit'
    ExplicitLeft = 8
    ExplicitWidth = 193
    ExplicitHeight = 318
    object UniDBGrid1: TUniDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 61
      Width = 715
      Height = 289
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
      Layout = 'fit'
      ExplicitLeft = 6
      ExplicitTop = -5
    end
  end
end
