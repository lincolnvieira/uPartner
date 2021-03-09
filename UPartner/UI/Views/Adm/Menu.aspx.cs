using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.Negocio;
using DTO.Modelos;
using Utilitarios;

namespace UI.Views.Adm
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Administrador"] != null)
                {
                    Administrador administrador = (Administrador)Session["Administrador"];
                    CarregarDados(administrador);
                    CarregarRepeaters();
                }
            }
        }
        private void CarregarRepeaters()
        {
            //Publicações denuncidas
            publicacoesDenunciadasRepeater.DataSource = AdministradorBLL.ListaPublicacoesDenunciadas();
            publicacoesDenunciadasRepeater.DataBind();

            //Usuarios bloqueados
            usuariosBloqueadosRepeater.DataSource = UsuarioBLL.ListarUsuariosBloqueados();
            usuariosBloqueadosRepeater.DataBind();

            //
            solicitacoesRepeater.DataSource = AdministradorBLL.ListarCadastroAtuacao();
            solicitacoesRepeater.DataBind();
        }

        protected void bloquearLinkButton_Click(object sender, EventArgs e)
        {
            var usuarioID = ((LinkButton)sender).CommandArgument;
            AdministradorBLL.BloquearUsuario(int.Parse(usuarioID));
            //Inserir na tabela MotivoBloqueio
            CarregarRepeaters();
        }

        protected void desbloquearLinkButton_Click(object sender, EventArgs e)
        {
            var usuarioID = ((LinkButton)sender).CommandArgument;
            AdministradorBLL.DesbloquearUsuario(int.Parse(usuarioID));
            //Limpar Tabela MotivoBloqueio
            CarregarRepeaters();
        }

        private void CarregarDados(Administrador administrador)
        {
            nomeLabel.Text = administrador.Nome;
            sobrenomeLabel.Text = administrador.Sobrenome;
        }

        protected void logoutLinkButton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Views/Login/Login.aspx", false);
        }

        protected void cadastrarLinkButton_Click(object sender, EventArgs e)
        {
            var cadastroAtuacaoID = ((LinkButton)sender).CommandArgument;
            CadastroAtuacao cadastroAtuacao = CadastroAtuacaoBLL.BuscarCadastroAtuacao(int.Parse(cadastroAtuacaoID));
            Atuacao atuacao = new Atuacao();
            atuacao.Descricao = cadastroAtuacao.Area;
            AtuacaoBLL.InserirAtuacao(atuacao);
            int ultimoID = AtuacaoBLL.UltimoID();
            UsuarioAtuacao usuarioAtuacao = new UsuarioAtuacao();
            usuarioAtuacao.mAtuacao = ultimoID;
            usuarioAtuacao.mUsuario = cadastroAtuacao.mUsuario;
            UsuarioBLL.InserirAtuacao(usuarioAtuacao);
            CadastroAtuacaoBLL.DeletarCadastroAtuacao(cadastroAtuacao.CadastroAtuacao_ID);
            CarregarRepeaters();
        }

        protected void ignorarLinkButton_Click(object sender, EventArgs e)
        {
            var cadastroAtuacaoID = ((LinkButton)sender).CommandArgument;
            CadastroAtuacaoBLL.DeletarCadastroAtuacao(int.Parse(cadastroAtuacaoID));
            CarregarRepeaters();
        }

        protected void btn_Salvar_Click(object sender, EventArgs e)
        {
            try
            {
                if (String.IsNullOrEmpty(nomeTextBox.Text) || String.IsNullOrEmpty(sobrenomeTextBox.Text) ||
                    String.IsNullOrEmpty(emailTextBox.Text) || String.IsNullOrEmpty(senhaTextBox.Text) ||
                    String.IsNullOrEmpty(dataNascTextBox.Text))
                {
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "validacao();", true);
                }
                else
                {
                    if (repetirSenhaTextBox.Text != senhaTextBox.Text)
                        throw new ArgumentException();

                    if (ControleUtil.ValidarMaiorIdade(DateTime.Parse(dataNascTextBox.Text))) //criar metodo para validar menor de idade
                        throw new ArgumentException();

                    if (Page.IsValid)
                    {
                        Administrador usuario = new Administrador();

                        usuario.Nome = nomeTextBox.Text;
                        usuario.Sobrenome = sobrenomeTextBox.Text;
                        usuario.Email = emailTextBox.Text;
                        usuario.Senha = ControleUtil.GetMd5Hash(senhaTextBox.Text);
                        usuario.DataNascimento = DateTime.Parse(dataNascTextBox.Text);
                        usuario.DataCadastro = DateTime.Now;

                        AdministradorBLL.InserirAdministrador(usuario);

                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "sucessoCadastro();", true);
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}