unit Classe.Vendedor;

interface

uses
  Classe.Pessoa;

type
  TVendedor = class(TPessoa)
  private
    FComissao: Currency;
    procedure SetComissao(const Value: Currency);
  published
    property Comissao : Currency read FComissao write SetComissao;
    function calculaSalario : Currency; override;
  end;

implementation

{ TVendendor }

function TVendedor.calculaSalario: Currency;
begin
  Result := Salario + Comissao;
end;

procedure TVendedor.SetComissao(const Value: Currency);
begin
  FComissao := Value;
end;

end.
