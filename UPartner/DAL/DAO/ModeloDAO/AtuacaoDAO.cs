using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO
{
    public class AtuacaoDAO : DAO<Atuacao, string>
    {
        public override void Alterar(Atuacao item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(Atuacao item)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = MontarInsert(item, "Atuacao_ID");
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

        public override IEnumerable<Atuacao> Listar(string chave = null)
        {
            try
            {
                AbrirConexao();
                
                List<Atuacao> lsAtuacao = new List<Atuacao>();
                cmd.CommandText = "SELECT * FROM Atuacao";
                cmd.CommandType = CommandType.Text;             
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Atuacao atuacao = new Atuacao();
                    atuacao.Atuacao_ID = (int)reader["Atuacao_ID"];
                    atuacao.Descricao = (string)reader["Descricao"];
                    lsAtuacao.Add(atuacao);
                }

                return lsAtuacao;
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

        public override Atuacao Obter(string chave)
        {
            try
            {
                AbrirConexao();
                Atuacao atuacao = new Atuacao();
                cmd.CommandText = MontarSelect(atuacao, chave);
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    atuacao.Atuacao_ID = (int)reader["Atuacao_ID"];
                    atuacao.Descricao = (string)reader["Descricao"];
                }

                return atuacao;
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

        public int UltimoID()
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = "SELECT MAX(Atuacao_ID) AS Atuacao_ID FROM Atuacao";
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                reader.Read();
                return (int)reader["Atuacao_ID"];
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
