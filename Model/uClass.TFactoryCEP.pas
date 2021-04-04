unit uClass.TFactoryCEP;

interface

uses uInterfaces, uClass.TCEP;

type
  TFactoryCEP = class (TInterfacedObject, iFactoryCEP)
  public
    function CEP: iCEP;
    constructor Create;
    destructor Destroy; override;
    class function NewObject: iFactoryCEP;
  end;

implementation

{ TFactoryCEP }

constructor TFactoryCEP.Create;
begin

end;

destructor TFactoryCEP.Destroy;
begin

  inherited;
end;

class function TFactoryCEP.NewObject: iFactoryCEP;
begin
  Result := Self.Create;
end;

function TFactoryCEP.CEP: iCEP;
begin
  Result := TCEP.NewObject;
end;


end.
