using DTO.Modelos;
using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.VisaoDAO
{
    public class V_AtuacoesUsuarioDAO : DAO<V_AtuacoesUsuario, string>
    {
        public override void Alterar(V_AtuacoesUsuario item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(V_AtuacoesUsuario item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<V_AtuacoesUsuario> Listar(string chave = null)
        {
            try
            {
                List<V_AtuacoesUsuario> lsAtuacoes = new List<V_AtuacoesUsuario>();
                AbrirConexao();
                cmd.CommandText = "SELECT * FROM v_atuacoesUsuario WHERE " + chave;
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    V_AtuacoesUsuario v_atuacoesUsuario = new V_AtuacoesUsuario();
                    v_atuacoesUsuario.Usuario_ID = (int)reader["Usuario_ID"];
                    v_atuacoesUsuario.Atuacao_ID = (int)reader["Atuacao_ID"];
                    v_atuacoesUsuario.Descricao = (string)reader["Descricao"];

                    lsAtuacoes.Add(v_atuacoesUsuario);
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

        public override V_AtuacoesUsuario Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
