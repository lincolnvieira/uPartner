using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.VisaoDAO
{
    public class V_CadastroAtuacaoDAO : DAO<V_CadastroAtuacao, string>
    {
        public override void Alterar(V_CadastroAtuacao item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(V_CadastroAtuacao item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<V_CadastroAtuacao> Listar(string chave = null)
        {
            try
            {
                List<V_CadastroAtuacao> lsCadastroAtuacao = new List<V_CadastroAtuacao>();
                AbrirConexao();
                cmd.CommandText = "SELECT * FROM v_cadastroAtuacao ORDER BY DataSolicitacao DESC";
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    V_CadastroAtuacao v_cadastroAtuacao = new V_CadastroAtuacao();
                    v_cadastroAtuacao.CadastroAtuacao_ID = (int)reader["CadastroAtuacao_ID"];
                    v_cadastroAtuacao.Usuario_ID = (int)reader["Usuario_ID"];
                    v_cadastroAtuacao.Nome = (string)reader["Nome"];
                    v_cadastroAtuacao.Sobrenome = (string)reader["Sobrenome"];
                    v_cadastroAtuacao.Area = (string)reader["Area"];
                    v_cadastroAtuacao.DataSolicitacao = (DateTime)reader["DataSolicitacao"];
                    lsCadastroAtuacao.Add(v_cadastroAtuacao);
                }
                return lsCadastroAtuacao;
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

        public override V_CadastroAtuacao Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
