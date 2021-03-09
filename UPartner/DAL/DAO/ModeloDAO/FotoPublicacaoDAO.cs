using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO
{
    public class FotoPublicacaoDAO : DAO<FotoPublicacao, string>
    {
        public override void Alterar(FotoPublicacao item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(FotoPublicacao item)
        {
            try
            {
                AbrirConexao();
                //cmd.CommandText = MontarInsert(item);
                cmd.CommandText = "INSERT INTO FotoPublicacao VALUES (@Foto, @MimeType, @mPublicacao )";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@Foto", SqlDbType.VarBinary).Value = item.Foto;
                cmd.Parameters.AddWithValue("@MimeType", item.MimeType);
                cmd.Parameters.AddWithValue("@mPublicacao", item.mPublicacao);
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

        public override IEnumerable<FotoPublicacao> Listar(string chave = null)
        {
            throw new NotImplementedException();
        }

        public override FotoPublicacao Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
