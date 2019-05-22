object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 286
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 24
    Top = 42
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object btn1: TButton
    Left = 24
    Top = 80
    Width = 75
    Height = 25
    Caption = 'hash'
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 184
    Top = 40
    Width = 75
    Height = 25
    Caption = 'genRandom'
    TabOrder = 2
    OnClick = btn2Click
  end
  object dbmmo1: TDBMemo
    Left = 288
    Top = 16
    Width = 353
    Height = 201
    TabOrder = 3
  end
  object btn3: TButton
    Left = 184
    Top = 128
    Width = 75
    Height = 25
    Caption = 'leftstring'
    TabOrder = 4
    OnClick = btn3Click
  end
end
