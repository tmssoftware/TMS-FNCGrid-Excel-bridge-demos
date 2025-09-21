program OnDemandFormatting;

uses
  System.StartUpCopy,
  FMX.Forms,
  UOnDemandFormatting in 'UOnDemandFormatting.pas' {FMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMainForm, FMainForm);
  Application.Run;
end.
