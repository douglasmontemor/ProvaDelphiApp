object fProvaDelphiApp: TfProvaDelphiApp
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Menu Prova Delphi App'
  ClientHeight = 498
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = Tarefas
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Tarefas: TMainMenu
    Left = 16
    Top = 8
    object mtarefas: TMenuItem
      Caption = '&Tarefas'
      object mtarefa1: TMenuItem
        Caption = 'Tarefa &1'
        OnClick = mtarefa1Click
      end
      object mtarefa2: TMenuItem
        Caption = 'Tarefa &2'
        OnClick = mtarefa2Click
      end
      object mtarefa3: TMenuItem
        Caption = 'Tarefa &3'
        OnClick = mtarefa3Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mSair: TMenuItem
        Caption = '&Sair'
        OnClick = mSairClick
      end
    end
  end
end
