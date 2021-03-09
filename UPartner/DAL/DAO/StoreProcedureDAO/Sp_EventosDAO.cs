using DTO.StoreProcedure;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.StoreProcedureDAO
{
    public class Sp_EventosDAO : DAO<Sp_Eventos, string>
    {
        public override void Alterar(Sp_Eventos item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(Sp_Eventos item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<Sp_Eventos> Listar(string chave = null)
        {
            try
            {
                AbrirConexao();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_eventos";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@CampoBusca", chave);
                reader = cmd.ExecuteReader();
                List<Sp_Eventos> listaEventos = new List<Sp_Eventos>();

                while (reader.Read())
                {
                    Sp_Eventos eventos = new Sp_Eventos();
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

        public override Sp_Eventos Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
