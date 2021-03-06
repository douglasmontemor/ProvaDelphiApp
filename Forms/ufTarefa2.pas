unit ufTarefa2;

interface

uses
  ufProgresso,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TfTarefa2 = class(TForm)
    lblThread1: TLabel;
    lblThread2: TLabel;
    btnExecutar: TButton;
    pgbUm: TProgressBar;
    pgbDois: TProgressBar;
    edtThread1: TEdit;
    edtThread2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutarClick(Sender: TObject);
    procedure edtThread1KeyPress(Sender: TObject; var Key: Char);
    procedure edtThread2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FProgressoThread1: TProgressoThread;
    FProgressoThread2: TProgressoThread;

    procedure ValidarCampos;
    procedure ValidarExecucaoThreads;
    procedure ExecutarThreads;
    procedure DestruirThreads;
    function SomenteNumeros(Key: Char; Texto: string): Char;
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

procedure TfTarefa2.ValidarCampos;
begin
  if edtThread1.Text = EmptyStr then
  begin
    edtThread1.SetFocus;
    raise Exception.Create('Informe um valor!');
  end;

  if edtThread2.Text = EmptyStr then
  begin
    edtThread2.SetFocus;
    raise Exception.Create('Informe um valor!');
  end;
end;

procedure TfTarefa2.ValidarExecucaoThreads;
var
  bEmExecucao: Boolean;
begin
  bEmExecucao := False;
  if Assigned(FProgressoThread1) and Assigned(FProgressoThread2) then
     bEmExecucao := (not FProgressoThread1.Finished) and (not FProgressoThread1.Suspended)
      or (not FProgressoThread2.Finished) and (not FProgressoThread2.Suspended);

  if bEmExecucao then
     raise Exception.Create('As Threads ainda est?o em execuca??o!');
end;

procedure TfTarefa2.ExecutarThreads;
begin
  FProgressoThread1 := TProgressoThread.Create;
  FProgressoThread1.SetarPropriedades(StrToInt(edtThread1.Text), pgbUm);
  try
    FProgressoThread1.Start;
  except on E: Exception do
    raise Exception.Create(Format('Ocorreu um erro ao executar a Thread 1, Erro original: %s', [E.Message]));
  end;

  FProgressoThread2 := TProgressoThread.Create;
  FProgressoThread2.SetarPropriedades(StrToInt(edtThread2.Text), pgbDois);
  try
    FProgressoThread2.Start;
  except on E: Exception do
    raise Exception.Create(Format('Ocorreu um erro ao executar a Thread 2, Erro original: %s', [E.Message]));
  end;
end;

procedure TfTarefa2.DestruirThreads;
begin
  if Assigned(FProgressoThread1) then
     FProgressoThread1.Terminate;

  if Assigned(FProgressoThread2) then
     FProgressoThread2.Terminate;
end;

procedure TfTarefa2.edtThread1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := SomenteNumeros(Key, edtThread1.Text);
end;

procedure TfTarefa2.edtThread2KeyPress(Sender: TObject; var Key: Char);
begin
  Key := SomenteNumeros(Key, edtThread2.Text);
end;

function TfTarefa2.SomenteNumeros(Key: Char; Texto: string): Char;
begin
  if not (Key in ['0'..'9', Chr(8)]) then
     Key := #0;
  Result := Key;
end;

procedure TfTarefa2.btnExecutarClick(Sender: TObject);
begin
  ValidarCampos;
  ValidarExecucaoThreads;
  ExecutarThreads;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DestruirThreads;
  Destroy;
end;

end.
