program SimpleImport;

uses
  Forms,
  USimpleImport in 'USimpleImport.pas' {FSimpleImport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFSimpleImport, FSimpleImport);
  Application.Run;
end.
