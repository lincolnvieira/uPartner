using BLL.Negocio;
using DTO.Modelos;
using DTO.Visao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilitarios;
using Utilitarios.Enum;

namespace UI.Views.User
{
    public partial class PerfilUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario usuario = new Usuario();
                if (Request["MeuPerfil"] == "ok")
                {
                    int usuarioID = int.Parse(Request.QueryString["id"]);
                    usuario = UsuarioBLL.BuscarUsuario(usuarioID);
                    submeterButton.Enabled = false;
                    submeterButton.Visible = false;
                    CarregarRepeaters(usuario.Usuario_ID);
                    CarregarPublicacoes(usuario.Usuario_ID);

                }
                else if (Request["OutroPerfil"] == "ok")
                {
                    int usuarioID = int.Parse(Request.QueryString["id"]);
                    usuario = UsuarioBLL.BuscarUsuario(usuarioID);
                    CarregarRepeaters(usuarioID);
                    CarregarPublicacoes(usuarioID);
                    if (usuario.mTipoConta == 3)
                    {
                        //alterarSenhaLinkButton.Enabled = false;
                        //alterarSenhaLinkButton.Visible = false;
                        submeterButton.Enabled = true;
                        submeterButton.Visible = true;
                        editarDadosPessoaisLinkButton.Visible = false;
                        editarDadosContaLinkButton.Visible = false;
                        editarEnderecoLinkButton.Visible = false;
                        //menu2.Visible = false;
                    }
                    else
                    {
                        //alterarSenhaLinkButton.Enabled = false;
                        //alterarSenhaLinkButton.Visible = false;
                        submeterButton.Enabled = false;
                        submeterButton.Visible = false;
                        editarDadosPessoaisLinkButton.Visible = false;
                        editarDadosContaLinkButton.Visible = false;
                        editarEnderecoLinkButton.Visible = false;
                        //menu2.Visible = false;
                    }
                }


                if (Request["editar"] == "ok")
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    CarregarEvento(id);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "novoEvento(2);", true);
                }

                CarregaComboTipoEvento();
                CarregaComboFocoEvento(usuario.Usuario_ID);
                CarregaComboFocoEventoNovo(usuario.Usuario_ID);
                CarregaComboAtuacao(usuario.Usuario_ID);
                CarregarDados(usuario);
            }
        }

        private void CarregarDados(Usuario usuario)
        {
            idLabel.Text = Convert.ToString(usuario.Usuario_ID);
            nomeLabel.Text = usuario.Nome;
            sobrenomeLabel.Text = usuario.Sobrenome;
            Labelnome.Text = usuario.Nome;
            Labelsobrenome.Text = usuario.Sobrenome;
            tipoContaLabel.Text = TipoContaBLL.GetTipoConta(usuario.mTipoConta).Descricao;
            dataNascimentoLabel.Text = usuario.DataNascimento.ToLocalTime().ToString("yyyy-MM-dd");
            string imgbase64 = Convert.ToBase64String(usuario.FotoPerfil);
            fotoPerfilImage.ImageUrl = string.Format("data:{0};base64,{1}", usuario.MimeType, imgbase64);
            emailLabel.Text = usuario.Email;
            //senhaLabel.Text = ControleUtil.GetMd5Hash(usuario.Senha);
            sobreLabel.Text = usuario.Sobre;
            cepLabel.Text = usuario.CEP;
            logradouroLabel.Text = usuario.Rua;
            numeroLabel.Text = usuario.Numero.ToString();
            complementoLabel.Text = usuario.Complemento;
            bairroLabel.Text = usuario.Bairro;
            cidadeLabel.Text = usuario.Cidade;
            estadoLabel.Text = usuario.Estado;

            AreasAtuacao(usuario.Usuario_ID);

        }

        public void AreasAtuacao(int usuarioID)
        {
            atuacoesRepeater.DataSource = UsuarioAtuacaoBLL.ListarAtuacoesUsuario(usuarioID);
            atuacoesRepeater.DataBind();
        }

        protected void editarDadosPessoaisLinkButton_Click(object sender, EventArgs e)
        {
            salvarDadosPessoaisLinkButton.Enabled = true;
            salvarDadosPessoaisLinkButton.Visible = true;

            cancelarDadosPessoaisLinkButton.Enabled = true;
            cancelarDadosPessoaisLinkButton.Visible = true;

            editarDadosPessoaisLinkButton.Enabled = false;
            editarDadosPessoaisLinkButton.Visible = false;


            nomeTextBox.Text = nomeLabel.Text;
            sobrenomeTextBox.Text = sobrenomeLabel.Text;
            dataNascimentoTextBox.Text = dataNascimentoLabel.Text;


            nomeLabel.Enabled = false;
            nomeLabel.Visible = false;
            sobrenomeTextBox.Enabled = false;
            sobrenomeLabel.Visible = false;
            dataNascimentoLabel.Enabled = false;
            dataNascimentoLabel.Visible = false;

            nomeTextBox.Enabled = true;
            nomeTextBox.Visible = true;
            sobrenomeTextBox.Enabled = true;
            sobrenomeTextBox.Visible = true;
            dataNascimentoTextBox.Enabled = true;
            dataNascimentoTextBox.Visible = true;
        }

        protected void alterarImagem_click(object sender, EventArgs e)
        {
            Usuario usuario = UsuarioBLL.BuscarUsuario(int.Parse(Request.QueryString["id"]));

            usuario.FotoPerfil = FileUpload3.FileBytes;
            usuario.MimeType = FileUpload3.PostedFile.ContentType;

            UsuarioBLL.AlterarUsuario(usuario);
            AlterarFotoPerfil(usuario);
        }

        protected void AlterarFotoPerfil(Usuario usuario)
        {
            string imgbase64 = Convert.ToBase64String(usuario.FotoPerfil);
            fotoPerfilImage.ImageUrl = string.Format("data:{0};base64,{1}", usuario.MimeType, imgbase64);
            Session["Usuario"] = usuario;
        }


        private void CarregaComboAtuacao(int usuarioID)
        {

            IEnumerable<Atuacao> inAtuacao = AtuacaoBLL.ObterAtuacoes();
            foreach (var item in inAtuacao)
            {
                cbxAreaAtuacao.Items.Add(new ListItem(item.Descricao, item.Atuacao_ID.ToString()));
            }
            cbxAreaAtuacao.SelectedIndex = -1;

            IEnumerable<V_AtuacoesUsuario> inAreaAtuacao = UsuarioAtuacaoBLL.ListarAtuacoesUsuario(usuarioID);

            foreach (ListItem li in cbxAreaAtuacao.Items)
            {
                foreach (var item in inAreaAtuacao)
                {
                    if (li.Value.Equals(item.Atuacao_ID.ToString()))
                    {
                        li.Selected = true;
                    }
                }
            }
        }

        protected void editarAreaDeAtuacaoLinkButton_Click(object sender, EventArgs e)
        {
            salvarAreaDeAtuacaoLinkButton.Enabled = true;
            salvarAreaDeAtuacaoLinkButton.Visible = true;

            cancelarAreaDeAtuacaoLinkButton.Enabled = true;
            cancelarAreaDeAtuacaoLinkButton.Visible = true;

            editarAreaDeAtuacaoLinkButton.Enabled = false;
            editarAreaDeAtuacaoLinkButton.Visible = false;

            //TEXTBOX
            cbxAreaAtuacao.Enabled = true;
            cbxAreaAtuacao.Visible = true;

            Label26.Visible = true;
        }

        protected void salvarAreaDeAtuacaoLinkButton_Click(object sender, EventArgs e)
        {
            Usuario usuario = UsuarioBLL.BuscarUsuario(int.Parse(Request.QueryString["id"]));
            UsuarioAtuacao usuarioAtuacao;
            List<UsuarioAtuacao> lsAtuacao = new List<UsuarioAtuacao>();

            foreach (ListItem li in cbxAreaAtuacao.Items)
            {
                if (li.Selected == true)
                {
                    usuarioAtuacao = new UsuarioAtuacao
                    {
                        mUsuario = usuario.Usuario_ID,
                        mAtuacao = int.Parse(li.Value)
                    };
                    lsAtuacao.Add(usuarioAtuacao);
                }
            }

            UsuarioAtuacaoBLL.DeletarUsuarioAtuacao(usuario.Usuario_ID);
            UsuarioAtuacaoBLL.InserirUsuarioAtuacao(lsAtuacao);
            CancelarAreaDeAtuacao();
            AreasAtuacao(usuario.Usuario_ID);
        }

        protected void cancelarAreaDeAtuacaoLinkButton_Click(object sender, EventArgs e)
        {
            CancelarAreaDeAtuacao();
        }

        public void CancelarAreaDeAtuacao()
        {
            salvarAreaDeAtuacaoLinkButton.Enabled = false;
            salvarAreaDeAtuacaoLinkButton.Visible = false;

            cancelarAreaDeAtuacaoLinkButton.Enabled = false;
            cancelarAreaDeAtuacaoLinkButton.Visible = false;

            editarAreaDeAtuacaoLinkButton.Enabled = true;
            editarAreaDeAtuacaoLinkButton.Visible = true;

            cbxAreaAtuacao.Enabled = false;
            cbxAreaAtuacao.Visible = false;

            Label26.Visible = false;
        }



        protected void salvarDadosPessoaisLinkButton_Click(object sender, EventArgs e)
        {
            Usuario usuario = UsuarioBLL.BuscarUsuario(int.Parse(Request.QueryString["id"]));

            usuario.Nome = nomeTextBox.Text;
            usuario.Sobrenome = sobrenomeTextBox.Text;
            usuario.DataNascimento = DateTime.Parse(dataNascimentoTextBox.Text);
            CarregarDadosPessoais(usuario);
            CancelarDadosPessoais();
            UsuarioBLL.AlterarUsuario(usuario);
        }

        private void CarregarDadosPessoais(Usuario usuario)
        {
            nomeLabel.Text = usuario.Nome;
            sobrenomeLabel.Text = usuario.Sobrenome;
            dataNascimentoLabel.Text = usuario.DataNascimento.ToString(); ;
        }

        protected void cancelarDadosPessoaisLinkButton_Click(object sender, EventArgs e)
        {
            CancelarDadosPessoais();
        }
        public void CancelarDadosPessoais()
        {
            salvarDadosPessoaisLinkButton.Enabled = false;
            salvarDadosPessoaisLinkButton.Visible = false;

            cancelarDadosPessoaisLinkButton.Enabled = false;
            cancelarDadosPessoaisLinkButton.Visible = false;

            editarDadosPessoaisLinkButton.Enabled = true;
            editarDadosPessoaisLinkButton.Visible = true;

            nomeLabel.Enabled = true;
            nomeLabel.Visible = true;
            sobrenomeTextBox.Enabled = true;
            sobrenomeLabel.Visible = true;
            dataNascimentoLabel.Enabled = true;
            dataNascimentoLabel.Visible = true;

            nomeTextBox.Enabled = false;
            nomeTextBox.Visible = false;
            sobrenomeTextBox.Enabled = false;
            sobrenomeTextBox.Visible = false;
            dataNascimentoTextBox.Enabled = false;
            dataNascimentoTextBox.Visible = false;
        }

        protected void salvarDadosContaLinkButton_Click(object sender, EventArgs e)
        {
            bool validaEmail = true;

            Usuario usuario = UsuarioBLL.BuscarUsuario(int.Parse(Request.QueryString["id"]));

            if (usuario.Email != emailTextBox.Text)
            {
                validaEmail = UsuarioBLL.ValidarEmail(emailTextBox.Text);
            }

            if (validaEmail)
            {
                usuario.Email = emailTextBox.Text;
                usuario.Sobre = sobreTextBox.Text;
                CarregarDadosConta(usuario);
                CancelarDadosConta();
                UsuarioBLL.AlterarUsuario(usuario);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKeys", "fecharModal();", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erroEmailValidacao();", true);
            }

        }

        protected void cancelarDadosContaLinkButton_Click(object sender, EventArgs e)
        {
            CancelarDadosConta();
        }

        private void CarregarDadosConta(Usuario usuario)
        {
            emailLabel.Text = usuario.Email;
            sobreLabel.Text = usuario.Sobre;
        }
        public void CancelarDadosConta()
        {
            salvarDadosContaLinkButton.Enabled = false;
            salvarDadosContaLinkButton.Visible = false;

            cancelarDadosContaLinkButton.Enabled = false;
            cancelarDadosContaLinkButton.Visible = false;

            editarDadosContaLinkButton.Enabled = true;
            editarDadosContaLinkButton.Visible = true;

            //alterarSenhaLinkButton.Enabled = true;
            //alterarSenhaLinkButton.Visible = true;

            emailLabel.Enabled = true;
            emailLabel.Visible = true;

            //senhaLabel.Enabled = true;
            //senhaLabel.Visible = true;

            sobreLabel.Enabled = true;
            sobreLabel.Visible = true;

            //repetirLabel.Enabled = false;
            //repetirLabel.Visible = false;


            emailTextBox.Enabled = false;
            emailTextBox.Visible = false;

            senhaTextBox.Enabled = false;
            senhaTextBox.Visible = false;

            sobreTextBox.Enabled = false;
            sobreTextBox.Visible = false;

            repetirTextBox.Enabled = false;
            repetirTextBox.Visible = false;
        }

        protected void salvarEnderecoLinkButton_Click(object sender, EventArgs e)
        {
            Usuario usuario = UsuarioBLL.BuscarUsuario(int.Parse(Request.QueryString["id"]));

            usuario.CEP = cepTextBox.Text;
            usuario.Cidade = cidadeTextBox.Text;
            usuario.Bairro = bairroTextBox.Text;
            usuario.Complemento = complementoTextBox.Text;
            usuario.Estado = estadoTextBox.Text;
            usuario.Rua = logradouroTextBox.Text;
            usuario.Numero = int.Parse(numeroTextBox.Text);
            CarregarEndereco(usuario);
            CancelarEndereco();
            UsuarioBLL.AlterarUsuario(usuario);
        }

        private void CarregarEndereco(Usuario usuario)
        {
            cepLabel.Text = usuario.CEP;
            cidadeLabel.Text  = usuario.Cidade;
            bairroLabel.Text =usuario.Bairro;
            complementoLabel.Text = usuario.Complemento;
            estadoLabel.Text = usuario.Estado;
            logradouroLabel.Text = usuario.Rua;
            numeroLabel.Text = usuario.Numero.ToString();
        }

        protected void cancelarEnderecoLinkButton_Click(object sender, EventArgs e)
        {
            CancelarEndereco();
        }

        public void CancelarEndereco()
        {
            salvarEnderecoLinkButton.Enabled = false;
            salvarEnderecoLinkButton.Visible = false;

            cancelarEnderecoLinkButton.Enabled = false;
            cancelarEnderecoLinkButton.Visible = false;

            editarEnderecoLinkButton.Enabled = true;
            editarEnderecoLinkButton.Visible = true;


            //LABEL
            cepLabel.Enabled = true;
            cepLabel.Visible = true;

            logradouroLabel.Enabled = true;
            logradouroLabel.Visible = true;

            numeroLabel.Enabled = true;
            numeroLabel.Visible = true;

            complementoLabel.Enabled = true;
            complementoLabel.Visible = true;

            bairroLabel.Enabled = true;
            bairroLabel.Visible = true;

            cidadeLabel.Enabled = true;
            cidadeLabel.Visible = true;

            estadoLabel.Visible = true;
            estadoLabel.Enabled = true;

            //TEXTBOX
            cepTextBox.Enabled = false;
            cepTextBox.Visible = false;

            logradouroTextBox.Enabled = false;
            logradouroTextBox.Visible = false;

            numeroTextBox.Enabled = false;
            numeroTextBox.Visible = false;

            complementoTextBox.Enabled = false;
            complementoTextBox.Visible = false;

            bairroTextBox.Enabled = false;
            bairroTextBox.Visible = false;

            cidadeTextBox.Enabled = false;
            cidadeTextBox.Visible = false;

            estadoTextBox.Visible = false;
            estadoTextBox.Enabled = false;
        }

        private void CarregaComboFocoEvento(int usuarioID)
        {

            //IEnumerable<V_AtuacoesUsuario> inEventoFoco = UsuarioAtuacaoBLL.ListarAtuacoesUsuario(usuarioID);
            //cbxTipoEventoNovo.Items.Add("");
            //foreach (var item in inEventoFoco)
            //{
            //    cbxTipoEventoNovo.Items.Add(new ListItem(item.Descricao, item.Atuacao_ID.ToString()));
            //}
            //cbxTipoEventoNovo.SelectedIndex = -1;
        }

        private void CarregaComboFocoEventoNovo(int usuarioID)
        {
            IEnumerable<V_AtuacoesUsuario> inEventoFoco = UsuarioAtuacaoBLL.ListarAtuacoesUsuario(usuarioID);
            cbxEventoFocoNovo.Items.Add("");
            foreach (var item in inEventoFoco)
            {
                cbxEventoFocoNovo.Items.Add(new ListItem(item.Descricao, item.Atuacao_ID.ToString()));
            }
            cbxEventoFocoNovo.SelectedIndex = -1;
        }

        protected void editarEnderecoLinkButton_Click(object sender, EventArgs e)
        {
            salvarEnderecoLinkButton.Enabled = true;
            salvarEnderecoLinkButton.Visible = true;

            cancelarEnderecoLinkButton.Enabled = true;
            cancelarEnderecoLinkButton.Visible = true;

            editarEnderecoLinkButton.Enabled = false;
            editarEnderecoLinkButton.Visible = false;

            cepTextBox.Text = cepLabel.Text;
            logradouroTextBox.Text = logradouroLabel.Text;
            numeroTextBox.Text = numeroLabel.Text;
            complementoTextBox.Text = complementoLabel.Text;
            bairroTextBox.Text = bairroLabel.Text;
            cidadeTextBox.Text = cidadeLabel.Text;
            estadoTextBox.Text = estadoLabel.Text;

            //LABEL
            cepLabel.Enabled = false;
            cepLabel.Visible = false;

            logradouroLabel.Enabled = false;
            logradouroLabel.Visible = false;

            numeroLabel.Enabled = false;
            numeroLabel.Visible = false;

            complementoLabel.Enabled = false;
            complementoLabel.Visible = false;

            bairroLabel.Enabled = false;
            bairroLabel.Visible = false;

            cidadeLabel.Enabled = false;
            cidadeLabel.Visible = false;

            estadoLabel.Visible = false;
            estadoLabel.Enabled = false;

            //TEXTBOX
            cepTextBox.Enabled = true;
            cepTextBox.Visible = true;

            logradouroTextBox.Enabled = true;
            logradouroTextBox.Visible = true;

            numeroTextBox.Enabled = true;
            numeroTextBox.Visible = true;

            complementoTextBox.Enabled = true;
            complementoTextBox.Visible = true;

            bairroTextBox.Enabled = true;
            bairroTextBox.Visible = true;

            cidadeTextBox.Enabled = true;
            cidadeTextBox.Visible = true;

            estadoTextBox.Visible = true;
            estadoTextBox.Enabled = true;


        }

        protected void editarDadosContaLinkButton_Click(object sender, EventArgs e)
        {
            salvarDadosContaLinkButton.Enabled = true;
            salvarDadosContaLinkButton.Visible = true;

            cancelarDadosContaLinkButton.Enabled = true;
            cancelarDadosContaLinkButton.Visible = true;

            editarDadosContaLinkButton.Enabled = false;
            editarDadosContaLinkButton.Visible = false;

            //alterarSenhaLinkButton.Enabled = false;
            //alterarSenhaLinkButton.Visible = false;


            emailTextBox.Text = emailLabel.Text;
            //senhaTextBox.Text = senhaLabel.Text;
            //sobreTextBox.Text = sobreLabel.Text;

            emailLabel.Enabled = false;
            emailLabel.Visible = false;

            //senhaLabel.Enabled = false;
            //senhaLabel.Visible = false;

            sobreLabel.Enabled = false;
            sobreLabel.Visible = false;


            emailTextBox.Enabled = true;
            emailTextBox.Visible = true;

            senhaTextBox.Enabled = true;
            senhaTextBox.Visible = true;

            sobreTextBox.Enabled = true;
            sobreTextBox.Visible = true;

            //repetirLabel.Enabled = true;
            //repetirLabel.Visible = true;

            repetirTextBox.Enabled = true;
            repetirTextBox.Visible = true;


        }

        protected void voltarLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Index/Index.aspx", false);
        }

        protected void modalLinkButton_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "submeterProjeto();", true);
        }

        protected void alterarSenhaLinkButton_Click(object sender, EventArgs e)
        {
            var senha = senhaTextBox.Text;
            var repetirSenha = repetirTextBox.Text;
            Usuario usuario = UsuarioBLL.BuscarUsuario(int.Parse(Request.QueryString["id"]));

            if (senha.Length == 8 && repetirSenha.Length == 8)
            {
                if ((senha != "" && repetirSenha != "") && senha == repetirSenha)
                {

                    usuario.Senha = ControleUtil.GetMd5Hash(senha);

                    UsuarioBLL.AlterarUsuario(usuario);

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKeys", "fecharModal();", true);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "sucessoAlterarSenha();", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKeys", "fecharModal();", true);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erroAlterarSenha();", true);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKeys", "fecharModal();", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erroCaracteresAlterarSenha();", true);
            }
        }

        protected void cancelarLinkButton_Click(object sender, EventArgs e)
        {
            var eventoID = ((LinkButton)sender).CommandArgument;
            Usuario usuario = (Usuario)Session["Usuario"];
            ParticipanteBLL.CancelarParticipacao(int.Parse(eventoID), usuario.Usuario_ID);
            CarregarRepeaters(usuario.Usuario_ID);

        }

        protected void CarregarRepeaters(int usuarioID)
        {
            CarregarEventosParticipando(usuarioID);
            CarregarEventosCriado(usuarioID);

        }

        private void CarregarEventosCriado(int usuario_ID)
        {
            eventosCriadoRepeater.DataSource = EventoBLL.ListarEventosCriados(usuario_ID);
            eventosCriadoRepeater.DataBind();
        }

        private void CarregarEventosParticipando(int usuario_id)
        {
            IEnumerable<Participante> participantes = ParticipanteBLL.ListarParticipacoes(usuario_id);
            if (participantes.Count() > 0)
            {
                eventosParticipandoRepeater.DataSource = EventoBLL.ListarEventosParticipando(participantes);
                eventosParticipandoRepeater.DataBind();
            }
            else
            {
                eventosParticipandoRepeater.DataSource = null;
                eventosParticipandoRepeater.DataBind();
            }
        }

        protected void editarLinkButton_Click(object sender, EventArgs e)
        {
            var eventoID = ((LinkButton)sender).CommandArgument;
            Response.Redirect("~/Views/User/PerfilUsuario.aspx?id=" + eventoID + "&editar=ok");

        }

        protected void gosteiLinkButton_Click(object sender, EventArgs e)
        {

        }

        private void CarregarPublicacoes(int usuarioID)
        {
            PagedDataSource Pgs = new PagedDataSource();
            Pgs.AllowPaging = true; //Seta paginação no PagedDataSource
            Pgs.DataSource = PublicacaoBLL.ListarPublicacoesUsuario(usuarioID);
            Pgs.PageSize = 3; //Número de registros por página

            publicacoesRepeater.DataSource = Pgs;
            publicacoesRepeater.DataBind();

        }
        
        protected void txtCEP_TextChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "consultaCep();", true);
        }

        private void CarregaComboTipoEvento()
        {
            IEnumerable<TipoEvento> tipoEventos = TipoEventoBLL.ListarTipoEventos();
            cbxTipoEvento.Items.Add("");
            foreach (var item in tipoEventos)
            {
                cbxTipoEvento.Items.Add(new ListItem(item.Descricao, item.TipoEvento_ID.ToString()));
            }
            cbxTipoEvento.SelectedIndex = -1;
        }

        private void CarregarEvento(int id)
        {
            Evento evento = EventoBLL.BuscarEventoEdit(id);

            txtTitulo.Text = evento.Titulo;
            txtData.Text = evento.DataEvento.ToString();
            txtDesc.Text = evento.Descricao;
            cbxTipoEvento.SelectedValue = evento.mTipoEvento.ToString();
            txtEstado.Text = evento.Estado;
            txtLogradouro.Text = evento.Rua;
            txtBairro.Text = evento.Bairro;
            txtCEP.Text = evento.CEP;
            txtCidade.Text = evento.Cidade;
            txtNumero.Text = evento.Numero.ToString();
            txtComplemento.Text = evento.Complemento;


        }

        protected void fazerContatoButton_Click(object sender, EventArgs e)
        {
            try
            {
                //if (ValidarCampos())
                UsuarioBLL.FazerContato(Convert.ToInt32(idLabel.Text), txtAssunto.Text, txtdescricao.Text, imagemUploadtt.PostedFile.InputStream, imagemUploadtt.FileName);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "limparModal();", true);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "sucessoEnvioEmail();", true);

                //}
            }
            catch (Exception)
            {
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erroEnvioEmail();", true);
                //MensagemPadrao(false, "Ocorreu um problema durante a operação. ");
            }
        }

        protected void atualizarButton_Click(object sender, EventArgs e)
        {
            Evento eventoNovo = new Evento();
            Usuario usuario = (Usuario)Session["Usuario"];
            Evento eventoAnt = EventoBLL.BuscarEventoEdit(int.Parse(Request.QueryString["id"]));

            eventoNovo.Evento_ID = eventoAnt.Evento_ID;
            eventoNovo.Titulo = txtTitulo.Text;
            eventoNovo.DataEvento = DateTime.Parse(txtData.Text);
            eventoNovo.Descricao = txtDesc.Text;
            eventoNovo.mStatusEvento = 1;
            eventoNovo.mTipoEvento = int.Parse(cbxTipoEvento.SelectedValue);
            eventoNovo.mUsuario = usuario.Usuario_ID;
            eventoNovo.DataCriacao = eventoAnt.DataCriacao;
            eventoNovo.Estado = txtEstado.Text;
            eventoNovo.Bairro = txtBairro.Text;
            eventoNovo.CEP = txtCEP.Text;
            eventoNovo.Rua = txtLogradouro.Text;
            eventoNovo.Cidade = txtCidade.Text;
            eventoNovo.Complemento = txtComplemento.Text;
            eventoNovo.Numero = int.Parse(txtNumero.Text);

            EventoBLL.AtualizarEvento(eventoNovo);
        }

        protected void publicacoesRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                int publicacaoID = (int)DataBinder.Eval(e.Item.DataItem, "Publicacao_ID");

                ((Repeater)e.Item.FindControl("focoPublicacoesRepeater")).DataSource = PublicacaoBLL.ListarPublicacoesFoco(publicacaoID);
                ((Repeater)e.Item.FindControl("focoPublicacoesRepeater")).DataBind();

            }

        }
        protected void participarLinkButton_Click(object sender, EventArgs e)
        {
            var eventoID = ((LinkButton)sender).CommandArgument;
            Usuario usuario = (Usuario)Session["Usuario"];
            Participante participante = new Participante();

            participante.mEvento = int.Parse(eventoID);
            participante.mUsuario = usuario.Usuario_ID;
            participante.DataParticipacao = DateTime.Now;

            ParticipanteBLL.InserirParticipante(participante);
            CarregarRepeaters(usuario.Usuario_ID);
        }
    }
}