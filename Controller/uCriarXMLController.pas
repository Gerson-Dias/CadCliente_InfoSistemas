unit uCriarXMLController;

interface

uses uCEPController, uInterfaces,System.SysUtils, System.Classes,
     Xml.xmldom, Xml.XMLIntf, Vcl.StdCtrls, Xml.XMLDoc;
type
  TCriarXMLController = class
    public
      function CriarXML(oCliente: iCliente): String;
  end;
implementation

{ TCriarXMLController }

function TCriarXMLController.CriarXML(oCliente: iCliente): String;
var
  XMLDoc: TXMLDocument;
  ndCliente, ndEndereco: IXMLNode;
  sNomeArquivo: String;
begin
  Result := EmptyStr;

  XMLDoc := TXMLDocument.Create(nil);
  try

    XMLDoc.Active := True;
    XMLDoc.Encoding := 'UTF-8';

    if oCliente <> nil then
    begin
      ndCliente := XMLDoc.AddChild('Cliente');
      ndCliente.ChildValues['Nome']        := oCliente.Nome;
      ndCliente.ChildValues['Identidade']  := oCliente.Identidade;
      ndCliente.ChildValues['CPF']         := oCliente.CPF;
      ndCliente.ChildValues['Telefone']    := oCliente.Telefone;
      ndCliente.ChildValues['Email']       := oCliente.EMail;

      if oCliente.Endereco <> nil then
      begin
        ndEndereco := ndCliente.AddChild('Endereco');
        if oCliente.Endereco.CEP <> nil then
        begin
          ndEndereco.ChildValues['CEP']        := oCliente.Endereco.CEP.CEP;
          ndEndereco.ChildValues['Logradouro'] := oCliente.Endereco.CEP.Logradouro;
          ndEndereco.ChildValues['Bairro']     := oCliente.Endereco.CEP.Bairro;
          ndEndereco.ChildValues['Cidade']     := oCliente.Endereco.CEP.Localidade;
          ndEndereco.ChildValues['Estado']     := oCliente.Endereco.CEP.UF;
        end;

        ndEndereco.ChildValues['Pais']        := oCliente.Endereco.Pais;
        ndEndereco.ChildValues['Numero']      := oCliente.Endereco.Numero;
        ndEndereco.ChildValues['Complemento'] := oCliente.Endereco.Complemento;
      end;
      sNomeArquivo := ExtractFilePath(ParamStr(0)) + 'cliente.xml';
      XMLDoc.SaveToFile(sNomeArquivo);
      if FileExists(sNomeArquivo) then
        Result := sNomeArquivo
    end;

    sNomeArquivo := ExtractFilePath(ParamStr(0)) + 'cliente.xml';
    XMLDoc.SaveToFile(sNomeArquivo);
    if FileExists(sNomeArquivo) then
      Result := sNomeArquivo

  finally
    begin
      XMLDoc.Active := False;
    end;
  end;

end;


end.

