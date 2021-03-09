using BLL.Negocio;
using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.Login
{
    public partial class EsqueceuSenha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void voltarLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Login/Login.aspx");
        }

        protected void enviarLinkButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidarCampos())
                {
                    UsuarioBLL.EsqueceuSenha(emailTextBox.Text);

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "sucessoEsqueceuSenha();", true); 

                }
            }
            catch (Exception)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erroEsqueceuSenha();", true);
                //MensagemPadrao(false, "Ocorreu um problema durante a operação. ");
            }
        }

        //private void MensagemPadrao(bool resultado, string mensagem)
        //{
        //    if (resultado)
        //    {
        //        modalMensagem.InnerText = mensagem;
        //        tipoDiv.Attributes.Add("class", "alert alert-success");
        //        mensagemAviso.Style.Add("display", "block");

        //    }
        //    else
        //    {
        //        modalMensagem.InnerText = mensagem;
        //        tipoDiv.Attributes.Add("class", "alert alert-warning");
        //        mensagemAviso.Style.Add("display", "block");
        //    }
        //}

        private bool ValidarCampos()
        {
            if (!(string.IsNullOrEmpty(emailTextBox.Text)))
            {
                mensagemErro.Style.Add("display", "none");
                emailTextBox.Style.Add("border", "none");

                return true;
            }
            else
            {
                mensagemErro.Style.Add("display", "block");
                mensagemAviso.Style.Add("display", "none");
                emailTextBox.Style.Add("border", "1px solid red");

                return false;
            }
        }
    }
}