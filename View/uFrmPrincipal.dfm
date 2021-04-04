object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste InforSistemas - Cadastro de Cliente'
  ClientHeight = 305
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 651
    Height = 299
    Caption = 'Dados do Cliente'
    TabOrder = 0
    object lblNome: TLabel
      Left = 16
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object lblIdentidade: TLabel
      Left = 16
      Top = 72
      Width = 52
      Height = 13
      Caption = 'Identidade'
    end
    object lblCPF: TLabel
      Left = 136
      Top = 72
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object lblTelefone: TLabel
      Left = 261
      Top = 72
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object lblEmail: TLabel
      Left = 390
      Top = 72
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object lblEndereco: TLabel
      Left = 16
      Top = 128
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Bevel1: TBevel
      Left = 67
      Top = 136
      Width = 558
      Height = 1
    end
    object lblCEP: TLabel
      Left = 16
      Top = 152
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object lblLogradouro: TLabel
      Left = 184
      Top = 152
      Width = 55
      Height = 13
      Caption = 'Logradouro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblBairro: TLabel
      Left = 335
      Top = 152
      Width = 28
      Height = 13
      Caption = 'Bairro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCidade: TLabel
      Left = 462
      Top = 152
      Width = 33
      Height = 13
      Caption = 'Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblEstado: TLabel
      Left = 16
      Top = 208
      Width = 33
      Height = 13
      Caption = 'Estado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPais: TLabel
      Left = 136
      Top = 208
      Width = 19
      Height = 13
      Caption = 'Pa'#237's'
    end
    object lblNumero: TLabel
      Left = 261
      Top = 208
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object lblComplemento: TLabel
      Left = 344
      Top = 208
      Width = 65
      Height = 13
      Caption = 'Complemento'
    end
    object spbBuscarCEP: TSpeedButton
      Left = 95
      Top = 171
      Width = 74
      Height = 22
      Caption = 'Buscar CEP'
      OnClick = spbBuscarCEPClick
    end
    object edtNome: TEdit
      Left = 16
      Top = 42
      Width = 609
      Height = 21
      TabOrder = 0
    end
    object edtIdentidade: TEdit
      Left = 16
      Top = 91
      Width = 100
      Height = 21
      TabOrder = 1
    end
    object edtCPF: TEdit
      Left = 136
      Top = 91
      Width = 100
      Height = 21
      TabOrder = 2
    end
    object edtTelefone: TEdit
      Left = 261
      Top = 91
      Width = 100
      Height = 21
      TabOrder = 3
    end
    object edtEmail: TEdit
      Left = 390
      Top = 91
      Width = 235
      Height = 21
      TabOrder = 4
    end
    object edtCEP: TEdit
      Left = 16
      Top = 171
      Width = 73
      Height = 21
      TabOrder = 5
      Text = '41250500'
    end
    object edtLogradouro: TEdit
      Left = 184
      Top = 171
      Width = 135
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object edtBairro: TEdit
      Left = 335
      Top = 171
      Width = 114
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object edtCidade: TEdit
      Left = 462
      Top = 171
      Width = 163
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object edtEstado: TEdit
      Left = 16
      Top = 227
      Width = 100
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object edtPais: TEdit
      Left = 136
      Top = 227
      Width = 100
      Height = 21
      TabOrder = 10
    end
    object edtNumero: TEdit
      Left = 261
      Top = 227
      Width = 57
      Height = 21
      TabOrder = 11
    end
    object edtComplemento: TEdit
      Left = 344
      Top = 227
      Width = 281
      Height = 21
      TabOrder = 12
    end
    object chkEnviarEmail: TCheckBox
      Left = 408
      Top = 262
      Width = 129
      Height = 17
      Caption = 'Enviar Email ao Gravar'
      Checked = True
      State = cbChecked
      TabOrder = 13
    end
    object btnGravar: TButton
      Left = 550
      Top = 259
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 14
      OnClick = btnGravarClick
    end
  end
end
