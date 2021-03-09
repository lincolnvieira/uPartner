using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Negocio;
using DTO;
using DTO.Modelos;
using Utilitarios.Enum;

namespace UI.Views.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Abandon();
            }
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    if (ValidarCampos())
                    {
                        string email = txtEmail.Text;
                        string senha = txtSenha.Text;
                        if (email.Contains("@upartner.com.br"))
                        {
                            Administrador administrador = AdministradorBLL.Login(email, senha);
                            Session.Add("Administrador", administrador);
                            Response.Redirect("~/Views/Adm/Menu.aspx", false); 
                        }
                        else
                        {
                            Usuario usuario = UsuarioBLL.Login(email, senha);

                            if (usuario.FlagBloqueado)
                            {
                                throw new ArgumentException("BLOQUEADO");
                            } else if( usuario.Usuario_ID == 0)
                            {
                                throw new ArgumentException("INVALIDOS");
                            }
                            else
                            {
                                Session.Add("Usuario", usuario);
                                Response.Redirect("~/Views/Index/Index.aspx", false);
                            }
                        }
                    } 
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.ToUpper().Trim() == "BLOQUEADO")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erroLogin(1);", true);
                }
                else if (ex.Message.ToUpper().Trim() == "INVALIDOS")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erroLogin(2);", true);
                }
               
            }
        }

        public bool ValidarCampos()
        {
            if (!(string.IsNullOrEmpty(txtEmail.Text) && string.IsNullOrEmpty(txtSenha.Text)))
            {
                mensagemErro.Style.Add("display", "none");

                // Só colocar os campos que devem ser preenchidos
                txtEmail.Style.Add("border", "none");
                txtSenha.Style.Add("border", "none");

                return true;
            }
            else
            {
                mensagemErro.Style.Add("display", "block");
                mensagemAviso.Style.Add("display", "none");

                // Só colocar os campos que devem ser preenchidos
                txtEmail.Style.Add("border", "1px solid red");
                txtSenha.Style.Add("border", "1px solid red");

                return false;
            }
        }

        protected void cadastrarLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/User/CadastroUser.aspx");
        }

        protected void recuperarSenhaLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Login/EsqueceuSenha.aspx");
        }
    }
}