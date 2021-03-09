using BLL.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.Administrador
{
    public partial class BloqueioContas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["desbloquear"] == "ok")
                {

                    CarregarRepeaterUsuariosBloqueados();
                }
                else
                {
                    CarregarRepeaterUsuariosDenunciados();
                }
            }
        }

        protected void bloquearLinkButton_Click(object sender, EventArgs e)
        {
            var argumento = ((LinkButton)sender).CommandArgument;
            UsuarioBLL.BloquearUsuario(Convert.ToInt32(argumento));
        }

        protected void detalhesLinkButton_Click(object sender, EventArgs e)
        {
            var argumento = ((LinkButton)sender).CommandArgument;
            CarregarRepeaterPBDenunciadas(argumento);
        }

        public void CarregarRepeaterPBDenunciadas(string id)
        {
            denunciadosRepeater.Visible = false;
            //publicacoesdenunciadasRepeater.DataSource = V_PublicacoesBLL.ListarPublicacoes(id);
            publicacoesdenunciadasRepeater.DataBind();
            publicacoesdenunciadasRepeater.Visible = true;
        }

        public void CarregarRepeaterUsuariosDenunciados()
        {
            publicacoesdenunciadasRepeater.Visible = false;
            //v_usuariosDenunciados usuariosDenunciados = new v_usuariosDenunciados();
            //denunciadosRepeater.DataSource = usuariosDenunciados.Listar();
            denunciadosRepeater.DataBind();
        }

        public void CarregarRepeaterUsuariosBloqueados()
        {
            //bloqueadosRepeater.DataSource = UsuarioDAO.ListarBloqueados();
            bloqueadosRepeater.DataBind();
        }

        protected void desbloquearLinkButton_Click(object sender, EventArgs e)
        {
            var argumento = ((LinkButton)sender).CommandArgument;
            UsuarioBLL.DesbloquearUsuario(Convert.ToInt32(argumento));
        }
    }
}