using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.ModeloDAO
{
    public class ParticipanteDAO : DAO<Participante, string>
    {
        public override void Alterar(Participante item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = "DELETE FROM Participante WHERE " + chave;
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

        public override void Inserir(Participante item)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = MontarInsert(item);
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

        public override IEnumerable<Participante> Listar(string chave = null)
        {
            try
            {
                Participante participante;
                List<Participante> ListaParticipacao = new List<Participante>();
                AbrirConexao();
                cmd.CommandText = MontarSelect(participante = new Participante(), chave);
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    participante = new Participante();
                    participante.mUsuario = (int)reader["mUsuario"];
                    participante.mEvento = (int)reader["mEvento"];
                    participante.DataParticipacao = (DateTime)reader["DataParticipacao"];
                    ListaParticipacao.Add(participante);
                }
                return ListaParticipacao;

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

        public override Participante Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
