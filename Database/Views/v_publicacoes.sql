CREATE VIEW v_publicacoes AS    
/*    
 Autor: Lincoln Vieira    
 Descrição: View utilizada para retornar todas as publicações   
*/    
SELECT  
 us.Usuario_ID         AS Usuario_ID,     
 us.Nome               AS Nome,  
 us.Sobrenome          AS Sobrenome,  
 us.FotoPerfil         AS Foto_Perfil,  
 us.MimeType           AS MimeType_Perfil,  
 pb.Publicacao_ID      AS Publicacao_ID,  
 pb.Descricao          AS Descricao,       
 pb.DataPublicacao     AS Data_Publicacao,  
 fp.Foto               AS Foto_Publicacao,  
 fp.MimeType           AS MimeType_Publicacao  
FROM     
 Publicacao pb    
INNER JOIN Usuario us        ON pb.mUsuario = us.Usuario_ID  
INNER JOIN FotoPublicacao fp ON pb.Publicacao_ID = fp.mPublicacao  
  