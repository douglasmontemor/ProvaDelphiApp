unit ufTarefa1;

interface

uses
  uspQuery,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfTarefa1 = class(TForm)
    lblSQLGerado: TLabel;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    moColunas: TMemo;
    moTabelas: TMemo;
    moCondicoes: TMemo;
    btnGeraSQL: TButton;
    moSQLGerado: TMemo;
    spGeraSQL: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSQLClick(Sender: TObject);
    procedure moColunasKeyPress(Sender: TObject; var Key: Char);
    procedure moTabelasKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure ValidaMemosPreenchidos;
    procedure ValidarEstrutura(Memo: TMemo);
    procedure GeraSQL;
    function SomenteLetrasNumeros(Key: Char; Texto: string): Char;
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.ValidaMemosPreenchidos;
begin
  if moColunas.Lines.Count = 0 then
    raise Exception.Create('Por favor, preencha as Colunas');

  if moTabelas.Lines.Count = 0 then
    raise Exception.Create('Por favor, preencha uma ?nica Tabela');
end;

procedure TfTarefa1.ValidarEstrutura(Memo: TMemo);
var
  iIndex: Integer;
  sMsgErro: String;
begin
  sMsgErro := EmptyStr;

  if (Memo.Name = 'moTabelas') and (Memo.Lines.Count > 1) then
     raise Exception.Create('? permitido informar somente uma tabela para a gera??o do SQL');

  for iIndex := 0 to Memo.Lines.Count do
  begin
    if Pos(' ', Memo.Lines[iIndex]) > 0 then
       sMsgErro := sMsgErro + Memo.Lines[iIndex] +#13#10;
  end;

  if (sMsgErro <> EmptyStr) and (Memo.Name <> 'moCondicoes') then
     raise Exception.Create(Format('Estrutura inv?lida, informe uma %s por linha: %s', [Memo.Hint, sMsgErro]));
end;

procedure TfTarefa1.GeraSQL;
begin
  spGeraSQL.spColunas.Text := moColunas.Text;
  spGeraSQL.spTabelas.Text := moTabelas.Text;
  spGeraSQL.spCondicoes.Text := moCondicoes.Text;

  moSQLGerado.Text := spGeraSQL.GeraSQL;
end;

procedure TfTarefa1.moColunasKeyPress(Sender: TObject; var Key: Char);
begin
  Key := SomenteLetrasNumeros(Key, moColunas.Text);
end;

procedure TfTarefa1.moTabelasKeyPress(Sender: TObject; var Key: Char);
begin
  Key := SomenteLetrasNumeros(Key, moTabelas.Text);
end;

function TfTarefa1.SomenteLetrasNumeros(Key: Char; Texto: string): Char;
begin
  if not (CharInSet(Key,['A'..'Z','a'..'z','0'..'9',' ',#8,#13])) then
     key := #0;
  Result := Key;
end;

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  ValidaMemosPreenchidos;
  ValidarEstrutura(moTabelas);
  ValidarEstrutura(moColunas);
  GeraSQL;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Destroy;
end;

end.
