object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 242
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 56
    Top = 24
    Width = 60
    Height = 13
    Caption = #21407#22987#23383#31526#20018
  end
  object lbl2: TLabel
    Left = 56
    Top = 85
    Width = 60
    Height = 13
    Caption = #27491#21017#34920#36798#24335
  end
  object medtorginStr: TMaskEdit
    Left = 56
    Top = 48
    Width = 377
    Height = 21
    TabOrder = 0
    Text = 'medtorginStr'
  end
  object medtPar: TMaskEdit
    Left = 56
    Top = 104
    Width = 377
    Height = 21
    TabOrder = 1
    Text = 'medtPar'
  end
  object btn1: TButton
    Left = 56
    Top = 160
    Width = 75
    Height = 25
    Caption = #26159#21542#21305#37197
    TabOrder = 2
    OnClick = btn1Click
  end
end
