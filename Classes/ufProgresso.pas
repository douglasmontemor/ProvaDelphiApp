unit ufProgresso;

interface

uses
  Classes, Windows, System.SysUtils, Vcl.Dialogs, Vcl.ComCtrls;

type
  TProgressoThread = Class(TThread)
  private
    FMiliSegundos: Integer;
    FProgressbar: TProgressbar;
  protected
    procedure Execute; Override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetarPropriedades(MiliSegundos: Integer; ProgressBar: TProgressBar);
  end;

implementation

{ TProgressoThread }

constructor TProgressoThread.Create;
begin
  inherited
  Create(True);
  FreeOnTerminate := True;
end;

destructor TProgressoThread.Destroy;
begin
  inherited
  Destroy;
end;

procedure TProgressoThread.Execute;
var
  iIndex: Integer;
begin
  inherited;
  for iIndex := 0 to 100 do
  begin
    if Terminated then
      Break;

    Sleep(FMiliSegundos);
    FProgressbar.Position := iIndex;
  end;
end;

procedure TProgressoThread.SetarPropriedades(MiliSegundos: Integer; ProgressBar: TProgressBar);
begin
  FMiliSegundos := MiliSegundos;
  FProgressBar := ProgressBar;
end;

end.
