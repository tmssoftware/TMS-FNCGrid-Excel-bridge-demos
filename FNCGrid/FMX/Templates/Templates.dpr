program Templates;

uses
  System.StartUpCopy,
  FMX.Forms,
  UTemplates in 'UTemplates.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
