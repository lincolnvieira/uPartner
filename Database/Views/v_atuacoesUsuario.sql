CREATE VIEW v_atuacoesUsuario AS  
/*  
 Autor: Lincoln Vieira      
 Descrição: View utilizada para retornar todas as atuações do usuario     
*/  
SELECT   
 us.Usuario_ID    AS Usuario_ID,  
 atc.Atuacao_ID   AS Atuacao_ID,  
 atc.Descricao    AS Descricao  
FROM  
 UsuarioAtuacao ua  
INNER JOIN Usuario us  ON ua.mUsuario = us.Usuario_ID  
INNER JOIN Atuacao atc ON ua.mAtuacao = atc.Atuacao_ID  