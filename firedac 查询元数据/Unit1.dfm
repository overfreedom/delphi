object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 242
  ClientWidth = 472
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
  object dbgrd1: TDBGrid
    Left = 72
    Top = 8
    Width = 384
    Height = 169
    DataSource = ds1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btn1: TButton
    Left = 120
    Top = 209
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 1
  end
  object fdqry1: TFDQuery
    Connection = fdcon1
    SQL.Strings = (
      
        'SELECT a.id,a.roleid, b.caption,b.descript FROM relate_roleacces' +
        's  a'
      'LEFT JOIN proclist b on a.proclistid = b.id'
      'where 1=2')
    Left = 40
    Top = 24
  end
  object fdcon1: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL'
      'Address=.'
      'Password=0000'
      'User_Name=sa'
      'Server=.'
      'Database=ginfo')
    LoginPrompt = False
    Left = 24
    Top = 72
  end
  object ds1: TDataSource
    DataSet = fdqry1
    Left = 24
    Top = 176
  end
end
