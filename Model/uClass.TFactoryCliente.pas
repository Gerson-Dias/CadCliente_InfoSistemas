unit uClass.TFactoryCliente;

interface

uses uInterfaces, uClass.TCliente;

type
    TFactoryCliente = class(TInterfacedObject, iFactoryCliente)
    public
      function Cliente: iCliente;
      constructor Create;
      destructor Destroy; override;
      class function NewObject: iFactoryCliente;
    end;

implementation

{ TFactoryCliente }

constructor TFactoryCliente.Create;
begin

end;

destructor TFactoryCliente.Destroy;
begin

  inherited;
end;

class function TFactoryCliente.NewObject: iFactoryCliente;
begin
  Result := Self.Create;
end;

function TFactoryCliente.Cliente: iCliente;
begin
  Result := TCliente.NewObject;
end;

end.
