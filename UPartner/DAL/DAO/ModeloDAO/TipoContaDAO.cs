using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO
{
    public class TipoContaDAO : DAO<TipoConta, string>
    {
        public override void Alterar(TipoConta item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(TipoConta item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<TipoConta> Listar(string chave = null)
        {
            throw new NotImplementedException();
        }

        public override TipoConta Obter(string chave)
        {
            try
            {
                AbrirConexao();
                TipoConta tipoConta = new TipoConta();
                cmd.CommandText = MontarSelect(tipoConta, chave);
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    tipoConta.TipoConta_ID = (int)reader["TipoConta_ID"];
                    tipoConta.Descricao = (string)reader["Descricao"];
                }

                return tipoConta;
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
