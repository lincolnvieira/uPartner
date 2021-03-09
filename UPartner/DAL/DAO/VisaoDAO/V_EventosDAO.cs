using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.VisaoDAO
{
    public class V_EventosDAO : DAO<V_Eventos, string>
    {
        public override void Alterar(V_Eventos item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(V_Eventos item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<V_Eventos> Listar(string chave = null)
        {
            try
            {
                List<V_Eventos> listaEventos = new List<V_Eventos>();
                AbrirConexao();
                cmd.CommandText = "SELECT * FROM v_eventos WHERE " + chave + " ORDER BY DataCriacao DESC";
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    V_Eventos eventos = new V_Eventos();
                    eventos.Evento_ID = (int)reader["Evento_ID"];
                    eventos.Titulo = (string)reader["Titulo"];
                    eventos.Descricao = (string)reader["Descricao"];
                    eventos.StatusEvento = (string)reader["StatusEvento"];
                    eventos.TipoEvento = (string)reader["TipoEvento"];
                    eventos.DataEvento = (DateTime)reader["DataEvento"];
                    eventos.DataCriacao = (DateTime)reader["DataCriacao"];
                    eventos.Rua = (string)reader["Rua"];
                    eventos.Bairro = (string)reader["Bairro"];
                    eventos.CEP = (string)reader["CEP"];
                    eventos.Cidade = (string)reader["Cidade"];
                    eventos.Estado = (string)reader["Estado"];
                    eventos.Numero = (int)reader["Numero"];
                    eventos.Usuario_ID = (int)reader["Usuario_ID"];
                    eventos.Nome = (string)reader["Nome"];
                    eventos.Sobrenome = (string)reader["sobrenome"];
                    listaEventos.Add(eventos);
                }
                return listaEventos;
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

        public override V_Eventos Obter(string chave)
        {
            throw new NotImplementedException();
        }

    }
}
