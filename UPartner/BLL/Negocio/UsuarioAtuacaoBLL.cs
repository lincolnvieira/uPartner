using DAL;
using DTO.Modelos;
using DTO.Visao;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Negocio
{
    public class UsuarioAtuacaoBLL
    {
        public static void InserirUsuarioAtuacao(List<UsuarioAtuacao> lsAtuacoes)
        {
            foreach (var item in lsAtuacoes)
            {
                RepositorioModelo.GetUsuarioAtuacaoDAO().Inserir(item);
            }
        }

        public static IEnumerable<V_AtuacoesUsuario> ListarAtuacoesUsuario(int usuarioID)
        {
            string sWhere = string.Format("Usuario_ID = {0}", usuarioID);
            return RepositorioVisao.GetV_AtuacoesUsuarioDAO().Listar(sWhere);
        }

        public static void DeletarUsuarioAtuacao(int usuarioID)
        {
            string sWhere = string.Format("mUsuario = {0}", usuarioID.ToString());
            RepositorioModelo.GetUsuarioAtuacaoDAO().Deletar(sWhere);
        }
    }
}
