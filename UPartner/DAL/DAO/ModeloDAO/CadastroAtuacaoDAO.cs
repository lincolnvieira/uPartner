using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.ModeloDAO
{
    public class CadastroAtuacaoDAO : DAO<CadastroAtuacao, string>
    {
        public override void Alterar(CadastroAtuacao item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = "DELETE FROM CadastroAtuacao WHERE " + chave;
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                FecharConexao();
            };
        }

        public override void Inserir(CadastroAtuacao item)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = MontarInsert(item, "CadastroAtuacao_ID");
                cmd.Parameters.Clear();
                cmd.CommandType = CommandType.Text; //Padrão de tipo de comando
                cmd.ExecuteNonQuery(); //Executa a query
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

        public override IEnumerable<CadastroAtuacao> Listar(string chave = null)
        {
            throw new NotImplementedException();
        }

        public override CadastroAtuacao Obter(string chave)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = "SELECT * FROM CadastroAtuacao WHERE " + chave;
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                CadastroAtuacao cadastroAtuacao = new CadastroAtuacao();
                while (reader.Read())
                {
                    cadastroAtuacao.CadastroAtuacao_ID = (int)reader["CadastroAtuacao_ID"];
                    cadastroAtuacao.mUsuario = (int)reader["mUsuario"];
                    cadastroAtuacao.DataSolicitacao = (DateTime)reader["DataSolicitacao"];
                    cadastroAtuacao.Area = (string)reader["Area"];
                }
                return cadastroAtuacao;

            }
            catch (Exception ex)
            {
                throw;

            }
            finally
            {
                FecharConexao();
            }
        }
    }
}
