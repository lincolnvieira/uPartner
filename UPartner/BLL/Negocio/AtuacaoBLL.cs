using DAL;
using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Negocio
{
    public class AtuacaoBLL
    {
        public static Atuacao GetAtuacao(int id)
        {
            string sWhere = "Atuacao_ID = " + id;
            return RepositorioModelo.GetAtuacaoDAO().Obter(sWhere);
        }

        public static void InserirAtuacao(Atuacao atuacao)
        {
            RepositorioModelo.GetAtuacaoDAO().Inserir(atuacao);
        }
        public static int UltimoID()
        {
            return RepositorioModelo.GetAtuacaoDAO().UltimoID();
        }
        public static IEnumerable<Atuacao> ObterAtuacoes()
        {
            return RepositorioModelo.GetAtuacaoDAO().Listar();
        }
    }
}
