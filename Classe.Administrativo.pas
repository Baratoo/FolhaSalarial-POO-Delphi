unit Classe.Administrativo;

interface

uses
  Classe.Pessoa;

type
  TAdministrativo = class(TPessoa)
  private
    FBonus: Currency;
    procedure SetBonus(const Value: Currency);
  published
    property Bonus : Currency read FBonus write SetBonus;
    function calculaSalario : Currency; override;
  end;

implementation

{ TAdministrativo }

function TAdministrativo.calculaSalario: Currency;
begin
  Result := Salario + Bonus;
end;

procedure TAdministrativo.SetBonus(const Value: Currency);
begin
  FBonus := Value;
end;

end.
