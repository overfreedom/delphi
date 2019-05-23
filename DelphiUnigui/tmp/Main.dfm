object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 570
  ClientWidth = 1010
  Caption = 'MainForm'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnKeyUp = UniFormKeyUp
  KeyPreview = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object unsyntxdtx1: TUniSyntaxEditEx
    Left = 24
    Top = 135
    Width = 737
    Height = 345
    Hint = ''
    Lines.Strings = (
      'unsyntxdtx1')
    ClientEvents.ExtEvents.Strings = (
      
        'keyPress=function keypress(sender, event, oPts)'#13#10'{'#13#10'   alert('#39'se' +
        'nder.name='#39'+sender.name)'#13#10'}')
    Font.Height = -13
    Font.Name = 'Courier New'
    OnAjaxEvent = unsyntxdtx1AjaxEvent
  end
  object ubtn1: TUniButton
    Left = 520
    Top = 104
    Width = 75
    Height = 25
    Hint = ''
    Caption = #26356#25913#26679#24335
    TabOrder = 1
    ClientEvents.ExtEvents.Strings = (
      
        'click=function click(sender, e, eOpts)'#13#10'{'#13#10'  if(MainForm.unsyntx' +
        'dtx1.codeEditor.getOption('#39'theme'#39') =='#39'idea'#39'){'#13#10'     MainForm.uns' +
        'yntxdtx1.codeEditor.setOption('#39'theme'#39','#39'monokai'#39')'#13#10'   }'#13#10'   else'#13 +
        #10'     MainForm.unsyntxdtx1.codeEditor.setOption('#39'theme'#39','#39'idea'#39');' +
        '  '#13#10'}')
  end
  object ubtn2: TUniButton
    Left = 601
    Top = 104
    Width = 75
    Height = 25
    Hint = ''
    Caption = #26356#25913#23383#21495
    TabOrder = 2
    ClientEvents.ExtEvents.Strings = (
      
        'click=function click(sender, e, eOpts)'#13#10'{'#13#10'   MainForm.unsyntxdt' +
        'x1.setFontCSS('#39'font-size:'#39'+MainForm.undt1.getValue()+'#39'px'#39')'#13#10'}')
  end
  object undt1: TUniEdit
    Left = 682
    Top = 107
    Width = 121
    Hint = ''
    Text = ''
    TabOrder = 3
  end
  object ubtn3: TUniButton
    Left = 48
    Top = 104
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'save'
    TabOrder = 4
    OnClick = ubtn3Click
  end
  object ubtn4: TUniButton
    Left = 144
    Top = 104
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'compile'
    TabOrder = 5
    OnClick = ubtn4Click
  end
  object unm1: TUniMemo
    Left = 784
    Top = 160
    Width = 185
    Height = 193
    Hint = ''
    Lines.Strings = (
      'unm1')
    TabOrder = 6
  end
end
