object F_Principal: TF_Principal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 246
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 39
    Height = 13
    Caption = 'Fun'#231#227'o:'
  end
  object Label2: TLabel
    Left = 8
    Top = 67
    Width = 59
    Height = 13
    Caption = 'Funcion'#225'rio:'
  end
  object Label3: TLabel
    Left = 239
    Top = 67
    Width = 36
    Height = 13
    Caption = 'Sal'#225'rio:'
  end
  object Label4: TLabel
    Left = 410
    Top = 67
    Width = 33
    Height = 13
    Caption = 'Bonus:'
  end
  object edtNome: TEdit
    Left = 64
    Top = 64
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object edtSalario: TEdit
    Left = 280
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtBonus: TEdit
    Left = 451
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnCadastrar: TButton
    Left = 8
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 3
    OnClick = btnCadastrarClick
  end
  object btnSalario: TButton
    Left = 104
    Top = 112
    Width = 113
    Height = 25
    Caption = 'Calcular Sal'#225'rio'
    TabOrder = 4
    OnClick = btnSalarioClick
  end
  object btnAnt: TButton
    Left = 410
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Anterior'
    TabOrder = 5
    OnClick = btnAntClick
  end
  object btnProx: TButton
    Left = 497
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Pr'#243'ximo'
    TabOrder = 6
    OnClick = btnProxClick
  end
  object mm: TMemo
    Left = 8
    Top = 149
    Width = 564
    Height = 89
    Lines.Strings = (
      'mm')
    TabOrder = 7
  end
  object cbFuncao: TComboBox
    Left = 64
    Top = 21
    Width = 337
    Height = 21
    TabOrder = 8
    Text = 'Administrativo'
    Items.Strings = (
      'Administrativo'
      'Vendedor'
      'Funcionario')
  end
end
