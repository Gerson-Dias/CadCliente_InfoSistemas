unit uClass.TCEP;

interface

uses
  uInterfaces;

type
  TCEP = Class(TInterfacedObject, iCEP)
    private
      FCEP           : String;
      FLogradouro    : String;
      FComplemento   : String;
      FBairro        : String;
      FLocalidade    : String;
      FUF            : String;
      FIBGE          : String;
      FGIA           : String;
      FDDD           : String;
      FSIAFI         : String;

    public

      function CEP            (Value: String)   : iCEP; overload;
      function Logradouro     (Value: String)   : iCEP; overload;
      function Complemento    (Value: String)   : iCEP; overload;
      function Bairro         (Value: String)   : iCEP; overload;
      function Localidade     (Value: String)   : iCEP; overload;
      function UF             (Value: String)   : iCEP; overload;
      function IBGE           (Value: String)   : iCEP; overload;
      function GIA            (Value: String)   : iCEP; overload;
      function DDD            (Value: String)   : iCEP; overload;
      function SIAFI          (Value: String)   : iCEP; overload;

      function CEP            : String; overload;
      function Logradouro     : String; overload;
      function Complemento    : String; overload;
      function Bairro         : String; overload;
      function Localidade     : String; overload;
      function UF             : String; overload;
      function IBGE           : String; overload;
      function GIA            : String; overload;
      function DDD            : String; overload;
      function SIAFI          : String; overload;

      constructor Create;
      destructor Destroy; override;
      class function NewObject: iCEP;
  end;

implementation

{ TCEP }

constructor TCEP.Create;
begin

end;

destructor TCEP.Destroy;
begin

  inherited;
end;

class function TCEP.NewObject: iCEP;
begin
  Result := Self.Create;
end;

function TCEP.CEP(Value: String): iCEP;
begin
  Result := Self;
  FCEP := Value;
end;

function TCEP.Logradouro(Value: String): iCEP;
begin
  Result := Self;
  FLogradouro := Value;
end;

function TCEP.Complemento(Value: String): iCEP;
begin
  Result := Self;
  FComplemento := Value;
end;

function TCEP.Bairro(Value: String): iCEP;
begin
  Result := Self;
  FBairro := Value;
end;

function TCEP.Localidade(Value: String): iCEP;
begin
  Result := Self;
  FLocalidade := Value;
end;

function TCEP.UF(Value: String): iCEP;
begin
  Result := Self;
  FUF := Value;
end;

function TCEP.IBGE(Value: String): iCEP;
begin
  Result := Self;
  FIBGE := Value;
end;

function TCEP.GIA(Value: String): iCEP;
begin
  Result := Self;
  FGIA := Value;
end;

function TCEP.DDD(Value: String): iCEP;
begin
  Result := Self;
  FDDD := Value;
end;

function TCEP.SIAFI(Value: String): iCEP;
begin
  Result := Self;
  FSIAFI := Value;
end;

function TCEP.CEP: String;
begin
  Result := FCEP
end;

function TCEP.Logradouro: String;
begin
  Result := FLogradouro
end;

function TCEP.Complemento: String;
begin
  Result := FComplemento
end;

function TCEP.Bairro: String;
begin
  Result := FBairro
end;

function TCEP.Localidade: String;
begin
  Result := FLocalidade
end;

function TCEP.UF: String;
begin
  Result := FUF
end;

function TCEP.IBGE: String;
begin
  Result := FIBGE
end;

function TCEP.GIA: String;
begin
  Result := FGIA
end;

function TCEP.DDD: String;
begin
  Result := FDDD
end;

function TCEP.SIAFI: String;
begin
  Result := FSIAFI
end;


end.
