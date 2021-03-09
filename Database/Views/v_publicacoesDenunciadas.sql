CREATE VIEW v_publicacoesDenunciadas AS    
/*    
 Autor: Lincoln Vieira    
 Descrição: View utilizada para retornar os post denunciados de cada usuario    
*/    
SELECT  
 pb.mUsuario           AS Usuario_ID,     
 pb.Descricao          AS Descricao,    
 pb.DataPublicacao     AS Data_Publicacao,  
 fp.Foto               AS Foto_Publicacao,  
 fp.MimeType           AS MimeType,    
 COUNT(dn.mPublicacao) AS Quantidade_Denuncia    
FROM     
 Publicacao pb    
 INNER JOIN Denuncia dn       ON pb.Publicacao_ID = dn.mPublicacao     
 INNER JOIN TipoDenuncia tp   ON dn.mTipoDenuncia = tp.TipoDenuncia_ID    
 INNER JOIN FotoPublicacao fp ON pb.Publicacao_ID = fp.mPublicacao  
     
GROUP BY     
 pb.mUsuario,  
 pb.Descricao,    
 pb.DataPublicacao,    
 dn.mPublicacao,  
 fp.Foto,  
 fp.MimeType  
    