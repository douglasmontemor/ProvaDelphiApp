object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Tarefa 1'
  ClientHeight = 307
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblSQLGerado: TLabel
    Left = 8
    Top = 176
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object lblColunas: TLabel
    Left = 8
    Top = 13
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object lblTabelas: TLabel
    Left = 176
    Top = 13
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object lblCondicoes: TLabel
    Left = 344
    Top = 13
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object moColunas: TMemo
    Left = 8
    Top = 32
    Width = 153
    Height = 121
    Hint = 'Coluna'
    TabOrder = 0
    OnKeyPress = moColunasKeyPress
  end
  object moTabelas: TMemo
    Left = 176
    Top = 32
    Width = 153
    Height = 121
    Hint = 'Tabela'
    TabOrder = 1
    OnKeyPress = moTabelasKeyPress
  end
  object moCondicoes: TMemo
    Left = 344
    Top = 32
    Width = 153
    Height = 121
    Hint = 'Condi'#231#245'es'
    TabOrder = 2
  end
  object btnGeraSQL: TButton
    Left = 503
    Top = 32
    Width = 88
    Height = 73
    Caption = 'GeraSQL'
    TabOrder = 3
    OnClick = btnGeraSQLClick
  end
  object moSQLGerado: TMemo
    Left = 8
    Top = 163
    Width = 579
    Height = 136
    Hint = 'SQLGerado'
    ReadOnly = True
    TabOrder = 4
  end
  object spGeraSQL: TspQuery
    Left = 288
    Top = 208
  end
end
