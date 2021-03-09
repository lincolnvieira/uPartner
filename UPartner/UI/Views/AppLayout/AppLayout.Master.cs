using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilitarios;

namespace UI.Views.AppLayout
{
    public partial class AppLayout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["Usuario"];
            string url = ControleUtil.GetUrlAtual();

            if ((usuario == null) && !((url != "http://localhost/UPartner/Views/User/CadastroUser.aspx") || (url != "http://localhost/UPartner/Views/Login/Login.aspx")))
            {
                Response.Redirect("http://localhost/UPartner/Views/Login/Login.aspx");
                Session.Abandon();
            }
                

        }
    }
}