program OnDemandFormatting;

uses
  Forms,
  UOnDemandFormatting in 'UOnDemandFormatting.pas' {FMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMainForm, FMainForm);
  Application.Run;
end.
