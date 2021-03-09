using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.ModeloDAO
{
    public class TipoDenunciaDAO : DAO<TipoDenuncia, string>
    {
        public override void Alterar(TipoDenuncia item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(TipoDenuncia item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<TipoDenuncia> Listar(string chave = null)
        {
            try
            {
                List<TipoDenuncia> listaTipoDenuncia = new List<TipoDenuncia>();
                AbrirConexao();
                cmd.CommandText = "SELECT TipoDenuncia_ID, Descricao FROM TipoDenuncia";
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    TipoDenuncia tipoDenuncia = new TipoDenuncia();
                    tipoDenuncia.TipoDenuncia_ID = (int)reader["TipoDenuncia_ID"];
                    tipoDenuncia.Descricao = (string)reader["Descricao"];
                    listaTipoDenuncia.Add(tipoDenuncia);
                }
                return listaTipoDenuncia;

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

        public override TipoDenuncia Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
