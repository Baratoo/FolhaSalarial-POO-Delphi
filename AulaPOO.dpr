program AulaPOO;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {F_Principal},
  Classe.Administrativo in 'Classe.Administrativo.pas',
  Classe.Vendedor in 'Classe.Vendedor.pas',
  Classe.Pessoa in 'Classe.Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.Run;
end.
