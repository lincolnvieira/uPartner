using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilitarios.Enum;

namespace DAL.DAO
{
    public class MensagemDAO : DAO<MensagemEstruturada, int>
    {
        public override void Alterar(MensagemEstruturada item, int chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(int chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(MensagemEstruturada item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<MensagemEstruturada> Listar(int chave = 0)
        {
            throw new NotImplementedException();
        }

        public override MensagemEstruturada Obter(int chave)
        {
            try
            {
                AbrirConexao();
                MensagemEstruturada mensagem = new MensagemEstruturada();
                cmd.CommandText = MontarSelect(mensagem);
                cmd.CommandType = CommandType.Text;
                reader = cmd.ExecuteReader();
                return mensagem;
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
    }
}
