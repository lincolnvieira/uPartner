using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.ModeloDAO
{
    public class TipoEventoDAO : DAO<TipoEvento, string>
    {
        public override void Alterar(TipoEvento item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(TipoEvento item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<TipoEvento> Listar(string chave = null)
        {
            try
            {
                List<TipoEvento> listaTipoEvento = new List<TipoEvento>();
                AbrirConexao();
                cmd.CommandText = "SELECT TipoEvento_ID, Descricao FROM TipoEvento";
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    TipoEvento tipoEvento = new TipoEvento();
                    tipoEvento.TipoEvento_ID = (int)reader["TipoEvento_ID"];
                    tipoEvento.Descricao = (string)reader["Descricao"];
                    listaTipoEvento.Add(tipoEvento);
                }
                return listaTipoEvento;

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

        public override TipoEvento Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
