using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.ModeloDAO
{
    public class UsuarioAtuacaoDAO : DAO<UsuarioAtuacao, string>
    {
        public override void Alterar(UsuarioAtuacao item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = "DELETE FROM UsuarioAtuacao WHERE " + chave;
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
            }
        }

        public override void Inserir(UsuarioAtuacao item)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = MontarInsert(item);
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
            }
        }

        public override IEnumerable<UsuarioAtuacao> Listar(string chave = null)
        {
            try
            {
                List<UsuarioAtuacao> lsUsuarioAtuacao = new List<UsuarioAtuacao>();
                AbrirConexao();
                cmd.CommandText = "SELECT * FROM UsuarioAtuacao WHERE " + chave;
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    UsuarioAtuacao usuarioAtuacao = new UsuarioAtuacao();
                    usuarioAtuacao.mUsuario = (int)reader["mUsuario"];
                    usuarioAtuacao.mAtuacao = (int)reader["mAtuacao"];
                    lsUsuarioAtuacao.Add(usuarioAtuacao);
                }
                return lsUsuarioAtuacao;
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

        public override UsuarioAtuacao Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
