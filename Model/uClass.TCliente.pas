unit uClass.TCliente;

interface

uses
  uInterfaces;

type
  TCliente = class(TInterfacedObject, iCliente)
    private
      FID              : Integer;
      FNome            : String;
      FIdentidade      : String;
      FCPF             : String;
      FTelefone        : String;
      FEMail           : String;
      FEndereco        : iEndereco;

    public

      function ID            (Value: Integer)   : iCliente;   overload;
      function Nome          (Value: String)    : iCliente;   overload;
      function Identidade    (Value: String)    : iCliente;   overload;
      function CPF           (Value: String)    : iCliente;   overload;
      function Telefone      (Value: String)    : iCliente;   overload;
      function EMail         (Value: String)    : iCliente;   overload;
      function Endereco      (Value: iEndereco) : iEndereco;  overload;

      function ID            : Integer;    overload;
      function Nome          : String;     overload;
      function Identidade    : String;     overload;
      function CPF           : String;     overload;
      function Telefone      : String;     overload;
      function EMail         : String;     overload;
      function Endereco      : iEndereco;  overload;

      constructor Create;
      destructor Destroy; override;
      class function NewObject: iCliente;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin

end;

destructor TCliente.Destroy;
begin

  inherited;
end;

class function TCliente.NewObject: iCliente;
begin
  Result := Self.Create;
end;

function TCliente.ID(Value: Integer): iCliente;
begin
  Result := Self;
  FID := Value;
end;

function TCliente.Nome(Value: String): iCliente;
begin
  Result := Self;
  FNome := Value;
end;

function TCliente.Identidade(Value: String): iCliente;
begin
  Result := Self;
  FIdentidade := Value;
end;

function TCliente.CPF(Value: String): iCliente;
begin
  Result := Self;
  FCPF := Value;
end;

function TCliente.Telefone(Value: String): iCliente;
begin
  Result := Self;
  FTelefone := Value;
end;

function TCliente.EMail(Value: String): iCliente;
begin
  Result := Self;
  FEMail := Value;
end;

function TCliente.Endereco(Value: iEndereco): iEndereco;
begin
  FEndereco := Value;
  Result := Self.FEndereco;
end;

function TCliente.ID: Integer;
begin
  Result := FID
end;

function TCliente.Nome: String;
begin
  Result := FNome
end;

function TCliente.Identidade: String;
begin
  Result := FIdentidade
end;

function TCliente.CPF: String;
begin
  Result := FCPF
end;

function TCliente.Telefone: String;
begin
  Result := FTelefone
end;

function TCliente.EMail: String;
begin
  Result := FEMail
end;

function TCliente.Endereco: iEndereco;
begin
  Result := FEndereco
end;


end.
