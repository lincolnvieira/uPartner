using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.ModeloDAO
{
    public class EventoFocoDAO : DAO<EventoFoco, string>
    {
        public override void Alterar(EventoFoco item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = "DELETE FROM EventoFoco WHERE " + chave;
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

        public override void Inserir(EventoFoco item)
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

        public override IEnumerable<EventoFoco> Listar(string chave = null)
        {
            throw new NotImplementedException();
        }

        public override EventoFoco Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
