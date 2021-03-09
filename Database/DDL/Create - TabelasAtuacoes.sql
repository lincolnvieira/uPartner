
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