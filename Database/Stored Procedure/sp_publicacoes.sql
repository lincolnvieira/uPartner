CREATE PROCEDURE sp_publicacoes 
	@CampoBusca int
AS
SELECT  
 us.Usuario_ID         AS Usuario_ID,     
 us.Nome               AS Nome,  
 us.Sobrenome          AS Sobrenome,
 tc.Descricao          AS TipoConta,  
 us.FotoPerfil         AS Foto_Perfil,  
 us.MimeType           AS MimeType_Perfil,  
 pb.Publicacao_ID      AS Publicacao_ID,
 pb.Titulo             AS Titulo,       
 pb.Descricao          AS Descricao,       
 pb.DataPublicacao     AS Data_Publicacao, 
 fp.Foto               AS Foto_Publicacao,   
 fp.MimeType           AS MimeType_Publicacao  
FROM     
 Publicacao pb    
 INNER JOIN Usuario us        ON pb.mUsuario = us.Usuario_ID  
 INNER JOIN TipoConta tc      ON us.mTipoConta = tc.TipoConta_ID
 INNER JOIN FotoPublicacao fp ON pb.Publicacao_ID = fp.mPublicacao  
 INNER JOIN PublicacaoFoco pf ON pb.Publicacao_ID = pf.mPublicacao

 WHERE
	pf.Foco IN (SELECT mAtuacao FROM UsuarioAtuacao WHERE mUsuario = @CampoBusca)

GROUP BY
	us.Usuario_ID,     
	us.Nome,  
	us.Sobrenome,
	tc.Descricao,  
	us.FotoPerfil,  
	us.MimeType,  
	pb.Publicacao_ID,
	pb.Titulo,  
	pb.Descricao,       
	pb.DataPublicacao,
	fp.Foto,  
	fp.MimeType  

ORDER BY 
	pb.DataPublicacao
DESC