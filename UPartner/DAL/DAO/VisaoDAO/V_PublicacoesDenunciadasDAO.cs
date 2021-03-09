using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.VisaoDAO
{
    public class V_PublicacoesDenunciadasDAO : DAO<V_PublicacoesDenunciadas, string>
    {
        public override void Alterar(V_PublicacoesDenunciadas item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(V_PublicacoesDenunciadas item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<V_PublicacoesDenunciadas> Listar(string chave = null)
        {
            try
            {
                List<V_PublicacoesDenunciadas> lsPublicacoesDenunciadas = new List<V_PublicacoesDenunciadas>();
                AbrirConexao();
                cmd.CommandText = "SELECT * FROM v_publicacoesDenunciadas ORDER BY Data_Publicacao DESC";
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    V_PublicacoesDenunciadas publicacoesDenunciadas = new V_PublicacoesDenunciadas();
                    publicacoesDenunciadas.Publicacao_ID = (int)reader["Publicacao_ID"];
                    publicacoesDenunciadas.Titulo = (string)reader["Titulo"];
                    publicacoesDenunciadas.Descricao = (string)reader["Descricao"];
                    publicacoesDenunciadas.Quantidade_Denuncia = (int)reader["Quantidade_Denuncia"];
                    publicacoesDenunciadas.Usuario_ID = (int)reader["Usuario_ID"];
                    publicacoesDenunciadas.Nome = (string)reader["Nome"];
                    publicacoesDenunciadas.Sobrenome = (string)reader["Sobrenome"];
                    publicacoesDenunciadas.Data_Publicacao = (DateTime)reader["Data_Publicacao"];                    
                    if (!Convert.IsDBNull(reader["Foto_Publicacao"]))
                        publicacoesDenunciadas.Foto_Publicacao = (byte[])reader["Foto_Publicacao"];
                    publicacoesDenunciadas.MimeType = (string)reader["MimeType"];
                    lsPublicacoesDenunciadas.Add(publicacoesDenunciadas);
                }
                return lsPublicacoesDenunciadas;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                FecharConexao();
            }
        }

        public override V_PublicacoesDenunciadas Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
