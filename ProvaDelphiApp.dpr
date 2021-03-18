program ProvaDelphiApp;

uses
  Vcl.Forms,
  UProvaDelphiApp in 'Forms\UProvaDelphiApp.pas' {fProvaDelphiApp},
  ufTarefa1 in 'Forms\ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'Forms\ufTarefa2.pas' {fTarefa2},
  ufTarefa3 in 'Forms\ufTarefa3.pas' {fTarefa3},
  ufProgresso in 'Classes\ufProgresso.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfProvaDelphiApp, fProvaDelphiApp);
  Application.Run;
end.
