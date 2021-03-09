--CREATE DATABASE UPartner;
USE UPartner
GO

-- As tabelas devem ser criadas na ordem abaixo: --

CREATE TABLE TipoConta (
	TipoConta_ID int IDENTITY(1,1),
	Descricao varchar(20),

	CONSTRAINT PK_TipoConta_TipoContaID PRIMARY KEY CLUSTERED (TipoConta_ID)
);

CREATE TABLE Atuacao (
	Atuacao_ID int IDENTITY(1,1),
	Descricao varchar(30),

	CONSTRAINT PK_Atuacao_AtuacaoID PRIMARY KEY CLUSTERED (Atuacao_ID)
);

CREATE TABLE Usuario (
	Usuario_ID int IDENTITY(1,1),
	Email varchar(100) not null,
	Nome varchar(100) not null,
	Sobrenome varchar(100) not null,
	DataNascimento datetime,
	Senha varchar(MAX) not null,
	DataCadastro datetime,
	DataUltimoAcesso datetime,
	DataAlterouSenha datetime,
	FlagAlterouSenha bit,
	FlagAtivo bit,
	FlagBloqueado bit,
	FlagHabilitouEmail bit,
	Estado varchar(2),
	Cidade varchar(50),
	CEP varchar(9),
	Rua varchar(50),
    Bairro varchar(40),
	Sobre varchar(200),
	Numero int,
	Complemento varchar(50),
	FotoPerfil varbinary(MAX),
	MimeType varchar(MAX),
	mTipoConta int not null,

	CONSTRAINT PK_Usuario_Usuario_ID PRIMARY KEY CLUSTERED (Usuario_ID),
	CONSTRAINT FK_Usuario_TipoConta_TipoConta_ID FOREIGN KEY (mTipoConta) REFERENCES TipoConta(TipoConta_ID)
);

CREATE TABLE Publicacao (
	Publicacao_ID int IDENTITY(1,1),
	Descricao varchar(100),
	DataPublicacao datetime,
	FlagAtiva bit,
    mUsuario int not null,

	CONSTRAINT PK_Publicacao_PublicacaoID PRIMARY KEY CLUSTERED (Publicacao_ID)
	CONSTRAINT FK_Publicacao_Usuario_ID	FOREIGN KEY (mUsuario) REFERENCES Usuario(Usuario_ID), 
);

CREATE TABLE VideoPublicacao (
	Video varbinary(MAX),
	MimeType varchar(100),
	mPublicacao int not null,

	CONSTRAINT FK_VideoPublicacao_Publicacao_ID FOREIGN KEY (mPublicacao) REFERENCES Publicacao(Publicacao_ID) 
);

CREATE TABLE ArquivoPublicacao (
	Arquivo varbinary(MAX),
	MimeType varchar(100),
	mPublicacao int not null,

	CONSTRAINT FK_ArquivoPublicacao_Publicacao_ID FOREIGN KEY (mPublicacao) REFERENCES Publicacao(Publicacao_ID)
);

CREATE TABLE FotoPublicacao (
	Foto varbinary(MAX),
	MimeType varchar(MAX),
	mPublicacao int not null,

	CONSTRAINT FK_FotoPublicacao_Publicacao_ID FOREIGN KEY (mPublicacao) REFERENCES Publicacao(Publicacao_ID)
);

CREATE TABLE TipoDenuncia (
	TipoDenuncia_ID int IDENTITY(1,1),
	Descricao varchar(50)

	CONSTRAINT PK_TipoDenuncia_TipoDenuncia_ID PRIMARY KEY CLUSTERED (TipoDenuncia_ID),
);

CREATE TABLE Denuncia (
	Denuncia_ID int IDENTITY(1,1),
	DataDenuncia datetime,
	mPublicacao int not null,
	mUsuario int not null,
	mTipoDenuncia int not null,

	CONSTRAINT PK_Denuncia_Denuncia_ID PRIMARY KEY CLUSTERED (Denuncia_ID),
	CONSTRAINT FK_Denuncia_Publicacao_ID FOREIGN KEY (mPublicacao) REFERENCES Publicacao(Publicacao_ID),
    CONSTRAINT FK_Denuncia_Usuario_ID FOREIGN KEY (mUsuario) REFERENCES Usuario(Usuario_ID),
	CONSTRAINT FK_Denuncia_TipoDenuncia_ID FOREIGN KEY (mTipoDenuncia) REFERENCES TipoDenuncia(TipoDenuncia_ID)
);

CREATE TABLE TipoEvento (
	TipoEvento_ID int IDENTITY(1,1),
	Descricao varchar(50),

	CONSTRAINT PK_TipoEvento_TipoEvento_ID PRIMARY KEY CLUSTERED (TipoEvento_ID),
);

CREATE TABLE StatusEvento (
	StatusEvento_ID int IDENTITY(1,1),
	Descricao varchar(20),

	CONSTRAINT PK_StatusEvento_StatusEvento_ID PRIMARY KEY CLUSTERED (StatusEvento_ID),
);

CREATE TABLE Evento (
	Evento_ID int IDENTITY(1,1),
	Titulo varchar(100),
	Descricao varchar(200),
	DataEvento datetime,
	mStatusEvento int not null,
	mUsuario int not null,
	mTipoEvento int not null,
	DataCriacao datetime not null,
	CEP varchar(10),
    Rua varchar(50),
    Bairro varchar(40),
    Cidade varchar(40),
    Estado varchar(2),
	Numero int,
	Complemento varchar(50),

	CONSTRAINT PK_Evento_Evento_ID PRIMARY KEY CLUSTERED (Evento_ID),
	CONSTRAINT FK_Evento_StatusEvento_ID FOREIGN KEY (mStatusEvento) REFERENCES StatusEvento(StatusEvento_ID),
	CONSTRAINT FK_Evento_Usuario_ID FOREIGN KEY (mUsuario) REFERENCES Usuario(Usuario_ID),
	CONSTRAINT FK_Evento_TipoEvento_ID FOREIGN KEY (mTipoEvento) REFERENCES TipoEvento(TipoEvento_ID)
);

CREATE TABLE FotoEvento (
	Foto varbinary(MAX),
	MimeType varchar(MAX),
	mEvento int not null,

	CONSTRAINT FK_FotoEvento_Evento_ID FOREIGN KEY (mEvento) REFERENCES Evento(Evento_ID)
);

CREATE TABLE Participante (
	mEvento int not null,
	mUsuario int not null, 
	DataParticipacao datetime,

	CONSTRAINT FK_Participante_Evento_ID FOREIGN KEY (mEvento) REFERENCES Evento(Evento_ID),
	CONSTRAINT FK_Participante_Usuario_ID FOREIGN KEY (mUsuario) REFERENCES Usuario(Usuario_ID)
);

CREATE TABLE UsuarioAtuacao(
	mUsuario int,
	mAtuacao int

	CONSTRAINT PK_UsuarioAtuacao_mUsuario_mAtuacao PRIMARY KEY CLUSTERED (mUsuario,mAtuacao),
	CONSTRAINT FK_UsuarioAtuacao_TipoConta_TipoConta_ID FOREIGN KEY (mUsuario) REFERENCES Usuario(Usuario_ID),
	CONSTRAINT FK_UsuarioAtuacao_Atuacao FOREIGN KEY (mAtuacao) REFERENCES Atuacao(Atuacao_ID)
);

CREATE TABLE PublicacaoFoco(
	mPublicacao int,
	Foco int

	CONSTRAINT PK_PublicacaoFoco_mUsuario_Foco PRIMARY KEY CLUSTERED (mPublicacao,Foco),
	CONSTRAINT FK_PublicacaoFoco_mUsuario_Usuario_ID FOREIGN KEY (mPublicacao) REFERENCES Publicacao(Publicacao_ID),
	CONSTRAINT FK_PublicacaoFoco_Foco_Atuacao_ID FOREIGN KEY (Foco) REFERENCES Atuacao(Atuacao_ID)
);

CREATE TABLE EventoFoco(
	mEvento int,
	Foco int

	CONSTRAINT PK_EventoFoco_mEvento_Foco PRIMARY KEY CLUSTERED (mEvento,Foco),
	CONSTRAINT FK_EventoFoco_mEvento_Evento_ID FOREIGN KEY (mEvento) REFERENCES Evento(Evento_ID),
	CONSTRAINT FK_EventoFoco_Foco_Atuacao_ID FOREIGN KEY (Foco) REFERENCES Atuacao(Atuacao_ID)
);





