using DAL;
using DTO.Modelos;
using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilitarios;

namespace BLL.Negocio
{
    public class AdministradorBLL
    {
        public static IEnumerable<V_PublicacoesDenunciadas> ListaPublicacoesDenunciadas()
        {
            return RepositorioVisao.GetV_PublicacoesDenunciadasDAO().Listar();
        } 

        public static Administrador Login(string email, string senha)
        {
            senha = ControleUtil.GetMd5Hash(senha);
            //Monta o where da busca
            string sWhere = "Email = " + "'" + email + "'" + " AND Senha = " + "'" + senha + "'";

            return RepositorioModelo.GetAdministradorDAO().Obter(sWhere);
        }
        public static void BloquearUsuario(int usuarioID)
        {
            string sWhere = string.Format("Usuario_ID =  {0}", usuarioID);
            Usuario usuario = UsuarioBLL.BuscarUsuario(usuarioID);
            usuario.FlagBloqueado = true;
            RepositorioModelo.GetUsuarioDAO().Alterar(usuario, sWhere);
        }

        public static void DesbloquearUsuario(int usuarioID)
        {
            string sWhere = string.Format("Usuario_ID =  {0}", usuarioID);
            Usuario usuario = UsuarioBLL.BuscarUsuario(usuarioID);
            usuario.FlagBloqueado = false;
            RepositorioModelo.GetUsuarioDAO().Alterar(usuario, sWhere);
        }

        public static IEnumerable<V_UsuariosBloqueados> ListarUsuariosBloqueados()
        {
            return RepositorioVisao.GetV_UsuariosBloqueadosDAO().Listar();
        }

        public static IEnumerable<V_CadastroAtuacao> ListarCadastroAtuacao()
        {
            return RepositorioVisao.GetV_CadastroAtuacaoDAO().Listar();
        }

        public static void InserirAdministrador(Administrador usuario)
        {
            RepositorioModelo.GetAdministradorDAO().Inserir(usuario);
        }

    }
}
