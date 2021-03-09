CREATE VIEW v_EventosFoco AS  
/*  
 Autor: Lincoln Vieira      
 Descrição: View utilizada para retornar todas os focos de cada atuação     
*/  
SELECT   
	ev.Evento_ID       AS Evento_ID,  
	atc.Atuacao_ID     AS Foco,  
	atc.Descricao      AS Descricao  
FROM  
	EventoFoco ef  
INNER JOIN Evento ev  ON ef.mEvento = ev.Evento_ID  
INNER JOIN Atuacao atc ON ef.Foco = atc.Atuacao_ID