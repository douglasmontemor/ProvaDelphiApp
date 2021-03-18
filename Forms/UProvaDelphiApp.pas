unit UProvaDelphiApp;

interface

uses
  ufTarefa1, ufTarefa2, ufTarefa3,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfProvaDelphiApp = class(TForm)
    Tarefas: TMainMenu;
    mtarefas: TMenuItem;
    mtarefa1: TMenuItem;
    mtarefa2: TMenuItem;
    mtarefa3: TMenuItem;
    N1: TMenuItem;
    mSair: TMenuItem;
    procedure mtarefa1Click(Sender: TObject);
    procedure mtarefa2Click(Sender: TObject);
    procedure mtarefa3Click(Sender: TObject);
    procedure mSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProvaDelphiApp: TfProvaDelphiApp;

implementation

{$R *.dfm}

procedure TfProvaDelphiApp.mSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfProvaDelphiApp.mtarefa1Click(Sender: TObject);
begin
  TfTarefa1.Create(Self);
end;

procedure TfProvaDelphiApp.mtarefa2Click(Sender: TObject);
begin
  TfTarefa2.Create(Self);
end;

procedure TfProvaDelphiApp.mtarefa3Click(Sender: TObject);
begin
  TfTarefa3.Create(Self);
end;

end.
