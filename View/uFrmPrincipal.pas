unit uFrmPrincipal;
{
Teste InfoSistemas - Gerson Dias
}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uInterfaces,
  uClass.TFactoryCliente, Vcl.Buttons, Vcl.ExtCtrls, uClass.TFactoryEndereco,
  uClass.TFactoryCEP, uCEPController, uEnviarEmailController, System.UITypes,
  uCriarXMLController;

type
  TfrmPrincipal = class(TForm)
    GroupBox1: TGroupBox;
    lblNome: TLabel;
    lblIdentidade: TLabel;
    lblCPF: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    edtNome: TEdit;
    edtIdentidade: TEdit;
    edtCPF: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    lblEndereco: TLabel;
    Bevel1: TBevel;
    lblCEP: TLabel;
    edtCEP: TEdit;
    lblLogradouro: TLabel;
    edtLogradouro: TEdit;
    lblBairro: TLabel;
    edtBairro: TEdit;
    lblCidade: TLabel;
    edtCidade: TEdit;
    lblEstado: TLabel;
    edtEstado: TEdit;
    lblPais: TLabel;
    edtPais: TEdit;
    lblNumero: TLabel;
    edtNumero: TEdit;
    lblComplemento: TLabel;
    edtComplemento: TEdit;
    spbBuscarCEP: TSpeedButton;
    chkEnviarEmail: TCheckBox;
    btnGravar: TButton;
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbBuscarCEPClick(Sender: TObject);
  private
    oCEP: iCEP;
    oEndereco: iEndereco;
    oCliente: iCliente;

    procedure GravarCliente;
    procedure EnviarEmail;
    procedure BuscarCEP;

    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
begin
  GravarCliente;

  if chkEnviarEmail.Checked then
    EnviarEmail;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TfrmPrincipal.GravarCliente;
begin
  oCEP := TFactoryCEP.NewObject.CEP;
  oCEP.CEP(edtCEP.Text);
  oCEP.Logradouro(edtLogradouro.Text);
  oCEP.Bairro(edtBairro.Text);
  oCEP.Localidade(edtCidade.Text);
  oCEP.UF(edtEstado.Text);

  oEndereco := TFactoryEndereco.NewObject.Endereco;
  oEndereco.CEP(oCEP);
  oEndereco.Pais(edtPais.Text);
  oEndereco.Numero(edtNumero.Text);
  oEndereco.Complemento(edtComplemento.Text);

  oCliente := TFactoryCliente.NewObject.Cliente;
  oCliente.Nome(edtNome.Text);
  oCliente.Identidade(edtIdentidade.Text);
  oCliente.CPF(edtCPF.Text);
  oCliente.Telefone(edtTelefone.Text);
  oCliente.EMail(edtEmail.Text);
  oCliente.Endereco(oEndereco);

  // Não foi solicitado persistência de dados
end;

procedure TfrmPrincipal.spbBuscarCEPClick(Sender: TObject);
begin
  BuscarCEP;
end;

procedure TfrmPrincipal.BuscarCEP;
var
  ctrCEP : TCEPController;
begin
  oCEP := TFactoryCEP.NewObject.CEP;

  ctrCEP := TCEPController.Create;
  try
    if ctrCEP.ValidarCEP(edtCEP.Text) then
    begin
      oCEP := ctrCEP.BuscarCEP(edtCEP.Text);

      edtLogradouro.Text := oCEP.Logradouro;
      edtBairro.Text     := oCEP.Bairro;
      edtCidade.Text     := oCEP.Localidade;
      edtEstado.Text     := oCEP.UF;
    end
    else
      MessageDLG('Informe um CEP válido.',mtError,[mbOk],0)
  finally
    ctrCEP.Free;
  end;
end;

procedure TfrmPrincipal.EnviarEmail;
var
  ctrEnviarEmail: TEnviarEmailController;
  sAssunto, sDestino, sAnexo: String;
  slCorpo: TStringList;
  ctrCriarXML: TCriarXMLController;
begin
  ctrEnviarEmail := TEnviarEmailController.Create;
  slCorpo        := TStringList.Create;
  ctrCriarXML    := TCriarXMLController.Create;

  try
    try
      if oCliente <> nil then
      begin
        sAssunto := 'Cadastro de Cliente';
        sDestino := oCliente.EMail;
        sAnexo   := '';

        slCorpo.Add('Segue dados cadastrados no sistema:');
        slCorpo.Add(EmptyStr);
        slCorpo.Add('Nome: ' + oCliente.Nome);
        slCorpo.Add('Identidade: ' + oCliente.Identidade);
        slCorpo.Add('CPF: ' + oCliente.CPF);
        slCorpo.Add('Telefone: ' + oCliente.Telefone);
        slCorpo.Add('Email: ' + oCliente.EMail);

        if oCliente.Endereco <> nil then
        begin
          if oCliente.Endereco.CEP <> nil then
          begin
            slCorpo.Add('CEP: ' + oCliente.Endereco.CEP.CEP);
            slCorpo.Add('Logradouro: ' + oCliente.Endereco.CEP.Logradouro);
            slCorpo.Add('Bairro: ' + oCliente.Endereco.CEP.Bairro);
            slCorpo.Add('Cidade: ' + oCliente.Endereco.CEP.Localidade);
            slCorpo.Add('Estado: ' + oCliente.Endereco.CEP.UF);
            slCorpo.Add('Cidade: ' + oCliente.Endereco.CEP.Localidade);
          end;

          slCorpo.Add('Pais: ' + oCliente.Endereco.Pais);
          slCorpo.Add('Numero: ' + oCliente.Endereco.Numero);
          slCorpo.Add('Complemento: ' + oCliente.Endereco.Complemento);
        end;

        sAnexo := ctrCriarXML.CriarXML(oCliente);

        if ctrEnviarEmail.EnviarEmail(sAssunto, sDestino, sAnexo, slCorpo) then
          MessageDLG('EMail enviado com sucesso!' , mtInformation,[mbOk],0)
        else
          MessageDLG('EMail não enviado.',mtError,[mbOk],0)
      end;

    except on E:Exception do
      MessageDLG('Falha no envio de EMail!' + #13 + E.Message,mtError,[mbOk],0)
    end;
  finally
    ctrEnviarEmail.Free;
    slCorpo.Free;
    ctrCriarXML.Free;
  end;
end;

end.
