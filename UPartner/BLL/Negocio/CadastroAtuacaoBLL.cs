using DAL;
using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Negocio
{
    public class CadastroAtuacaoBLL
    {
        public static CadastroAtuacao BuscarCadastroAtuacao(int cadastroAtuacaoID)
        {
            string sWhere = string.Format("CadastroAtuacao_ID = {0}", cadastroAtuacaoID);
            return RepositorioModelo.GetCadastroAtuacaoDAO().Obter(sWhere);
        }
        public static void DeletarCadastroAtuacao(int cadastroAtuacaoID)
        {
            string sWhere = string.Format("CadastroAtuacao_ID = {0}", cadastroAtuacaoID);
            RepositorioModelo.GetCadastroAtuacaoDAO().Deletar(sWhere);
        }
    }
}
