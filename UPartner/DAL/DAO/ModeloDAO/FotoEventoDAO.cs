using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO
{
    public class FotoEventoDAO : DAO<FotoEvento, string>
    {
        public override void Alterar(FotoEvento item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(FotoEvento item)
        {
            try
            {
                AbrirConexao();
                //cmd.CommandText = MontarInsert(item);
                cmd.CommandText = "INSERT INTO FotoEvento VALUES (@Foto, @MimeType, @mEvento )";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@Foto", SqlDbType.VarBinary).Value = item.Foto;
                cmd.Parameters.AddWithValue("@MimeType", item.MimeType);
                cmd.Parameters.AddWithValue("@mEvento", item.mEvento);
                cmd.CommandType = CommandType.Text;
                //Begin();
                cmd.ExecuteNonQuery();
                //Commit();
            }
            catch (Exception)
            {
                //Rollback();
                throw;
            }
            finally
            {
                FecharConexao();
            }
        }

        public override IEnumerable<FotoEvento> Listar(string chave = null)
        {
            throw new NotImplementedException();
        }

        public override FotoEvento Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
