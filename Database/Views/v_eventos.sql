CREATE VIEW v_eventos AS
/*  
 Autor: Lincoln Vieira  
 Descrição: View utilizada para retornar todos os eventos
*/  
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
INNER JOIN Usuario us      ON ev.mUsuario = us.Usuario_ID
INNER JOIN StatusEvento se ON ev.mStatusEvento = se.StatusEvento_ID 
INNER JOIN TipoEvento te   ON ev.mTipoEvento = te.TipoEvento_ID
LEFT JOIN Participante ptc ON ev.Evento_ID = ptc.mEvento