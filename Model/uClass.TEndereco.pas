unit uClass.TEndereco;

interface

uses
  uInterfaces;

type
  TEndereco = Class(TInterfacedObject, iEndereco)
    private
      FCEP           : iCEP;
      FPais          : String;
      FNumero        : String;
      FComplemento   : String;

    public

      function CEP            (Value: iCEP)     : iCEP; overload;
      function Pais           (Value: String)   : iEndereco; overload;
      function Numero         (Value: String)   : iEndereco; overload;
      function Complemento    (Value: String)   : iEndereco; overload;

      function CEP            : iCEP; overload;
      function Pais           : String; overload;
      function Numero         : String; overload;
      function Complemento    : String; overload;

      constructor Create;
      destructor Destroy; override;
      class function NewObject: iEndereco;
  end;

implementation

{ TEndereco }

constructor TEndereco.Create;
begin

end;

destructor TEndereco.Destroy;
begin

  inherited;
end;

class function TEndereco.NewObject: iEndereco;
begin
  Result := Self.Create;
end;

function TEndereco.CEP(Value: iCEP): iCEP;
begin
  FCEP := Value;
  Result := FCEP;
end;

function TEndereco.Pais(Value: String): iEndereco;
begin
  Result := Self;
  FPais := Value;
end;

function TEndereco.Numero(Value: String): iEndereco;
begin
  Result := Self;
  FNumero := Value;
end;

function TEndereco.Complemento(Value: String): iEndereco;
begin
  Result := Self;
  FComplemento := Value;
end;

function TEndereco.CEP: iCEP;
begin
  Result := FCEP;
end;

function TEndereco.Pais: String;
begin
  Result := FPais;
end;

function TEndereco.Numero: String;
begin
  Result := FNumero
end;

function TEndereco.Complemento: String;
begin
  Result := FComplemento
end;

end.
