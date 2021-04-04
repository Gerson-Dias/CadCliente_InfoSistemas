unit uEnviarEmailController;

interface

uses System.Classes,System.IniFiles,IdComponent,IdTCPConnection,IdTCPClient,
    IdHTTP,IdBaseComponent,IdMessage,IdExplicitTLSClientServerBase,IdMessageClient,
    IdSMTPBase,IdSMTP,IdIOHandler,IdIOHandlerSocket,IdIOHandlerStack,IdSSL,
    IdSSLOpenSSL,IdAttachmentFile,IdText, System.SysUtils;

type
  TEnviarEmailController = class
    public
      function EnviarEmail(const sAssunto, sDestino, sAnexo: String; sCorpo: TStringList): Boolean;
  end;

implementation

function TEnviarEmailController.EnviarEmail(const sAssunto, sDestino, sAnexo: String; sCorpo: TStringList): Boolean;
var
  IniFile              : TIniFile;
  sFrom                : String;
  sHost                : String;
  iPort                : Integer;
  sUserName            : String;
  sPassword            : String;
  idMsg                : TIdMessage;
  IdText               : TIdText;
  idSMTP               : TIdSMTP;
  IdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin

  try
    IniFile    := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'ConfigEmail.ini');
    sFrom      := IniFile.ReadString('Email', 'From', EmptyStr);
    sHost      := IniFile.ReadString('Email', 'Host', EmptyStr);
    iPort      := IniFile.ReadInteger('Email', 'Port', 0);
    sUserName  := IniFile.ReadString('Email', 'UserName', EmptyStr);
    sPassword  := IniFile.ReadString('Email', 'Password', EmptyStr);

    if ( sFrom = EmptyStr ) or
       ( sHost = EmptyStr ) or
       ( sUserName = EmptyStr ) or
       ( sPassword = EmptyStr ) or
       ( iPort = 0 ) then
     begin
       IniFile.Free;
      raise Exception.Create('Falta configuação de EMail!');
     end;

    try
      IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode   := sslmClient;

      idMsg                            := TIdMessage.Create(nil);
      idMsg.CharSet                    := 'utf-8';
      idMsg.Encoding                   := meMIME;
      idMsg.From.Name                  := 'Info Sistemas - Cadastro de Cliente';
      idMsg.From.Address               := sFrom;
      idMsg.Priority                   := mpNormal;
      idMsg.Subject                    := sAssunto;

      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := sDestino;
      idMsg.CCList.EMailAddresses     := EmptyStr;
      idMsg.BccList.EMailAddresses    := EmptyStr;

      idText := TIdText.Create(idMsg.MessageParts);
      idText.Body.Add(sCorpo.Text);
      idText.ContentType := 'text/html; text/plain; charset=iso-8859-1';

      IdSMTP            := TIdSMTP.Create(nil);
      IdSMTP.IOHandler  := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS     := utUseImplicitTLS;
      IdSMTP.AuthType   := satDefault;
      IdSMTP.Host       := sHost;
      IdSMTP.AuthType   := satDefault;
      IdSMTP.Port       := iPort;
      IdSMTP.Username   := sUserName;
      IdSMTP.Password   := sPassword;

      IdSMTP.Connect;
      IdSMTP.Authenticate;

      if sAnexo <> EmptyStr then
        if FileExists(sAnexo) then
          TIdAttachmentFile.Create(idMsg.MessageParts, sAnexo);

      if IdSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except on E:Exception do
          raise Exception.Create('Erro ao tentar enviar Email: ' + E.Message);
        end;
      end;

      if IdSMTP.Connected then
        IdSMTP.Disconnect;

      Result := True;
    finally
      IniFile.Free;

      UnLoadOpenSSLLibrary;

      FreeAndNil(idMsg);
      FreeAndNil(IdSSLIOHandlerSocket);
      FreeAndNil(idSMTP);
    end;
  except on e:Exception do
      raise Exception.Create('Erro ao tentar enviar Email: ' + E.Message);
  end;
end;


end.
