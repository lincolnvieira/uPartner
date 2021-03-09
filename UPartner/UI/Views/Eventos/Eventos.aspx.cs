using BLL.Negocio;
using DAL;
using DTO.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Views.Eventos
{
    public partial class Eventos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregaComboTipoEvento();
                if (Request["editar"] == "ok")
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    CarregarEvento(id);

                    atualizarButton.Visible = true;
                    atualizarButton.Enabled = true;

                    btnCriarEvento.Visible = false;
                    btnCriarEvento.Enabled = false;
                } 
                else if (Request["novo"] == "ok")
                {
                    atualizarButton.Visible = false;
                    atualizarButton.Enabled = false;

                    btnCriarEvento.Visible = true;
                    btnCriarEvento.Enabled = true;
                }

                
            }
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

        protected void btn_CriarEvento_Click(object sender, EventArgs e)
        {
            try
            {
                Evento evento = new Evento();
                Usuario usuario = (Usuario)Session["Usuario"];

                evento.Titulo = txtTitulo.Text;
                evento.DataEvento = DateTime.Parse(txtData.Text);
                evento.Descricao = txtDesc.Text;
                evento.mStatusEvento = 1;
                evento.mTipoEvento = int.Parse(cbxTipoEvento.SelectedValue);
                evento.mUsuario = usuario.Usuario_ID;
                evento.DataCriacao = DateTime.Now;
                evento.Estado = txtEstado.Text;
                evento.Bairro = txtBairro.Text;
                evento.Rua = txtLogradouro.Text;
                evento.CEP = txtCEP.Text;
                evento.Cidade = txtCidade.Text;
                evento.Complemento = txtComplemento.Text;
                evento.Numero = int.Parse(txtNumero.Text);

                EventoBLL.InserirEvento(evento);
                Response.Redirect("~/Views/Index/Index.aspx", false);
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void txtCEP_TextChanged(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyKey", "consultaCep();", true);
        }

        private void MensagemPadrao(bool resultado, string mensagem)
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

        protected void atualizarButton_Click(object sender, EventArgs e)
        {
            Evento evento = new Evento();
            Usuario usuario = (Usuario)Session["Usuario"];

            evento.Evento_ID = int.Parse(Request.QueryString["id"]);
            evento.Titulo = txtTitulo.Text;
            evento.DataEvento = DateTime.Parse(txtData.Text);
            evento.Descricao = txtDesc.Text;
            evento.mStatusEvento = 1;
            evento.mTipoEvento = int.Parse(cbxTipoEvento.SelectedValue);
            evento.mUsuario = usuario.Usuario_ID;
            evento.DataCriacao = DateTime.Now; //verificar
            evento.Estado = txtEstado.Text;
            evento.Bairro = txtBairro.Text;
            evento.CEP = txtCEP.Text;
            evento.Rua = txtLogradouro.Text;
            evento.Cidade = txtCidade.Text;
            evento.Complemento = txtComplemento.Text;
            evento.Numero = int.Parse(txtNumero.Text);

            EventoBLL.AtualizarEvento(evento);
            Response.Redirect("~/Views/Index/Index.aspx", false);
        }

        //private bool ValidarCampos()
        //{
        //    if (!(string.IsNullOrEmpty(txtEmail.Text)))
        //    {
        //        mensagemErro.Style.Add("display", "none");

        //        // Só colocar os campos que devem ser preenchidos
        //        txtEmail.Style.Add("border", "none");

        //        return true;
        //    }
        //    else
        //    {
        //        mensagemErro.Style.Add("display", "block");
        //        mensagemAviso.Style.Add("display", "none");

        //        // Só colocar os campos que devem ser preenchidos
        //        txtEmail.Style.Add("border", "1px solid red");

        //        return false;
        //    }
        //}

    }
}