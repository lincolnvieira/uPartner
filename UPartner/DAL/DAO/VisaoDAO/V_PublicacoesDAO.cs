using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.VisaoDAO
{
    public class V_PublicacoesDAO : DAO<V_Publicacoes, string>
    {
        public override void Alterar(V_Publicacoes item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(V_Publicacoes item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<V_Publicacoes> Listar(string chave = null)
        {
            try
            {
                List<V_Publicacoes> ListaPublicacoes = new List<V_Publicacoes>();
                AbrirConexao();
                cmd.CommandText = "SELECT * FROM v_publicacoes WHERE " + chave + " ORDER BY Data_Publicacao DESC" ;
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    V_Publicacoes publicacoes = new V_Publicacoes();
                    publicacoes.Usuario_ID = (int)reader["Usuario_ID"];
                    publicacoes.Nome = (string)reader["Nome"];
                    publicacoes.Sobrenome = (string)reader["Sobrenome"];
                    if (!Convert.IsDBNull(reader["Foto_Perfil"]))
                        publicacoes.Foto_Perfil = (byte[])reader["Foto_Perfil"];
                    publicacoes.MimeType_Perfil = (string)reader["Mimetype_Perfil"];
                    publicacoes.Titulo = (string)reader["Titulo"];
                    publicacoes.Publicacao_ID = (int)reader["Publicacao_ID"];
                    publicacoes.Titulo = (string)reader["Titulo"];
                    publicacoes.Descricao = (string)reader["Descricao"];
                    publicacoes.Data_Publicacao = (DateTime)reader["Data_Publicacao"];
                    if (!Convert.IsDBNull(reader["Foto_Publicacao"]))
                        publicacoes.Foto_Publicacao = (byte[])reader["Foto_Publicacao"];
                    publicacoes.MimeType_Publicacao = (string)reader["Mimetype_Publicacao"];
                    ListaPublicacoes.Add(publicacoes);
                }
                return ListaPublicacoes;
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

        public override V_Publicacoes Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
