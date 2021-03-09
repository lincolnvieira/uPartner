CREATE PROCEDURE sp_eventos 
	@CampoBusca int
AS
SELECT  
	ev.Evento_ID          AS Evento_ID,     
	ev.Titulo             AS Titulo,  
	ev.Descricao          AS Descricao,  
	te.Descricao          AS TipoEvento,  
	se.Descricao          AS StatusEvento,  
	ev.DataEvento         AS DataEvento,  
	ev.DataCriacao        AS DataCriacao,  
	ev.Bairro             AS Bairro,  
	ev.CEP                AS CEP,  
	ev.Cidade             AS Cidade,  
	ev.Rua                AS Rua,  
	ev.Estado             AS Estado,    
	ev.Numero             AS Numero,  
	us.Usuario_ID         AS Usuario_ID,  
	us.Nome               AS Nome,   
	us.Sobrenome          AS Sobrenome    
FROM     
	Evento ev    
	INNER JOIN Usuario us        ON ev.mUsuario = us.Usuario_ID  
	INNER JOIN StatusEvento se   ON ev.mStatusEvento = se.StatusEvento_ID   
	INNER JOIN TipoEvento te     ON ev.mTipoEvento = te.TipoEvento_ID  
	LEFT JOIN Participante ptc   ON ev.Evento_ID = ptc.mEvento
	INNER JOIN EventoFoco ef     ON ev.Evento_ID = ef.mEvento

WHERE 
	ef.Foco IN (SELECT mAtuacao FROM UsuarioAtuacao WHERE mUsuario = @CampoBusca)
AND (ptc.mUsuario <> @CampoBusca OR ptc.mUsuario IS NULL)

GROUP BY
	ev.Evento_ID,            
	ev.Titulo,                   
	ev.Descricao,         
	te.Descricao,         
	se.Descricao ,                
	ev.DataEvento,           
	ev.DataCriacao,          
	ev.Bairro,               
	ev.CEP,                  
	ev.Cidade,               
	ev.Rua,                  
	ev.Estado,                  
	ev.Numero,               
	us.Usuario_ID,
	us.Nome,               
	us.Sobrenome  

ORDER BY 
	ev.DataCriacao
DESC 