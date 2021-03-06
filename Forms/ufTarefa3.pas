unit ufTarefa3;

interface

uses
  Datasnap.DBClient, Data.DB,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TipoTotal = (tpTotal, tpTotalDiv);

  TfTarefa3 = class(TForm)
    lblValoresProjeto: TLabel;
    lblTotal: TLabel;
    lblTotalDivisoes: TLabel;
    dbgValoresProjeto: TDBGrid;
    btnTotal: TButton;
    btnTotalDivisoes: TButton;
    edtTotal: TEdit;
    edtTotalDivisoes: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnTotalDivisoesClick(Sender: TObject);
  private
    { Private declarations }
    FcdsValoresProjeto: TClientDataSet;
    FdsValoresProjeto: TDataSource;

    procedure CriarComponentes;
    procedure PopularRegistros;
    procedure OrdernarDataSet;
    procedure DestruirDataSets;

    function ObterTotais(oTipoTotal: TipoTotal): Currency;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btnTotalClick(Sender: TObject);
begin
  edtTotal.Text := CurrToStr(ObterTotais(tpTotal));
end;

procedure TfTarefa3.btnTotalDivisoesClick(Sender: TObject);
begin
  edtTotalDivisoes.Text := CurrToStr(ObterTotais(tpTotalDiv));
end;

procedure TfTarefa3.CriarComponentes;
begin
  FcdsValoresProjeto := TClientDataSet.Create(nil);
  FcdsValoresProjeto.FieldDefs.Add('IDPROJETO', ftInteger);
  FcdsValoresProjeto.FieldDefs.Add('NOMEPROJETO', ftString, 60);
  FcdsValoresProjeto.FieldDefs.Add('VALOR', ftCurrency);
  FcdsValoresProjeto.CreateDataSet;

  FdsValoresProjeto := TDataSource.Create(nil);
  FdsValoresProjeto.AutoEdit := False;
  FdsValoresProjeto.DataSet := FcdsValoresProjeto;

  dbgValoresProjeto.DataSource := FdsValoresProjeto;
  dbgValoresProjeto.Columns[0].FieldName := 'IDPROJETO';
  dbgValoresProjeto.Columns[1].FieldName := 'NOMEPROJETO';
  dbgValoresProjeto.Columns[2].FieldName := 'VALOR';
end;

procedure TfTarefa3.PopularRegistros;
var
  iIndex, iRandom: Integer;
begin
  iRandom := Random(100);
  for iIndex := iRandom to iRandom+9 do
  begin
    FcdsValoresProjeto.Append;
    FcdsValoresProjeto.FieldByName('IDPROJETO').AsInteger := iIndex;
    FcdsValoresProjeto.FieldByName('NOMEPROJETO').AsString := Format('Projeto %s', [IntToStr(iIndex)]);
    FcdsValoresProjeto.FieldByName('VALOR').AsCurrency := iIndex*10;
    FcdsValoresProjeto.Post;
  end;
end;

procedure TfTarefa3.OrdernarDataSet;
begin
  FcdsValoresProjeto.IndexFieldNames := 'IDPROJETO';
end;

procedure TfTarefa3.DestruirDataSets;
begin
  FreeAndNil(FcdsValoresProjeto);
  FreeAndNil(FdsValoresProjeto);
end;

function TfTarefa3.ObterTotais(oTipoTotal: TipoTotal): Currency;
var
  cValorTotal, cValorTotalAnt: Currency;
begin
  try
    cValorTotal := 0;
    cValorTotalAnt := 0;

    FcdsValoresProjeto.DisableControls;
    FcdsValoresProjeto.First;
    while not FcdsValoresProjeto.Eof do
    begin
      case oTipoTotal of
        tpTotal: cValorTotal := cValorTotal + FcdsValoresProjeto.Fields[2].AsCurrency;
        tpTotalDiv:
        begin
          if cValorTotalAnt <> 0 then
             cValorTotal := cValorTotal + FcdsValoresProjeto.Fields[2].AsCurrency / cValorTotalAnt;
          cValorTotalAnt := FcdsValoresProjeto.Fields[2].AsCurrency;
        end;
      end;
      FcdsValoresProjeto.Next;
    end;
  finally
    FcdsValoresProjeto.EnableControls;
  end;
  Result := cValorTotal;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DestruirDataSets;
  Destroy;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  CriarComponentes;
  PopularRegistros;
  OrdernarDataSet;
end;

end.
