using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.ModeloDAO
{
    public class DenunciaDAO : DAO<Denuncia, string>
    { 
        public override void Inserir(Denuncia denuncia)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = MontarInsert(denuncia, "Denuncia_ID");
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

        public override void Alterar(Denuncia item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<Denuncia> Listar(string chave = null)
        {
            throw new NotImplementedException();
        }

        public override Denuncia Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
