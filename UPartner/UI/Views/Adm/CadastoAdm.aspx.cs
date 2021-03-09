using BLL.Negocio;
using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilitarios;
using Utilitarios.Enum;

namespace UI.Views.Adm
{
    public partial class CadastoAdm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_Salvar_Click(object sender, EventArgs e)
        {
            try
            {
                if (repetirSenhaTextBox.Text != senhaTextBox.Text)
                    throw new ArgumentException();

                if (ControleUtil.ValidarMaiorIdade(DateTime.Parse(dataNascTextBox.Text))) //criar metodo para validar menor de idade
                    throw new ArgumentException();

                if (Page.IsValid)
                {
                    Usuario usuario = new Usuario();
                    usuario.Nome = nomeTextBox.Text;
                    usuario.Sobrenome = sobrenomeTextBox.Text;
                    usuario.Email = emailTextBox.Text;
                    usuario.Senha = ControleUtil.GetMd5Hash(senhaTextBox.Text);
                    usuario.DataNascimento = DateTime.Parse(dataNascTextBox.Text);
                    usuario.mTipoConta = 1;
                    usuario.DataCadastro = DateTime.Now;
                    usuario.FlagAtivo = true;
                    List<UsuarioAtuacao> usuarioAtuacoes = new List<UsuarioAtuacao>();
                    UsuarioBLL.InserirUsuario(usuario);
                }

            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btn_Voltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Administrador/Menu.aspx");
        }
    }
}