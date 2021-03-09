using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO
{
    public class PublicacaoDAO : DAO<Publicacao, string>
    {
        public override void Alterar(Publicacao item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(Publicacao item)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = MontarInsert(item, "Publicacao_ID");
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

        public override IEnumerable<Publicacao> Listar(string chave = null)
        {
            throw new NotImplementedException();
        }

        public override Publicacao Obter(string chave)
        {
            throw new NotImplementedException();
        }

        public int UltimoID(int id)
        {
            try
            {
                AbrirConexao();
                cmd.CommandText = "SELECT Publicacao_ID FROM Publicacao WHERE mUsuario = " + id + "ORDER BY DataPublicacao DESC";
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                reader.Read();
                return (int)reader["Publicacao_ID"];
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
