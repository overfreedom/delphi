object fraAdminManager: TfraAdminManager
  Left = 0
  Top = 0
  Width = 1031
  Height = 544
  OnCreate = UniFrameCreate
  Layout = 'fit'
  TabOrder = 0
  ParentFont = False
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1031
    Height = 544
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    Layout = 'fit'
    object UniPanel2: TUniPanel
      Left = 1
      Top = 1
      Width = 1029
      Height = 128
      Hint = ''
      Align = alTop
      TabOrder = 1
      Caption = ''
      object UniDBNavigator1: TUniDBNavigator
        Left = 5
        Top = 100
        Width = 342
        Height = 25
        Hint = ''
        DataSource = dsAdmin
        TabOrder = 1
      end
      object UniEdit1: TUniEdit
        Left = 176
        Top = 48
        Width = 121
        Hint = ''
        Text = 'UniEdit1'
        TabOrder = 2
      end
    end
    object UniPanel3: TUniPanel
      Left = 1
      Top = 129
      Width = 1029
      Height = 414
      Hint = ''
      Align = alClient
      TabOrder = 2
      Caption = 'UniPanel3'
      Layout = 'fit'
      object UniPanel4: TUniPanel
        Left = 1
        Top = 1
        Width = 1027
        Height = 111
        Hint = ''
        Align = alClient
        TabOrder = 1
        Caption = 'UniPanel4'
        Layout = 'fit'
        LayoutConfig.Split = True
        ExplicitHeight = 239
        object undbgrdAdmin: TUniDBGrid
          Left = 1
          Top = 1
          Width = 1025
          Height = 109
          Hint = ''
          DataSource = dsAdmin
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 1
        end
      end
      object UniPanel5: TUniPanel
        Left = 1
        Top = 112
        Width = 1027
        Height = 301
        Hint = ''
        Align = alBottom
        TabOrder = 2
        Caption = 'UniPanel5'
        Layout = 'border'
        LayoutConfig.Split = True
        object UniPanel6: TUniPanel
          Left = 1
          Top = 1
          Width = 568
          Height = 299
          Hint = ''
          Align = alLeft
          TabOrder = 1
          TitleVisible = True
          Title = #24050#25480#35282#33394
          Caption = 'UniPanel6'
          Layout = 'fit'
          LayoutConfig.Split = True
          LayoutConfig.Region = 'west'
          object undbgrd1: TUniDBGrid
            Left = 1
            Top = 1
            Width = 566
            Height = 297
            Hint = ''
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 1
          end
        end
        object UniPanel7: TUniPanel
          Left = 568
          Top = 32
          Width = 256
          Height = 128
          Hint = ''
          TabOrder = 2
          TitleVisible = True
          Title = #21487#25480#35282#33394
          Caption = 'UniPanel7'
          Collapsible = True
          CollapseDirection = cdLeft
          Collapsed = True
          Layout = 'fit'
          LayoutConfig.Region = 'center'
          object undbgrd2: TUniDBGrid
            Left = 1
            Top = 1
            Width = 254
            Height = 126
            Hint = ''
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 1
          end
        end
        object UniPanel8: TUniPanel
          Left = 569
          Top = 1
          Width = 105
          Height = 299
          Hint = ''
          Align = alLeft
          TabOrder = 3
          Caption = ''
          LayoutConfig.Region = 'west'
          ExplicitLeft = 575
          ExplicitTop = 64
          ExplicitHeight = 128
          object ubtn1: TUniButton
            Left = 16
            Top = 120
            Width = 75
            Height = 25
            Hint = ''
            Caption = '>>'
            TabOrder = 1
          end
          object ubtn2: TUniButton
            Left = 16
            Top = 157
            Width = 75
            Height = 25
            Hint = ''
            Caption = '<<'
            TabOrder = 2
          end
        end
      end
    end
  end
  object dsAdmin: TDataSource
    DataSet = DMUserManager.fdqryAdmin
    Left = 936
    Top = 312
  end
end
