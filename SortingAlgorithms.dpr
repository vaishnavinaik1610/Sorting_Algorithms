program SortingAlgorithms;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Frm_Main},
  Vcl.Themes,
  Vcl.Styles,
  SortThread in 'SortThread.pas',
  Template in 'Template.pas' {Frame1: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Test Project';
  TStyleManager.TrySetStyle('Lavender Classico');
  Application.CreateForm(TFrm_Main, Frm_Main);
  Application.Run;
end.
