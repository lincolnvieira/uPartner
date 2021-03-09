using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.VisaoDAO
{
    public class V_PublicacoesFocoDAO : DAO<V_PublicacoesFoco, string>
    {
        public override void Alterar(V_PublicacoesFoco item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(V_PublicacoesFoco item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<V_PublicacoesFoco> Listar(string chave = null)
        {
            try
            {
                List<V_PublicacoesFoco> lsAtuacoes = new List<V_PublicacoesFoco>();
                AbrirConexao();
                cmd.CommandText = "SELECT * FROM v_PublicacoesFoco WHERE " + chave;
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    V_PublicacoesFoco v_publicacoesFoco = new V_PublicacoesFoco();
                    v_publicacoesFoco.Publicacao_ID = (int)reader["Publicacao_ID"];
                    v_publicacoesFoco.Foco = (int)reader["Foco"];
                    v_publicacoesFoco.Descricao = (string)reader["Descricao"];

                    lsAtuacoes.Add(v_publicacoesFoco);
                }
                return lsAtuacoes;
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

        public override V_PublicacoesFoco Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
