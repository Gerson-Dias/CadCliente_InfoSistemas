program InfoSistemas;

uses
  Vcl.Forms,
  uFrmPrincipal in 'View\uFrmPrincipal.pas' {frmPrincipal},
  uInterfaces in 'Model\uInterfaces.pas',
  uClass.TCliente in 'Model\uClass.TCliente.pas',
  uClass.TFactoryCliente in 'Model\uClass.TFactoryCliente.pas',
  uClass.TEndereco in 'Model\uClass.TEndereco.pas',
  uClass.TFactoryEndereco in 'Model\uClass.TFactoryEndereco.pas',
  uClass.TCEP in 'Model\uClass.TCEP.pas',
  uClass.TFactoryCEP in 'Model\uClass.TFactoryCEP.pas',
  uCEPController in 'Controller\uCEPController.pas',
  uEnviarEmailController in 'Controller\uEnviarEmailController.pas',
  uCriarXMLController in 'Controller\uCriarXMLController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
