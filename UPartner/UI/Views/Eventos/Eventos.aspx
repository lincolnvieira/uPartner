<%@ Page Title="" Language="C#" MasterPageFile="~/Views/AppLayout/AppLayout.Master" AutoEventWireup="true" CodeBehind="Eventos.aspx.cs" Inherits="UI.Views.Eventos.Eventos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../Scripts/jquery-3.0.0.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-3.0.0.min.js" type="text/javascript"></script>

    <script type="text/javascript"> 

        function consultaCep() {

            console.log($("#ContentPlaceHolder1_txtCEP").val());

            if ($("#ContentPlaceHolder1_txtCEP").val() && $("#ContentPlaceHolder1_txtCEP").val() != "") {

                $.ajax({
                    url: 'https://viacep.com.br/ws/' + $("#ContentPlaceHolder1_txtCEP").val() + '/json/unicode/',
                    dataType: "json",
                    cache: false,
                }).done(function (data) {
                    console.log(data);
                    montarEndereco(data);

                }).fail(function (XMLHttpRequest, textStatus, errorThrown) {

                    alert("CEP digitado não existe. " + errorThrown);
                    $("#ContentPlaceHolder1_txtCEP").val('');
                    $("#ContentPlaceHolder1_txtCEP").focus();
                });
            }
        }

        function montarEndereco(data) {

            if (data && !data.erro) {

                if (data.logradouro && data.logradouro != "")
                    $("#ContentPlaceHolder1_txtLogradouro").val(data.logradouro);
                $("#ContentPlaceHolder1_txtLogradouro").prop("disabled", true);

                if (data.bairro && data.bairro != "")
                    $("#ContentPlaceHolder1_txtBairro").val(data.bairro);
                $("#ContentPlaceHolder1_txtBairro").prop("disabled", true);

                if (data.uf && data.uf != "")
                    $("#ContentPlaceHolder1_txtEstado").val(data.uf);
                $("#ContentPlaceHolder1_txtEstado").prop("disabled", true);

                if (data.localidade && data.localidade != "")
                    $("#ContentPlaceHolder1_txtCidade").val(data.localidade);
                $("#ContentPlaceHolder1_txtCidade").prop("disabled", true);

                if (data.complemento && data.complemento != "")
                    $("#ContentPlaceHolder1_txtComplemento").val(data.complemento);

                $("#ContentPlaceHolder1_txtNumero").focus();
            }
            else {
                alert("CEP digitado não existe. ");
                $("#ContentPlaceHolder1_txtCEP").val('');
                $("#ContentPlaceHolder1_txtCEP").focus();
            }
        }

    </script>

    <div class="container h-100">
        <div class="row align-items-center h-100">
            <div class="col-12 mx-auto">
                <div class="jumbotron h-100" style="background: #000521; position: relative; top: 2px; border-radius: 50px">
                    <%--Título.--%>
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                        <h1 style="color: #ffffff">Evento</h1>
                    </div>

                    <br />
                    <hr style="background-color: #ffffff" />
                    <br />

                    <%--Mensagem de Aviso para o usuário.--%>
                    <div class="form-group" style="display: none;" id="mensagemAviso" runat="server">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <div id="tipoDiv" runat="server">
                                <strong>Aviso:</strong>
                                <br />
                                <p id="modalMensagem" runat="server"></p>
                            </div>
                        </div>
                    </div>

                    <%--Mensagem de validação de campos.--%>
                    <div class="form-group" style="display: none;" id="mensagemErro" runat="server">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <div class="alert alert-danger">
                                <strong>Preencher o campo:</strong>
                                <br />
                                <asp:Label ID="errorEmail" runat="server" Text="* E-mail"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <br />

                    <%--Formulário.--%>

                    <h3 style="color: #ffffff">Sobre</h3>

                    <div class="row" style="color: #ffffff">
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
                            <span class="msg-obg">* </span>
                            <asp:Label ID="lblTitulo" runat="server" Text="Título: "></asp:Label>
                            <br />
                            <asp:TextBox ID="txtTitulo" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <span class="msg-obg">* </span>
                            <asp:Label ID="lblDataEvento" runat="server" Text="Data do evento:"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtData" runat="server" TextMode="DateTimeLocal" class="form-control required"></asp:TextBox>

                        </div>

                        <%--      <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <span class="msg-obg">* </span>
                            <asp:Label ID="lblHora" runat="server" Text="Hora do evento:"></asp:Label>
                            <br />
                            <asp:TextBox ID="cbxHora" runat="server" class="form-control required"></asp:TextBox>
                        </div>--%>


                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                            <span class="msg-obg">* </span>
                            <asp:Label ID="Label1" runat="server" Text="Tipo do Evento:"></asp:Label>
                            <br />
                            <asp:DropDownList ID="cbxTipoEvento" runat="server" class="form-control required"></asp:DropDownList>
                        </div>

                    </div>

                    <br />
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <span class="msg-obg">* </span>
                            <asp:Label ID="lblDesc" runat="server" Text="Descrição: "></asp:Label>
                            <br />
                            <asp:TextBox ID="txtDesc" TextMode="multiline" Columns="50" Rows="5" runat="server" class="form-control" Style="resize: none"></asp:TextBox>
                        </div>
                    </div>



                    <br />
                    <hr style="background-color: #ffffff" />
                    <br />

                    <h3 style="color: #ffffff">Local</h3>

                    <div class="row" style="color: #ffffff">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <span class="msg-obg">* </span>
                            <asp:Label ID="lblCEP" runat="server" Text="CEP:"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtCEP" runat="server" class="form-control" AutoPostBack="true" OnTextChanged="txtCEP_TextChanged"></asp:TextBox>
                        </div>
                    </div>

                    <br />
                    <div class="row" style="color: #ffffff">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <span class="msg-obg">* </span>
                            <asp:Label ID="lblLogradouro" runat="server" Text="Logradouro (Rua):"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtLogradouro" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <span class="msg-obg">* </span>
                            <asp:Label ID="lblBairro" runat="server" Text="Bairro:"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtBairro" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <span class="msg-obg">* </span>
                            <asp:Label ID="lblEstado" runat="server" Text="Estado:"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtEstado" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <br />
                    <div class="row" style="color: #ffffff">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <span class="msg-obg">* </span>
                            <asp:Label ID="lblCidade" runat="server" Text="Cidade:"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtCidade" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <span class="msg-obg">* </span>
                            <asp:Label ID="lblNumero" runat="server" Text="Número:"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtNumero" runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <asp:Label ID="lblComplemento" runat="server" Text="Complemento:"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtComplemento" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <br />
                    <div class="row" style="color: #ffffff">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <asp:Button ID="btnCriarEvento" runat="server" Text="Criar evento" class="btn btn-primary" OnClick="btn_CriarEvento_Click" />
                            <asp:Button ID="atualizarButton" runat="server" Text="Atualizar evento" class="btn btn-primary" OnClick="atualizarButton_Click" />
                            <asp:Button ID="btnVoltar" runat="server" Text="Voltar" class="btn btn-secondary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
