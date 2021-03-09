CREATE VIEW v_usuariosDenunciados AS  
/*  
 Autor: Lincoln Vieira  
 Descrição: View utilizada para retornar os usuários com posts denunciados e que não estejam bloqueados  
*/  
SELECT   
us.Usuario_ID         AS Usuario_ID,  
us.FotoPerfil         AS Foto,  
us.MimeType           AS MimeType,   
us.Nome               AS Nome,  
dn.mPublicacao        AS Publicacao,  
COUNT(dn.mPublicacao) AS Quantidade_Denuncia  
FROM   
 Denuncia dn  
 INNER JOIN Publicacao pb   ON dn.mPublicacao = pb.Publicacao_ID  
 INNER JOIN Usuario us      ON pb.mUsuario = us.Usuario_ID  
WHERE  
 us.FlagBloqueado <> 1  
GROUP BY   
 Usuario_ID,  
 FotoPerfil,  
 us.MimeType,   
 Nome,  
 dn.mPublicacao  
  