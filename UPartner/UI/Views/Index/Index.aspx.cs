using BLL.Negocio;
using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Utilitarios;
using System.Web.Services;
using DTO.Visao;

namespace UI.Views.Index
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Usuario usuario = (Usuario)Session["Usuario"];
                if (Session["Usuario"] != null)
                {

                    CarregarDadosUsuario(usuario);
                    CarregarPublicacoes(usuario.Usuario_ID);
                    CarregarRepeaters(usuario);
                    CarregarComboFoco(usuario.Usuario_ID);
                }
                
                CarregaComboFocoEventoNovo(usuario.Usuario_ID);
                CarregaComboTipoEvento();
                CarregaComboTipoEventoNovo();
                CarregaComboTipoDenuncia();
                if (Request["editar"] == "ok")
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    CarregarEvento(id);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "novoEvento(2);", true);
                }


            }
        }

        protected void atualizarButton_Click(object sender, EventArgs e)
        {
            Evento eventoNovo = new Evento();
            EventoFoco eventoFoco;
            List<EventoFoco> lsEventoFoco = new List<EventoFoco>();
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

            foreach (ListItem li in cbxEventoFoco.Items)
            {
                if (li.Selected == true)
                {
                    eventoFoco = new EventoFoco
                    {
                        mEvento = eventoNovo.Evento_ID,
                        Foco = int.Parse(li.Value)
                    };
                    lsEventoFoco.Add(eventoFoco);
                }
            }
            EventoBLL.DeletarEventoFoco(eventoAnt.Evento_ID);
            EventoBLL.InserirEventoFoco(lsEventoFoco);

            Response.Redirect("~/Views/Index/Index.aspx", false);
        }

        private void CarregarEvento(int id)
        {
            Evento evento = EventoBLL.BuscarEventoEdit(id);

            txtTitulo.Text = evento.Titulo;
            txtData.Text = evento.DataEvento.ToLocalTime().ToString("yyyy-MM-ddTHH:mm");
            txtDesc.Text = evento.Descricao;
            cbxTipoEvento.SelectedValue = evento.mTipoEvento.ToString();
            txtEstado.Text = evento.Estado;
            txtLogradouro.Text = evento.Rua;
            txtBairro.Text = evento.Bairro;
            txtCEP.Text = evento.CEP;
            txtCidade.Text = evento.Cidade;
            txtNumero.Text = evento.Numero.ToString();
            txtComplemento.Text = evento.Complemento;

            CarregaComboFocoEvento(evento);

        }

        private void CarregarComboFoco(int usuarioID)
        {
            IEnumerable<V_AtuacoesUsuario> v_atuacoesUsuarios = UsuarioAtuacaoBLL.ListarAtuacoesUsuario(usuarioID);
            foreach (var item in v_atuacoesUsuarios)
            {
                focoListBox.Items.Add(new ListItem(item.Descricao, item.Atuacao_ID.ToString()));
            }
            focoListBox.SelectedIndex = -1;
        }

        protected void CarregarRepeaters(Usuario usuario = null)
        {
            if (usuario == null)
                usuario = (Usuario)Session["Usuario"];

            CarregarEventosParticipando(usuario.Usuario_ID);
            CarregarEventos(usuario.Usuario_ID);
            CarregarEventosCriado(usuario.Usuario_ID);
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

        private void CarregarEventos(int usuarioID)
        {
            eventosRepeater.DataSource = EventoBLL.ListarEventos(usuarioID);
            eventosRepeater.DataBind();
        }

        private void CarregarDadosUsuario(Usuario usuario)
        {
            nomeLabel.Text = usuario.Nome;
            sobrenomeLabel.Text = usuario.Sobrenome;
            tipoContaLabel.Text = TipoContaBLL.GetTipoConta(usuario.mTipoConta).Descricao;

            atuacoesRepeater.DataSource = UsuarioAtuacaoBLL.ListarAtuacoesUsuario(usuario.Usuario_ID);
            atuacoesRepeater.DataBind();

            string imgbase64 = Convert.ToBase64String(usuario.FotoPerfil);
            fotoPerfilImage.ImageUrl = string.Format("data:{0};base64,{1}", usuario.MimeType, imgbase64);
        }

        private void CarregarPublicacoes(int usuarioID)
        {
            PagedDataSource Pgs = new PagedDataSource();
            Pgs.AllowPaging = true; //Seta paginação no PagedDataSource
            Pgs.DataSource = PublicacaoBLL.ListarPublicacoes(usuarioID);
            Pgs.PageSize = 3; //Número de registros por página

            if (PaginaAtual >= Pgs.PageCount)
            {
                PaginaAtual--;
            }

            else if (PaginaAtual < 0)
            {
                PaginaAtual++;
            }
            else
            {
                Pgs.CurrentPageIndex = PaginaAtual;
                publicacoesRepeater.DataSource = Pgs;
                publicacoesRepeater.DataBind();
            }
        }

        public int PaginaAtual //Propriedade da página atual, colocada no viewstate
        {
            get
            {
               object o = this.ViewState["PaginaAtual"];
                if (o == null || (int)o < 0)
                {
                    return 0;
                }
                else
                {
                    return (int)o;
                }
            }
            set
            {
                this.ViewState["PaginaAtual"] = value;
            }
        }

        protected void btn_publicar_Click(object sender, EventArgs e)
        {
            FotoPublicacao fotoPublicacao = new FotoPublicacao();
            Publicacao publicacao = new Publicacao();
            Usuario usuario = (Usuario)Session["Usuario"];
            List<PublicacaoFoco> lsFocoPublicacao = new List<PublicacaoFoco>();
            PublicacaoFoco publicacaoFoco;

            publicacao.Titulo = tituloTextBox.Text;
            publicacao.Descricao = descricaoTextBox.Text;
            publicacao.DataPublicacao = DateTime.Now;
            publicacao.FlagAtiva = true;
            publicacao.mUsuario = usuario.Usuario_ID;

            PublicacaoBLL.InserirPublicacoes(publicacao);

            publicacao.Publicacao_ID = PublicacaoBLL.BuscarUltimoID(usuario.Usuario_ID);

            fotoPublicacao.mPublicacao = publicacao.Publicacao_ID;
            fotoPublicacao.Foto = imagemUploadtt.FileBytes;
            fotoPublicacao.MimeType = imagemUploadtt.PostedFile.ContentType;

            FotoPublicacaoBLL.InserirFotoPublicacao(fotoPublicacao);


            foreach (ListItem li in focoListBox.Items)
            {
                if (li.Selected == true)
                {
                    publicacaoFoco = new PublicacaoFoco
                    {
                        mPublicacao = publicacao.Publicacao_ID,
                        Foco = int.Parse(li.Value)
                    };
                    lsFocoPublicacao.Add(publicacaoFoco);
                }
            }

            PublicacaoFocoBLL.InserirPublicacaoFoco(lsFocoPublicacao);
            tituloTextBox.Text = "";
            descricaoTextBox.Text = "";
            focoListBox.ClearSelection();
            CarregarPublicacoes(usuario.Usuario_ID);
        }

        protected void lkbCadastrarEvento_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Eventos/Eventos.aspx?novo=ok");
        }

        protected void gosteiLinkButton_Click(object sender, EventArgs e)
        {

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

        private void CarregaComboTipoEventoNovo()
        {
            IEnumerable<TipoEvento> tipoEventos = TipoEventoBLL.ListarTipoEventos();
            cbxTipoEventoNovo.Items.Add("");
            foreach (var item in tipoEventos)
            {
                cbxTipoEventoNovo.Items.Add(new ListItem(item.Descricao, item.TipoEvento_ID.ToString()));
            }
            cbxTipoEventoNovo.SelectedIndex = -1;
        }

        private void CarregaComboTipoDenuncia()
        {
            IEnumerable<TipoDenuncia> tipoDenuncias = TipoDenunciaBLL.ListarTipoDenuncias();
            cbxTipoDenuncia.Items.Add("");
            foreach (var item in tipoDenuncias)
            {
                cbxTipoDenuncia.Items.Add(new ListItem(item.Descricao, item.TipoDenuncia_ID.ToString()));
            }
            cbxTipoDenuncia.SelectedIndex = -1;
        }


        private void CarregaComboFocoEvento(Evento evento)
        {

            IEnumerable<V_AtuacoesUsuario> inEventoFoco = UsuarioAtuacaoBLL.ListarAtuacoesUsuario(evento.mUsuario);
            foreach (var item in inEventoFoco)
            {
                cbxEventoFoco.Items.Add(new ListItem(item.Descricao, item.Atuacao_ID.ToString()));
            }
            cbxEventoFoco.SelectedIndex = -1;

            IEnumerable<V_EventosFoco> inEventoFocoAux = EventoBLL.ListarEventoFoco(evento.Evento_ID);
                        
            foreach (ListItem li in cbxEventoFoco.Items)
            {
                foreach (var item in inEventoFocoAux)
                {
                    if (li.Value.Equals(item.Foco.ToString()))
                    {
                        li.Selected = true;
                    }
                }
            }
        }


        private void CarregaComboFocoEventoNovo(int usuarioID)
        {
            IEnumerable<V_AtuacoesUsuario> inEventoFoco = UsuarioAtuacaoBLL.ListarAtuacoesUsuario(usuarioID);
            foreach (var item in inEventoFoco)
            {
                cbxEventoFocoNovo.Items.Add(new ListItem(item.Descricao, item.Atuacao_ID.ToString()));
            }
            cbxEventoFocoNovo.SelectedIndex = -1;
        }

        protected void btn_CriarEvento_Click(object sender, EventArgs e)
        {
            try
            {
                Evento evento = new Evento();
                Usuario usuario = (Usuario)Session["Usuario"];
                EventoFoco eventoFoco;
                List<EventoFoco> lsEventoFoco = new List<EventoFoco>();

                evento.Titulo = txtTituloNovo.Text;
                evento.DataEvento = DateTime.Parse(txtDataNovo.Text);
                evento.Descricao = txtDescNovo.Text;
                evento.mStatusEvento = 1;
                evento.mUsuario = usuario.Usuario_ID;
                evento.mTipoEvento = int.Parse(cbxTipoEventoNovo.SelectedValue);
                evento.DataCriacao = DateTime.Now;
                evento.Estado = txtEstadoNovo.Text;
                evento.Bairro = txtBairroNovo.Text;
                evento.Rua = txtLogradouroNovo.Text;
                evento.CEP = txtCEPNovo.Text;
                evento.Cidade = txtCidadeNovo.Text;
                evento.Complemento = txtComplementoNovo.Text;
                evento.Numero = int.Parse(txtNumeroNovo.Text);

                EventoBLL.InserirEvento(evento);
                evento.Evento_ID = EventoBLL.BuscarUltimoID(usuario.Usuario_ID);
                foreach (ListItem li in cbxEventoFocoNovo.Items)
                {
                    if (li.Selected == true)
                    {
                        eventoFoco = new EventoFoco
                        {
                            mEvento = evento.Evento_ID,
                            Foco = int.Parse(li.Value)
                        };
                        lsEventoFoco.Add(eventoFoco);
                    }
                }
                EventoBLL.InserirEventoFoco(lsEventoFoco);
                Response.Redirect("~/Views/Index/Index.aspx", false);
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void denunciarLinkButton_Click(object sender, EventArgs e)
        {
            Denuncia denuncia = new Denuncia();
            Usuario usuario = (Usuario)Session["Usuario"];

            try { 
                denuncia.mUsuario = usuario.Usuario_ID;
                denuncia.mPublicacao = int.Parse(idPublicacaoLabel.Text);
                denuncia.mTipoDenuncia = int.Parse(cbxTipoDenuncia.SelectedValue);
                denuncia.DataDenuncia = DateTime.Now;

                DenunciaBLL.Inserir(denuncia);

                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKeys", "fecharModal();", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "modalSucesso();", true);
            }
            catch {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKeys", "fecharModal();", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "modalErro();", true);
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
            CarregarRepeaters();
        }

        protected void lkbDeslogar_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Views/Login/Login.aspx", false);
        }

        protected void cancelarLinkButton_Click(object sender, EventArgs e)
        {
            var eventoID = ((LinkButton)sender).CommandArgument;
            Usuario usuario = (Usuario)Session["Usuario"];
            ParticipanteBLL.CancelarParticipacao(int.Parse(eventoID), usuario.Usuario_ID);
            CarregarRepeaters();

        }

        protected void editarLinkButton_Click(object sender, EventArgs e)
        {
            var eventoID = ((LinkButton)sender).CommandArgument;
            Response.Redirect("~/Views/Index/Index.aspx?id=" + eventoID + "&editar=ok");

        }


        protected void lkbVisualizarPerfil_Click(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["Usuario"];
            Response.Redirect("~/Views/User/PerfilUsuario.aspx?id=" + usuario.Usuario_ID + "&MeuPerfil=ok");
        }

        protected void lkbVisualizarOutroPerfil_Click(object sender, EventArgs e)
        {
            var usuarioID = ((LinkButton)sender).CommandArgument;
            Response.Redirect("~/Views/User/PerfilUsuario.aspx?id=" + usuarioID + "&OutroPerfil=ok");
        }

        protected void anteriorLinkButton_Click(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["Usuario"];
            PaginaAtual--;
            CarregarPublicacoes(usuario.Usuario_ID);
        }

        protected void proximoLinkButton_Click(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["Usuario"];
            PaginaAtual++;
            CarregarPublicacoes(usuario.Usuario_ID);
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

        protected void eventosCriadoRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                int eventoID = (int)DataBinder.Eval(e.Item.DataItem, "Evento_ID");

                ((Repeater)e.Item.FindControl("focoEvCriadosRepeater")).DataSource = EventoBLL.ListarEventoFoco(eventoID);
                ((Repeater)e.Item.FindControl("focoEvCriadosRepeater")).DataBind();

            }
        }

        protected void eventosParticipandoRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                int eventoID = (int)DataBinder.Eval(e.Item.DataItem, "Evento_ID");

                ((Repeater)e.Item.FindControl("focoEvParticipandoRepeater")).DataSource = EventoBLL.ListarEventoFoco(eventoID);
                ((Repeater)e.Item.FindControl("focoEvParticipandoRepeater")).DataBind();

            }
        }

        protected void eventosRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                int eventoID = (int)DataBinder.Eval(e.Item.DataItem, "Evento_ID");

                ((Repeater)e.Item.FindControl("focoEvSugestoesRepeater")).DataSource = EventoBLL.ListarEventoFoco(eventoID);
                ((Repeater)e.Item.FindControl("focoEvSugestoesRepeater")).DataBind();

            }
        }
        protected void gosteiLinkButtons(object sender, EventArgs e)
        {
            try
            {
                UsuarioBLL.FazerContato(Convert.ToInt32(UsuarioID.Text), txtAssunto.Text, txtdescricao.Text, FileUpload1.PostedFile.InputStream, FileUpload1.FileName);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "limparModal();", true);
            }
            catch (Exception)
            {
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "erroEnvioEmail();", true);
                //MensagemPadrao(false, "Ocorreu um problema durante a operação. ");
            }
        }
    }
}
