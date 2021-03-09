using DTO.StoreProcedure;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.StoreProcedureDAO
{
    public class Sp_PublicacoesDAO : DAO<Sp_Publicacoes, string>
    {
        public override void Alterar(Sp_Publicacoes item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(Sp_Publicacoes item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<Sp_Publicacoes> Listar(string chave = null)
        {
            try
            {
                AbrirConexao();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_publicacoes";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@CampoBusca", chave);
                reader = cmd.ExecuteReader();
                List<Sp_Publicacoes> lsPublicacoes = new List<Sp_Publicacoes>();
                while (reader.Read())
                {
                    Sp_Publicacoes publicacoes = new Sp_Publicacoes();
                    publicacoes.Usuario_ID = (int)reader["Usuario_ID"];
                    publicacoes.Nome = (string)reader["Nome"];
                    publicacoes.Sobrenome = (string)reader["Sobrenome"];
                    publicacoes.TipoConta = (string)reader["TipoConta"];
                    if (!Convert.IsDBNull(reader["Foto_Perfil"]))
                        publicacoes.Foto_Perfil = (byte[])reader["Foto_Perfil"];
                    publicacoes.MimeType_Perfil = (string)reader["Mimetype_Perfil"];
                    publicacoes.Publicacao_ID = (int)reader["Publicacao_ID"];
                    publicacoes.Titulo = (string)reader["Titulo"];
                    publicacoes.Descricao = (string)reader["Descricao"];
                    publicacoes.Data_Publicacao = (DateTime)reader["Data_Publicacao"];
                    if (!Convert.IsDBNull(reader["Foto_Publicacao"]))
                        publicacoes.Foto_Publicacao = (byte[])reader["Foto_Publicacao"];
                    publicacoes.MimeType_Publicacao = (string)reader["Mimetype_Publicacao"];
                    lsPublicacoes.Add(publicacoes);
                }
                return lsPublicacoes;
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

        public override Sp_Publicacoes Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
