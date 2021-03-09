using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO
{
    public class EventoDAO : DAO<Evento, string>
    {
        public override void Alterar(Evento item, string chave)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = MontarUpdate(item, "Evento_ID", chave);
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

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(Evento item)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = MontarInsert(item, "Evento_ID");
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

        public override IEnumerable<Evento> Listar(string chave = null)
        {
            throw new NotImplementedException();
        }

        public override Evento Obter(string chave)
        {
            try
            {
                Evento evento = new Evento();
                AbrirConexao();
                cmd.CommandText = MontarSelect(evento,chave);
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    evento.Evento_ID = (int)reader["Evento_ID"];
                    evento.Descricao = (string)reader["Descricao"];
                    evento.DataEvento = (DateTime)reader["DataEvento"];
                    evento.DataCriacao = (DateTime)reader["DataCriacao"];
                    evento.mStatusEvento = (int)reader["mStatusEvento"];
                    evento.mUsuario = (int)reader["mUsuario"];
                    evento.mTipoEvento = (int)reader["mTipoEvento"];                
                    evento.Titulo = (string)reader["Titulo"];
                    evento.CEP = (string)reader["CEP"];
                    evento.Rua = (string)reader["Rua"]; 
                    evento.Bairro = (string)reader["Bairro"];
                    evento.Cidade = (string)reader["Cidade"];
                    evento.Estado = (string)reader["Estado"];
                    evento.Numero = (int)reader["Numero"];
                }
                return evento;
                
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


        public int UltimoID(int id)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = "SELECT Evento_ID FROM Evento WHERE mUsuario = " + id + "ORDER BY DataCriacao DESC";
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                reader.Read();
                return (int)reader["Evento_ID"];
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
