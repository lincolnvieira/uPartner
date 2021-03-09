using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.ModeloDAO
{
    public class PublicacaoFocoDAO : DAO<PublicacaoFoco, string>
    {
        public override void Alterar(PublicacaoFoco item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(PublicacaoFoco item)
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

        public override IEnumerable<PublicacaoFoco> Listar(string chave = null)
        {
            throw new NotImplementedException();
        }

        public override PublicacaoFoco Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
