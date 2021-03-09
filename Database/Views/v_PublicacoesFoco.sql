CREATE VIEW v_PublicacoesFoco AS  
/*  
 Autor: Lincoln Vieira      
 Descrição: View utilizada para retornar todas os focos de cada atuação     
*/  
SELECT   
	pb.Publicacao_ID   AS Publicacao_ID,  
	atc.Atuacao_ID     AS Foco,  
	atc.Descricao      AS Descricao  
FROM  
	PublicacaoFoco pf  
INNER JOIN Publicacao pb  ON pf.mPublicacao = pb.Publicacao_ID  
INNER JOIN Atuacao atc ON pf.Foco = atc.Atuacao_ID