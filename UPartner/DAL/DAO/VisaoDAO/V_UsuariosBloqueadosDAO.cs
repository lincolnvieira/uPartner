using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.VisaoDAO
{
    public class V_UsuariosBloqueadosDAO : DAO<V_UsuariosBloqueados, string>
    {
        public override void Alterar(V_UsuariosBloqueados item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(V_UsuariosBloqueados item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<V_UsuariosBloqueados> Listar(string chave = null)
        {
            try
            {
                List<V_UsuariosBloqueados> lsUsuarioBloqueados = new List<V_UsuariosBloqueados>();
                AbrirConexao();
                cmd.CommandText = "SELECT * FROM v_usuariosBloqueados ORDER BY Data_Bloqueio DESC";
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    V_UsuariosBloqueados v_usuariosBloqueados = new V_UsuariosBloqueados();
                    v_usuariosBloqueados.Usuario_ID = (int)reader["Usuario_ID"];
                    v_usuariosBloqueados.Nome = (string)reader["Nome"];
                    v_usuariosBloqueados.Sobrenome = (string)reader["Sobrenome"];
                    v_usuariosBloqueados.Motivo_Bloqueio = (string)reader["Motivo_Bloqueio"];
                    v_usuariosBloqueados.Publicacao_ID = (int)reader["Publicacao_ID"];
                    v_usuariosBloqueados.Data_Cadastro = (DateTime)reader["Data_Cadastro"];
                    lsUsuarioBloqueados.Add(v_usuariosBloqueados);
                }
                return lsUsuarioBloqueados;
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

        public override V_UsuariosBloqueados Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
