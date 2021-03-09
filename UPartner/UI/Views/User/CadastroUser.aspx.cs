using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using Utilitarios;
using DTO.Modelos;
using Utilitarios.Enum;
using DAL.DAO;
using BLL.Negocio;

namespace UI.Views.User
{
    public partial class CadastroUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarCombos();
            }
        }

        private void CarregarCombos()
        {
            foreach (var item in Enum.GetValues(typeof(enTipoConta)))
            {
                if (!item.ToString().Equals("ADMINISTRADOR"))
                    cbxTipoConta.Items.Add(new ListItem(item.ToString(), ((int)item).ToString()));
            }

            //foreach (var item in Enum.GetValues(typeof(enAtuacao)))
            //{
            //    atuacaoListBox.Items.Add(new ListItem(item.ToString(), ((int)item).ToString()));
            //}

            IEnumerable<Atuacao> inAtuacao = AtuacaoBLL.ObterAtuacoes();
            foreach (var item in inAtuacao)
            {
                atuacaoListBox.Items.Add(new ListItem(item.Descricao, item.Atuacao_ID.ToString()));
            }
            atuacaoListBox.SelectedIndex = -1;

        }

        protected void btn_Salvar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    Usuario usuario = ValoresForm();
                    List<UsuarioAtuacao> lsAtuacoes = new List<UsuarioAtuacao>();

                    UsuarioBLL.InserirUsuario(usuario);

                    usuario = UsuarioBLL.Login(txtEmail.Text, txtSenha.Text);

                    foreach (ListItem li in atuacaoListBox.Items)
                    {
                        if (li.Selected == true)
                        {
                            UsuarioAtuacao usuarioAtuacao = new UsuarioAtuacao();
                            usuarioAtuacao.mUsuario = usuario.Usuario_ID;
                            usuarioAtuacao.mAtuacao = int.Parse(li.Value);
                            lsAtuacoes.Add(usuarioAtuacao);
                        }

                    }

                    UsuarioAtuacaoBLL.InserirUsuarioAtuacao(lsAtuacoes);

                    if(Session["Area"] != null)
                    {
                        CadastroAtuacao cadastroAtuacao = new CadastroAtuacao();
                        try
                        {
                            //cadastroAtuacao.mUsuario = usuario.Usuario_ID;
                            //cadastroAtuacao.Area = (string)Session["Area"];
                            //cadastroAtuacao.DataSolicitacao = DateTime.Now;
                            //cadastroAtuacao.StatusSolicitacao = 1;
                            //UsuarioBLL.SolicitarCadastroAtuacao(cadastroAtuacao);
                        }
                        catch (Exception)
                        {

                            throw;
                        }
                        finally
                        {
                            Session.Remove("Area");
                        }
                    }
                        
                    Session.Add("Usuario", usuario);
                    Response.Redirect("~/Views/Index/Index.aspx", false);
                }
                else
                {
                    //mensagemErro.Style.Add("display", "block");
                    mensagemAviso.Style.Add("display", "none");
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erroCadastro();", true);
                //MensagemPadrao(MensagemEstruturada.PROBLEMA_EXECUCAO);
            }
        }

        protected void btn_Limpar_Click(object sender, EventArgs e)
        {
            // Dados Pessoais.
            txtNome.Text = "";
            txtSobrenome.Text = "";
            txtCPF.Text = "";
            txtCNPJ.Text = "";
            txtDataNascimento.Text = "";
        }

        protected void btn_Limpar_Dados_conta_Click(object sender, EventArgs e)
        {
            // Dados Conta.
            txtEmail.Text = "";
            txtSenha.Text = "";
            txtRepetirSenha.Text = "";
            txtSobre.Text = "";
        }

        protected void btn_Limpar_Endereco_Click(object sender, EventArgs e)
        {
            // Endereço.
            txtCEP.Text = "";
            txtLogradouro.Text = "";
            txtBairro.Text = "";
            txtEstado.Text = "";
            txtCidade.Text = "";
            txtNumero.Text = "";
            txtComplemento.Text = "";
        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Login/Login.aspx", true);
        }

        protected void txtCEP_TextChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "consultaCep();", true);
        }

        #region Métodos Privados

        private void MensagemPadrao(int mensagem)
        {
            //if (resultado)
            //{
            //    modalMensagem.InnerText = mensagem;
            //    tipoDiv.Attributes.Add("class", "alert alert-success");
            //    mensagemAviso.Style.Add("display", "block");
            //}
            //else
            //{
            //    modalMensagem.InnerText = mensagem;
            //    tipoDiv.Attributes.Add("class", "alert alert-warning");
            //    mensagemAviso.Style.Add("display", "block");
            //}
        }

        private Usuario ValoresForm()
        {
            Usuario usuario = new Usuario();

            // Dados Pessoais.
            usuario.Nome = txtNome.Text;
            usuario.Sobrenome = txtSobrenome.Text;
            usuario.DataNascimento = DateTime.Parse(txtDataNascimento.Text);

            // Dados Conta.
            usuario.Email = txtEmail.Text;
            usuario.Senha = txtSenha.Text;
            usuario.Sobre = txtSobre.Text;
            usuario.mTipoConta = int.Parse(cbxTipoConta.SelectedValue);
            usuario.MimeType = flpFoto.PostedFile.ContentType;
            usuario.FotoPerfil = flpFoto.FileBytes;

            // Endereço.
            usuario.CEP = txtCEP.Text;
            usuario.Rua = txtLogradouro.Text;
            usuario.Bairro = txtBairro.Text;
            usuario.Estado = txtEstado.Text;
            usuario.Cidade = txtCidade.Text;
            if (txtNumero.Text != "")
                usuario.Numero = int.Parse(txtNumero.Text);

            usuario.Complemento = txtComplemento.Text;

            // Valores Default.
            usuario.DataCadastro = DateTime.Now;
            usuario.FlagAlterouSenha = false;
            usuario.FlagAtivo = true;
            usuario.FlagBloqueado = false;
            usuario.FlagHabilitouEmail = true;
            usuario.DataUltimoAcesso = DateTime.Now;

            return usuario;
        }

        #endregion

        protected void cbxTipoConta_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbxTipoConta.SelectedValue == "EMPRESA")
            {
                txtNome.Visible = false;
                txtSobrenome.Visible = false;
                empresaTextBox.Visible = true;
            }
            else
            {
                txtNome.Visible = true;
                txtSobrenome.Visible = true;
                empresaTextBox.Visible = false;
            }
        }

        protected void cadastrarAtuacaoLinkButton_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "cadastrarAtuacao();", true);
        }

        protected void cadastrarButton_Click(object sender, EventArgs e)
        {
            if(areaTextBox.Text != "")
                Session.Add("Area", areaTextBox.Text);
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "PreencherArea();", true);
        }
    }
}