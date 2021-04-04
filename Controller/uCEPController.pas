unit uCEPController;

interface

uses
  uClass.TCEP, uInterfaces, System.Classes, System.SysUtils, IdHTTP, IdSSLOpenSSL,
  System.JSon, REST.Json, REST.Consts, REST.Client;
type
  TCEPController = class
    public
      function BuscarCEP(pCEPNumero: String): iCEP;
      function ValidarCEP(pCEP: String): Boolean;
  end;

implementation


{ TCEPController }

function TCEPController.BuscarCEP(pCEPNumero: String): iCEP;
var
  jsDados    : TJSONObject;
  rsClient   : TRESTClient;
  rsRequest  : TRESTRequest;
  rsResponse : TRESTResponse;
  sURLCons   : String;
begin

  rsClient   := TRESTClient.Create(nil);
  rsRequest  := TRESTRequest.Create(nil);
  rsResponse := TRESTResponse.Create(nil);

  try

    sURLCons := pCEPNumero;
    sURLCons := Format('https://viacep.com.br/ws/%s/json', [sURLCons.Trim]);

    rsRequest.Client   := rsClient;
    rsRequest.Response := rsResponse;
    rsClient.BaseURL   := sURLCons;
    rsRequest.Execute;
    jsDados := rsResponse.JSONValue as TJSONObject;

    if Assigned(jsDados) then
      Result := TJson.JsonToObject<TCEP>(jsDados).Create;

  finally
    jsDados.Free;
    rsClient.Free;
    rsRequest.Free;
  end;

end;

function TCEPController.ValidarCEP(pCEP: String): Boolean;
begin
  if pCep.Trim.Length <> 8 then
    Result := False
  else
  if StrToIntDef(pCep, -1) < 0 then
    Result := False
  else
    Result := True;
end;

end.
