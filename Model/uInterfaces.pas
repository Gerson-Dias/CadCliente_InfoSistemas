unit uInterfaces;

interface

type
  iCEP = interface
    ['{8E413C02-7BEC-448B-8BB2-0617D562E3E1}']
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
  end;

  iFactoryCEP = interface
    ['{E2BEB481-5696-45EF-9AE4-3A26557FA763}']
    function CEP: iCEP;
  end;

  iEndereco = interface
    ['{E4D70C59-D29A-4C24-BA6A-D071E61BF828}']
    function CEP            (Value: iCEP)     : iCEP; overload;
    function Pais           (Value: String)   : iEndereco; overload;
    function Numero         (Value: String)   : iEndereco; overload;
    function Complemento    (Value: String)   : iEndereco; overload;

    function CEP            : iCEP; overload;
    function Pais           : String; overload;
    function Numero         : String; overload;
    function Complemento    : String; overload;
  end;

  iFactoryEndereco = interface
    ['{59090A2E-45E6-4310-86D5-F113D63649B3}']
    function Endereco: iEndereco;
  end;

  iCliente = interface
    ['{07C92B5C-F5E9-4478-B0F5-7B56CFD7975E}']
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
  end;

  iFactoryCliente = interface
    ['{7138B930-C3C2-452B-A3FF-34F07BBF8E14}']
    function Cliente: iCliente;
  end;


implementation

end.


