using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DAO.VisaoDAO
{
    public class V_UsuarioDenunciadosDAO : DAO<V_UsuarioDenunciados, string>
    {
        public override void Alterar(V_UsuarioDenunciados item, string chave)
        {
            throw new NotImplementedException();
        }

        public override void Deletar(string chave)
        {
            throw new NotImplementedException();
        }

        public override void Inserir(V_UsuarioDenunciados item)
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<V_UsuarioDenunciados> Listar(string chave = null)
        {
            throw new NotImplementedException();
        }

        public override V_UsuarioDenunciados Obter(string chave)
        {
            throw new NotImplementedException();
        }
    }
}
