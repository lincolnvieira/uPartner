using DAL;
using DTO.Modelos;
using DTO.StoreProcedure;
using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Negocio
{
    public class PublicacaoBLL
    {
        public static void InserirPublicacoes(Publicacao publicacao)
        {
            RepositorioModelo.GetPublicacaoDAO().Inserir(publicacao);
        }

        public static int BuscarUltimoID(int id)
        {
            return RepositorioModelo.GetPublicacaoDAO().UltimoID(id);
        }
        public static IEnumerable<Sp_Publicacoes> ListarPublicacoes(int usuarioID)
        {
            string sWhere = usuarioID.ToString();
            return RepositorioProcedure.GetSp_PublicacoesDAO().Listar(sWhere);
        }
        public static IEnumerable<V_Publicacoes> ListarPublicacoesUsuario(int usuarioID)
        {
            string sWhere = string.Format("Usuario_ID = {0}", usuarioID);
            return RepositorioVisao.GetV_PublicacoesDAO().Listar(sWhere);
        }

        public static IEnumerable<V_PublicacoesFoco> ListarPublicacoesFoco(int publicacaoID)
        {
            string sWhere = string.Format("Publicacao_ID = {0}",publicacaoID.ToString());
            return RepositorioVisao.GetV_PublicacoesFocoDAO().Listar(sWhere);
        }
    }
}
