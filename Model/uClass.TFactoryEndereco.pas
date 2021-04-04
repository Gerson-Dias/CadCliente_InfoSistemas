unit uClass.TFactoryEndereco;

interface

uses uInterfaces, uClass.TEndereco;

type
  TFactoryEndereco = class (TInterfacedObject, iFactoryEndereco)
  public
    function Endereco: iEndereco;
    constructor Create;
    destructor Destroy; override;
    class function NewObject: iFactoryEndereco;
  end;

implementation

{ TFactoryEndereco }

constructor TFactoryEndereco.Create;
begin

end;

destructor TFactoryEndereco.Destroy;
begin

  inherited;
end;

class function TFactoryEndereco.NewObject: iFactoryEndereco;
begin
  Result := Self.Create;
end;

function TFactoryEndereco.Endereco: iEndereco;
begin
  Result := TEndereco.NewObject;
end;


end.
