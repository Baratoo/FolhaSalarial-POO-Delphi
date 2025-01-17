unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,   Classe.Administrativo, Classe.Pessoa, Classe.Vendedor;

type
  TEnumFuncao = (tpAdministrativo, tpVendedor, tpFuncionario);

type
  TF_Principal = class(TForm)
    edtNome: TEdit;
    edtSalario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtBonus: TEdit;
    Label4: TLabel;
    btnCadastrar: TButton;
    btnSalario: TButton;
    btnAnt: TButton;
    btnProx: TButton;
    mm: TMemo;
    cbFuncao: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnAntClick(Sender: TObject);
    procedure btnProxClick(Sender: TObject);
    procedure btnSalarioClick(Sender: TObject);

  private
    { Private declarations }
    procedure IncluirAdministrativo();
    procedure IncluirVendedor();
    procedure IncluirFuncionario();
    procedure ExibirDadaos(Pos :Integer);
  public
    { Public declarations }
    Funcionario : array[0..100] of TPessoa;
    QtdFunc : Integer;
    RegAtual : Integer;
  end;

var
  F_Principal: TF_Principal;

implementation

{$R *.dfm}

procedure TF_Principal.btnAntClick(Sender: TObject);
begin
  if RegAtual <= 0 then
    Exit;

  RegAtual := RegAtual - 1;
  ExibirDadaos(RegAtual);
end;

procedure TF_Principal.btnCadastrarClick(Sender: TObject);
begin

  try
    case TEnumFuncao(cbFuncao.ItemIndex) of
      tpAdministrativo:
        begin
          IncluirAdministrativo;
        end;
      tpVendedor:
        begin
          IncluirVendedor;
        end;
      tpFuncionario:
        begin
          IncluirFuncionario;
        end;
    end;
    Inc(QtdFunc);
    ShowMessage('Cadastrado!');
  except
    raise Exception.Create('Error ');
  end;

end;

procedure TF_Principal.btnProxClick(Sender: TObject);
begin
  if RegAtual >= QtdFunc - 1 then
    Exit;

  RegAtual := RegAtual + 1;
  ExibirDadaos(RegAtual);
end;

procedure TF_Principal.btnSalarioClick(Sender: TObject);
var
  Total :Currency;
  I     :Integer;
begin

  mm.Clear;
  Total := 0;
  for I := 0 to QtdFunc -1 do
  begin
    Total := Total + Funcionario[I].calculaSalario;
  end;
  mm.Lines.Add('Sua folha salarial � de: R$' + CurrToStr(Total));
end;

procedure TF_Principal.ExibirDadaos(Pos :Integer);
begin

  edtNome.Text := Funcionario[RegAtual].Nome;
  edtSalario.Text := CurrToStr(Funcionario[RegAtual].Salario);

  if Funcionario[RegAtual].ClassName = 'TAdministrativo' then
  begin
    edtBonus.Enabled := True;
    edtBonus.Text := CurrToStr(TAdministrativo(Funcionario[RegAtual]).Bonus);
    cbFuncao.ItemIndex := Integer(tpAdministrativo);
  end;

  if Funcionario[RegAtual].ClassName = 'TVendedor' then
  begin
    edtBonus.Enabled := True;
    edtBonus.Text := CurrToStr(TVendedor(Funcionario[RegAtual]).Comissao);
    cbFuncao.ItemIndex := Integer(tpVendedor);
  end;

  if Funcionario[RegAtual].ClassName = 'TPessoa' then
  begin
    edtBonus.Enabled := false;
    edtBonus.Text := '';
    cbFuncao.ItemIndex := Integer(tpFuncionario);
  end;

end;

procedure TF_Principal.FormCreate(Sender: TObject);
begin
  cbFuncao.ItemIndex := Integer(tpAdministrativo);
  mm.Clear;
  QtdFunc := 0;
  RegAtual := 0;
end;

procedure TF_Principal.IncluirAdministrativo;
begin
  Funcionario[QtdFunc] := TAdministrativo.Create;
  TAdministrativo(Funcionario[QtdFunc]).Nome := edtNome.Text;
  TAdministrativo(Funcionario[QtdFunc]).Bonus := StrToCurr(edtBonus.Text);
  TAdministrativo(Funcionario[QtdFunc]).Salario := StrToCurr(edtSalario.Text);
end;

procedure TF_Principal.IncluirFuncionario;
begin
  Funcionario[QtdFunc] := TPessoa.Create;
  Funcionario[QtdFunc].Nome := edtNome.Text;
  Funcionario[QtdFunc].Salario := StrToCurr(edtSalario.Text);
end;

procedure TF_Principal.IncluirVendedor;
begin
  Funcionario[QtdFunc] := TVendedor.Create;
  TVendedor(Funcionario[QtdFunc]).Nome := edtNome.Text;
  TVendedor(Funcionario[QtdFunc]).Comissao := StrToCurr(edtBonus.Text);
  TVendedor(Funcionario[QtdFunc]).Salario := StrToCurr(edtSalario.Text);
end;

end.
