<%@ Page Title="" Language="C#" MasterPageFile="~/Views/AppLayout/AppLayout.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="UI.Views.Index.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/Index/Index.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-3.4.1.min.js"></script>
    <!-- NECESSARIO NO INDEX-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.0.4/popper.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/popper.min.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function getName(flg_imagem) {
            if (flg_imagem == 1) {
                var fileName = $("#ContentPlaceHolder1_FileUpload1").val().split("\\").pop();
                $("#ContentPlaceHolder1_FileUpload1").siblings(".custom-file-label").addClass("selected").html(fileName);
            } else {
                var fileName = $("#ContentPlaceHolder1_imagemUploadtt").val().split("\\").pop();
                $("#ContentPlaceHolder1_imagemUploadtt").siblings(".custom-file-label").addClass("selected").html(fileName);
            }
        }

        function limparModal() {
            $("#ContentPlaceHolder1_txtAssunto").val("");
            $("#ContentPlaceHolder1_txtdescricao").val("");
            $("#ContentPlaceHolder1_imagemUploadtt").replaceWith($("#ContentPlaceHolder1_imagemUploadtt").val('').clone(true));
            $('#ContentPlaceHolder1_btnEnviar').prop('disabled', true);
        }

        function VerificaTamanhoArquivo() {

            var fi = document.getElementById('ContentPlaceHolder1_imagemUploadtt');
            var maxFileSize = 4194304; // 4MB -> 4 * 1024 * 1024

            if (fi.files.length > 0) {

                for (var i = 0; i <= fi.files.length - 1; i++) {

                    var fsize = fi.files.item(i).size;

                    if (fsize > maxFileSize) {
                        $("#alert-danger").prop('hidden', false);
                        $("#tamanho-arquivo").prop('hidden', false);
                        $("#lbl_file").prop('hidden', false);
                        $('#ContentPlaceHolder1_btnEnviar').prop('disabled', true);

                        //fi.value = null;
                    } else {
                        $("#alert-danger").prop('hidden', true);
                        $("#tamanho-arquivo").prop('hidden', true);
                        $("#lbl_file").prop('hidden', true);
                        $('#ContentPlaceHolder1_btnEnviar').prop('disabled', false);
                    }
                }
            }
        }

        function limparModalDenuncia() {
            $("#ContentPlaceHolder1_txtDescricaoDenuncia").val("");
            $("#ContentPlaceHolder1_cbxTipoDenuncia").val("");
            $("#ContentPlaceHolder1_idPublicacaoLabel").val("");

        }

        function modalSubmeter(ID) {
            $("#modalSubmeter").modal({
                show: true
            });

            $("#ContentPlaceHolder1_UsuarioID").val(ID);
        }

        function fecharModal() {
            $("#btnVoltarModal").click();
        }

        function modalErro() {
            $("#modalErroDenunciar").modal({
                show: true
            });
        }

        function modalSucesso() {
            $("#modalsucessodenunciar").modal({
                show: true
            });
        }

        function denunciarModal(ID) {
            $("#modalDenunciar").modal({
                show: true
            });

            $("#ContentPlaceHolder1_idPublicacaoLabel").val(ID);
        }

        function getID() {
            var teste = document.getElementById(ContentPlaceHolder1_publicacoesRepeater_gosteiLinkButton_0);

            console.log(teste);
        }

        function verificarCampos() {
            var TituloNovo = $("#ContentPlaceHolder1_txtTituloNovo").val();
            var DataEventoNovo = $("#ContentPlaceHolder1_txtDataNovo").val();
            var DescricaoNovo = $("#ContentPlaceHolder1_txtDescNovo").val();
            var CEPNovo = $("#ContentPlaceHolder1_txtCEPNovo").val();
            var LogradouroNovo = $("#ContentPlaceHolder1_txtLogradouroNovo").val();
            var BairroNovo = $("#ContentPlaceHolder1_txtBairroNovo").val();
            var EstadoNovo = $("#ContentPlaceHolder1_txtEstadoNovo").val();
            var CidadeNovo = $("#ContentPlaceHolder1_txtCidadeNovo").val();
            var NumeroNovo = $("#ContentPlaceHolder1_txtNumeroNovo").val();
            var TipoEventoNovo = $("#ContentPlaceHolder1_cbxTipoEventoNovo").val();
            var eventoFocoNovo = $("#ContentPlaceHolder1_cbxEventoFocoNovo").val();

            if (TituloNovo != "" && DataEventoNovo != "" && DescricaoNovo != "" && CEPNovo != "" && LogradouroNovo != "" && BairroNovo != "" && EstadoNovo != "" && CidadeNovo != "" && NumeroNovo != "" && TipoEventoNovo != "" && eventoFocoNovo != "") {
                $("#ContentPlaceHolder1_btnCriarEvento").prop('disabled', false);
            }
        }

        function consultaCep() {

            console.log($("#ContentPlaceHolder1_txtCEP").val());

            if ($("#ContentPlaceHolder1_txtCEP").val() && $("#ContentPlaceHolder1_txtCEP").val() != "") {

                $.ajax({
                    url: 'https://viacep.com.br/ws/' + $("#ContentPlaceHolder1_txtCEP").val() + '/json/unicode/',
                    dataType: "json",
                    cache: false,
                }).done(function (data) {
                    //console.log(data);
                    montarEndereco(data);

                }).fail(function (XMLHttpRequest, textStatus, errorThrown) {

                    alert("CEP digitado não existe. " + errorThrown);
                    $("#ContentPlaceHolder1_txtCEP").val('');
                    $("#ContentPlaceHolder1_txtCEP").focus();
                });
            }
        }

        function consultaCepNovo() {
            console.log($("#ContentPlaceHolder1_txtCEPNovo").val());

            if ($("#ContentPlaceHolder1_txtCEPNovo").val() && $("#ContentPlaceHolder1_txtCEPNovo").val() != "") {

                $.ajax({
                    url: 'https://viacep.com.br/ws/' + $("#ContentPlaceHolder1_txtCEPNovo").val() + '/json/unicode/',
                    dataType: "json",
                    cache: false,
                }).done(function (data) {
                    montarEnderecoNovo(data);
                    console.log(data);

                }).fail(function (errorThrown) {

                    alert("CEP digitado não existe. " + errorThrown);
                    $("#ContentPlaceHolder1_txtCEP").val('');
                    $("#ContentPlaceHolder1_txtCEP").focus();
                });
            }
        }

        function alterarURL() {
            window.history.pushState("Publicação", "UPartner", "/UPartner/Views/Index/Index.aspx"); // /UPartner/Views/index/Index.aspx -> ambiente Lincoln 
        }

        window.onload = function () {
            $(".body").css('backgroud-color', '#eeeeee');
        };

        function abrirModal() {
            $("#modalAlterar").modal({
                show: true
            });
        }

        function novoEvento(flag) {

            if (flag == 1) {
                $("#ContentPlaceHolder1_txtTitulo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtData").prop("hidden", true);
                $("#ContentPlaceHolder1_txtDesc").prop("hidden", true);
                $("#ContentPlaceHolder1_cbxTipoEvento").prop("hidden", true);
                $("#ContentPlaceHolder1_cbxEventoFoco").prop("hidden", true);
                $("#ContentPlaceHolder1_atualizarButton").prop("hidden", true);
                $("#ContentPlaceHolder1_txtCEP").prop("hidden", true);
                $("#ContentPlaceHolder1_txtLogradouro").prop("hidden", true);
                $("#ContentPlaceHolder1_txtBairro").prop("hidden", true);
                $("#ContentPlaceHolder1_txtEstado").prop("hidden", true);
                $("#ContentPlaceHolder1_txtCidade").prop("hidden", true);
                $("#ContentPlaceHolder1_txtNumero").prop("hidden", true);
                $("#ContentPlaceHolder1_txtComplemento").prop("hidden", true);
                $("#ContentPlaceHolder1_btnCriarEvento").prop("hidden", false);
                $("#EventoFoco").prop("hidden", true);

                $("#ContentPlaceHolder1_txtTituloNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtDataNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtDescNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_cbxTipoEventoNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_cbxEventoFocoNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtCEPNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtLogradouroNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtBairroNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtEstadoNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtCidadeNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtNumeroNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtComplementoNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_btnCriarEvento").prop("hidden", false);
                $("#EventoFocoNovo").prop("hidden", false);

                alterarURL();
                abrirModal();

            } else {
                $("#ContentPlaceHolder1_txtTituloNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtDataNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtDescNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_cbxTipoEventoNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_cbxEventoFocoNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtCEPNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtLogradouroNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtBairroNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtEstadoNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtCidadeNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtNumeroNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtComplementoNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_btnCriarEvento").prop("hidden", true);
                $("#EventoFocoNovo").prop("hidden", true);

                $("#ContentPlaceHolder1_txtTitulo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtData").prop("hidden", false);
                $("#ContentPlaceHolder1_txtDesc").prop("hidden", false);
                $("#ContentPlaceHolder1_cbxTipoEvento").prop("hidden", false);
                $("#ContentPlaceHolder1_cbxAtuacao").prop("hidden", false);
                $("#ContentPlaceHolder1_atualizarButton").prop("hidden", false);
                $("#ContentPlaceHolder1_txtCEP").prop("hidden", false);
                $("#ContentPlaceHolder1_txtLogradouro").prop("hidden", false);
                $("#ContentPlaceHolder1_txtBairro").prop("hidden", false);
                $("#ContentPlaceHolder1_txtEstado").prop("hidden", false);
                $("#ContentPlaceHolder1_txtCidade").prop("hidden", false);
                $("#ContentPlaceHolder1_txtNumero").prop("hidden", false);
                $("#ContentPlaceHolder1_txtComplemento").prop("hidden", false);
                $("#ContentPlaceHolder1_btnCriarEvento").prop("hidden", true);
                $("#EventoFoco").prop("hidden", false);

                alterarURL();
                abrirModal();

            }
        }

        function consultarEvento(id) {
            console.log(id);

            $.ajax({
                type: "POST",
                url: "Index.aspx/SayHello",
                data: JSON.stringify(id),
                contentType: "application/json: charset=utf-8",
                dataType: "json",
                success: function (result) {
                    //do something
                    alert("SUCCESS = " + result.d);
                    console.log(result);
                },
                error: function (xmlhttprequest, textstatus, errorthrown) {
                    alert(" conection to the server failed ");
                    console.log("error: " + errorthrown);
                }
            });
        }

        function montarEndereco(data) {

            if (data && !data.erro) {

                if (data.logradouro && data.logradouro != "") {

                    $("#ContentPlaceHolder1_txtLogradouro").val(data.logradouro);

                    $("#ContentPlaceHolder1_txtLogradouro").prop("disabled", true);
                }

                if (data.bairro && data.bairro != "") {
                    $("#ContentPlaceHolder1_txtBairro").val(data.bairro);

                    $("#ContentPlaceHolder1_txtBairro").prop("disabled", true);
                }

                if (data.uf && data.uf != "") {
                    $("#ContentPlaceHolder1_txtEstado").val(data.uf);

                    $("#ContentPlaceHolder1_txtEstado").prop("disabled", true);
                }

                if (data.localidade && data.localidade != "") {
                    $("#ContentPlaceHolder1_txtCidade").val(data.localidade);

                    $("#ContentPlaceHolder1_txtCidade").prop("disabled", true);
                }

                if (data.complemento && data.complemento != "") {
                    $("#ContentPlaceHolder1_txtComplemento").val(data.complemento);
                }
                $("#ContentPlaceHolder1_txtNumero").focus();
            }
            else {
                alert("CEP digitado não existe. ");
                $("#ContentPlaceHolder1_txtCEP").val('');
                $("#ContentPlaceHolder1_txtCEP").focus();
            }
        }

        function montarEnderecoNovo(data) {

            if (data && !data.erro) {

                if (data.logradouro && data.logradouro != "") {
                    $("#ContentPlaceHolder1_txtLogradouroNovo").val(data.logradouro);

                    $("#ContentPlaceHolder1_txtLogradouroNovo").prop("disabled", true);
                }

                if (data.bairro && data.bairro != "") {
                    $("#ContentPlaceHolder1_txtBairroNovo").val(data.bairro);

                    $("#ContentPlaceHolder1_txtBairroNovo").prop("disabled", true);
                }

                if (data.uf && data.uf != "") {
                    $("#ContentPlaceHolder1_txtEstadoNovo").val(data.uf);

                    $("#ContentPlaceHolder1_txtEstadoNovo").prop("disabled", true);
                }

                if (data.localidade && data.localidade != "") {
                    $("#ContentPlaceHolder1_txtCidadeNovo").val(data.localidade);

                    $("#ContentPlaceHolder1_txtCidadeNovo").prop("disabled", true);
                }

                if (data.complemento && data.complemento != "") {
                    $("#ContentPlaceHolder1_txtComplementoNovo").val(data.complemento);
                }
                $("#ContentPlaceHolder1_txtNumeroNovo").focus();
            }
            else {
                alert("CEP digitado não existe. ");
                $("#ContentPlaceHolder1_txtCEPNovo").val('');
                $("#ContentPlaceHolder1_txtCEPNovo").focus();
            }
        }

        function verificarCamposPublicacao() {

            var TituloPublicacao = $("#ContentPlaceHolder1_tituloTextBox").val();
            var DescricaoPublicacao = $("#ContentPlaceHolder1_descricaoTextBox").val();
            var focoPublicacao = $("#ContentPlaceHolder1_focoListBox").val();

            if (TituloPublicacao != "" && DescricaoPublicacao != "" && focoPublicacao != "") {
                $("#ContentPlaceHolder1_btn_publicar").prop('disabled', false);
            } else {
                $("#ContentPlaceHolder1_btn_publicar").prop('disabled', true);
            }
        }
    </script>
    <div class="container-fluid gedf-wrapper" style="background-color: #eeeeee !important">
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <center>                   
                        <asp:Image ID="fotoPerfilImage" runat="server" Width="200px" Height="200px" Style="border-radius: 100px" />

                        <hr />
                        <div class="h5">
                            <asp:Label ID="nomeLabel" runat="server" Text=""></asp:Label>
                            <asp:Label ID="sobrenomeLabel" runat="server" Text=""></asp:Label>
                        </div>
                        </center>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="h6 text-muted">
                                <asp:Label ID="Label17" runat="server" Text="Tipo de Conta"></asp:Label>
                            </div>
                            <div class="h5">
                                <asp:Label ID="tipoContaLabel" runat="server" Text=""></asp:Label>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="h6 text-muted">
                                <asp:Label ID="Label18" runat="server" Text="Área de Atuação"></asp:Label>
                            </div>
                            <asp:Repeater runat="server" ID="atuacoesRepeater">
                                <ItemTemplate>
                                    <div class="">
                                        <asp:Label ID="tipocaoLabel" runat="server" Text='<%# Eval("Descricao") %>' CssClass="badge badge-primary"></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </li>
                        <li class="list-group-item">
                            <asp:LinkButton ID="lkbEditarPerfil" CssClass="card-link" runat="server" OnClick="lkbVisualizarPerfil_Click">Edite seu perfil</asp:LinkButton><br />
                            <button type="button" class="btn btn-link" style="padding-left: 0px;" data-toggle="modal" data-target=".bd-example-modal-lg" onclick="novoEvento(1)">Criar Evento</button><br />
                            <asp:LinkButton ID="lkbDeslogar" CssClass="card-link" runat="server" OnClick="lkbDeslogar_Click">Logout</asp:LinkButton>
                        </li>
                    </ul>
                    <button type="button" class="btn btn-link" style="padding-left: 0px;" id="teste" data-toggle="modal" data-target=".bd-example-modal-lg" onclick="novoEvento(2)" hidden="hidden">Alterar Evento</button><br />

                </div>
            </div>
            <div class="col-md-5 gedf-main">

                <div class="card gedf-card">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Publicacao</a>
                            </li>
                            <%--                            <li class="nav-item">
                                <a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">Imagem</a>
                            </li>--%>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                <div class="form-group">
                                    <label class="sr-only" for="message">post</label>
                                    <asp:TextBox placeholder="Qual é o titulo do seu projeto ?" CssClass="form-control" onBlur="verificarCamposPublicacao()" Style="position: relative; top: 10px; max-width: 100%; width: 100%; resize: none;" ID="tituloTextBox" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:TextBox placeholder="Descreva o seu projeto. Os investidores levam em conta uma boa descrição" onBlur="verificarCamposPublicacao()" CssClass="form-control" Style="position: relative; top: 10px; max-width: 100%; width: 100%; resize: none;" ID="descricaoTextBox" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="Label6" runat="server" Text="Selecione as áreas em que o seu projeto se enquadra:"></asp:Label>
                                    <br />
                                    <asp:ListBox ID="focoListBox" SelectionMode="Multiple" runat="server" class="form-group selectpicker"></asp:ListBox>
                                    <br />
                                    <br />
                                    <div class="custom-file">
                                        <asp:FileUpload CssClass="custom-file-input" onChange="getName(2)" ID="imagemUploadtt" runat="server" />
                                        <label class="custom-file-label" for="imagemUploadtt">Escolha uma foto para divulgar se projeto</label>
                                    </div>
                                </div>
                            </div>

                            <%--                            <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                <div class="form-group">
                                    <div class="custom-file">
                                        <asp:FileUpload CssClass="custom-file-input" ID="imagemUploadtt" runat="server" />
                                        <label class="custom-file-label" for="imagemUploadtt">Escolha seu arquivo</label>
                                    </div>
                                </div>
                                <div class="py-4"></div>
                            </div>--%>
                        </div>
                        <div class="btn-toolbar justify-content-between">
                            <div class="btn-group">
                                <asp:Button ID="btn_publicar" runat="server" Text="Publicar" CssClass="btn btn-primary" OnClick="btn_publicar_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Repeater ID="publicacoesRepeater" runat="server" OnItemDataBound="publicacoesRepeater_ItemDataBound">
                            <ItemTemplate>
                                <div class="card gedf-card">
                                    <div class="card-header">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="mr-2">
                                                    <img class="rounded-circle" width="45" src='<%# "data:" + Eval("MimeType_Perfil")+";base64," + Convert.ToBase64String((byte[]) Eval("Foto_Perfil"))%>' />
                                                </div>
                                                <div class="ml-2">
                                                    <div class="h5 m-0">
                                                        <asp:LinkButton OnClick="lkbVisualizarOutroPerfil_Click" CommandArgument='<%# Eval("Usuario_ID") %>' runat="server" ID="Label1" Text='<%# string.Concat(Eval("Nome"), " ", Eval("Sobrenome")) %> '></asp:LinkButton>
                                                        <%--<asp:linkbutton onClick="lkbVisualizarOutroPerfil_Click" CommandArgument='<%# Eval("Usuario_ID") %>' runat="server" ID="Label2" Text='<%# Eval("Sobrenome") %>'></asp:linkbutton>--%>
                                                    </div>
                                                    <asp:Label ID="Label21" runat="server" Text='<%# Eval("TipoConta") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div>
                                                <div class="dropdown">
                                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <i class="fa fa-ellipsis-h" onclick="denunciarModal('<%# Eval("Publicacao_ID") %>')"></i>
                                                    </button>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="card-body">
                                        <div class="text-muted h7 mb-2">
                                            <i class="fa fa-clock-o"></i>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Data_Publicacao") %>'></asp:Label>
                                        </div>
                                        <a class="card-link" href="#">
                                            <h5 class="card-title">
                                                <asp:Label ID="Label22" runat="server" Text='<%# Eval("Titulo") %>'></asp:Label></h5>
                                        </a>

                                        <p class="card-text">
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Descricao") %>'></asp:Label>
                                        </p>
                                        <img src='<%# "data:" + Eval("MimeType_Publicacao")+";base64," + Convert.ToBase64String((byte[]) Eval("Foto_Publicacao"))%>' width="385px" height="300px" />
                                        <br />
                                        <br />
                                        <div>
                                            <asp:Repeater ID="focoPublicacoesRepeater" runat="server">
                                                <ItemTemplate>
                                                    <span class="badge badge-primary">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Descricao") %>'></asp:Label>
                                                    </span>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <a onclick="modalSubmeter('<%# Eval("Usuario_ID") %>')" style="color: #007bff">
                                            <i class="fa fa-comment"></i>
                                            Entrar em Contato
                                        </a>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="anteriorLinkButton" runat="server" OnClick="anteriorLinkButton_Click">Anterior</asp:LinkButton>
                                <asp:LinkButton ID="proximoLinkButton" runat="server" OnClick="proximoLinkButton_Click">Próximo</asp:LinkButton>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-4">
                <div class="card gedf-card">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="sugestoes-tab" data-toggle="tab" href="#sugestoes" role="tab" aria-controls="sugestoes" aria-selected="true">Sugestões</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="participando-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#participando">Participando</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="criados-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#meuseventos">Meus Eventos</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent1">

                            <%--Aba sugestões--%>
                            <div class="tab-pane fade show active" id="sugestoes" role="tabpanel" aria-labelledby="sugestoes-tab">
                                <asp:Repeater ID="eventosRepeater" runat="server" OnItemDataBound="eventosRepeater_ItemDataBound">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Evento_ID") %>' />
                                        <h5 class="card-title">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Titulo") %>'></asp:Label></h5>
                                        <h6 class="card-subtitle mb-2 text-muted">
                                            <asp:Label ID="Label19" runat="server" Text='<%# Eval("TipoEvento") %>'></asp:Label></h6>
                                        <p class="card-text">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Descricao") %>'></asp:Label>
                                        </p>
                                        <div class="text-muted h7 mb-2">
                                            <i class="fa fa-clock-o"></i>
                                            Criando em:
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("DataCriacao") %>'>
                                            </asp:Label>
                                        </div>
                                        <div class="text-muted h7 mb-2">
                                            <i class="fa fa-clock-o"></i>
                                            Data do evento:
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("DataEvento") %>'>
                                            </asp:Label>
                                        </div>
                                        <asp:Label ID="Label8" runat="server" Text="Local: "></asp:Label>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("Rua") %>'></asp:Label>,
                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("Numero") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("Cidade") %>'></asp:Label>
                                        - 
                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>,
                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("CEP") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label16" runat="server" Text="Criado por: "></asp:Label>
                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
                                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("Sobrenome") %>'></asp:Label>
                                        <br />
                                        <div>
                                            <asp:Repeater ID="focoEvSugestoesRepeater" runat="server">
                                                <ItemTemplate>
                                                    <span class="badge badge-primary">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Descricao") %>'></asp:Label>
                                                    </span>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <br />
                                        <asp:LinkButton
                                            CssClass="card-link"
                                            ID="participarLinkButton"
                                            runat="server"
                                            OnClick="participarLinkButton_Click"
                                            CommandArgument='<%# Eval("Evento_ID") %>'>
                                            Participar
                                        </asp:LinkButton>
                                        <hr />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                            <%--Aba Participando--%>
                            <div class="tab-pane fade" id="participando" role="tabpanel" aria-labelledby="participando-tab">
                                <asp:Repeater ID="eventosParticipandoRepeater" runat="server" OnItemDataBound="eventosParticipandoRepeater_ItemDataBound">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Evento_ID") %>' />
                                        <h5 class="card-title">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Titulo") %>'></asp:Label></h5>
                                        <h6 class="card-subtitle mb-2 text-muted">
                                            <asp:Label ID="Label19" runat="server" Text='<%# Eval("TipoEvento") %>'></asp:Label></h6>
                                        <p class="card-text">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Descricao") %>'></asp:Label>
                                        </p>
                                        <div class="text-muted h7 mb-2">
                                            <i class="fa fa-clock-o"></i>
                                            Criando em:
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("DataCriacao") %>'>
                                            </asp:Label>
                                        </div>
                                        <div class="text-muted h7 mb-2">
                                            <i class="fa fa-clock-o"></i>
                                            Data do evento:
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("DataEvento") %>'>
                                            </asp:Label>
                                        </div>
                                        <asp:Label ID="Label8" runat="server" Text="Local: "></asp:Label>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("Rua") %>'></asp:Label>,
                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("Numero") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("Cidade") %>'></asp:Label>
                                        - 
                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>,
                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("CEP") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label16" runat="server" Text="Criado por: "></asp:Label>
                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
                                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("Sobrenome") %>'></asp:Label>
                                        <br />
                                        <div>
                                            <asp:Repeater ID="focoEvParticipandoRepeater" runat="server">
                                                <ItemTemplate>
                                                    <span class="badge badge-primary">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Descricao") %>'></asp:Label>
                                                    </span>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <br />
                                        <asp:LinkButton
                                            CssClass="card-link"
                                            ID="cancelarLinkButton"
                                            runat="server"
                                            OnClick="cancelarLinkButton_Click"
                                            CommandArgument='<%# Eval("Evento_ID") %>'>
                                            Cancelar Participação
                                        </asp:LinkButton>
                                        <hr />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                            <%--Aba Meus Eventos--%>
                            <div class="tab-pane fade" id="meuseventos" role="tabpanel" aria-labelledby="criados-tab">
                                <asp:Repeater ID="eventosCriadoRepeater" runat="server" OnItemDataBound="eventosCriadoRepeater_ItemDataBound">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Evento_ID") %>' />
                                        <h5 class="card-title">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Titulo") %>'></asp:Label></h5>
                                        <h6 class="card-subtitle mb-2 text-muted">
                                            <asp:Label ID="Label19" runat="server" Text='<%# Eval("TipoEvento") %>'></asp:Label></h6>
                                        <p class="card-text">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Descricao") %>'></asp:Label>
                                        </p>
                                        <div class="text-muted h7 mb-2">
                                            <i class="fa fa-clock-o"></i>
                                            Criando em:
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("DataCriacao") %>'>
                                            </asp:Label>
                                        </div>
                                        <div class="text-muted h7 mb-2">
                                            <i class="fa fa-clock-o"></i>
                                            Data do evento:
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("DataEvento") %>'>
                                            </asp:Label>
                                        </div>
                                        <asp:Label ID="Label8" runat="server" Text="Local: "></asp:Label>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("Rua") %>'></asp:Label>,
                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("Numero") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("Cidade") %>'></asp:Label>
                                        - 
                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>,
                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("CEP") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label16" runat="server" Text="Criado por: "></asp:Label>
                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
                                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("Sobrenome") %>'></asp:Label>
                                        <br />
                                        <div>
                                            <asp:Repeater ID="focoEvCriadosRepeater" runat="server">
                                                <ItemTemplate>
                                                    <span class="badge badge-primary">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Descricao") %>'></asp:Label>
                                                    </span>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <br />
                                        <asp:LinkButton
                                            CssClass="card-link"
                                            ID="editarLinkButton"
                                            runat="server"
                                            OnClick="editarLinkButton_Click"
                                            CommandArgument='<%# Eval("Evento_ID") %>'>
                                            Editar evento
                                        </asp:LinkButton>
                                        <hr />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="modal fade bd-example-modal-lg" onblur="alterarURL()" id="modalAlterar" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Eventos</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                                <span aria-hidden="true">&times;</span>
                            </button>

                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row">
                                    <h3 style="color: #000521">Sobre</h3>

                                    <div class="row" style="color: #000521">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                            <span class="msg-obg">* </span>
                                            <asp:Label ID="lblTitulo" runat="server" Text="Título: "></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtTituloNovo" onBlur="verificarCampos()" runat="server" class="form-control"></asp:TextBox>
                                            <asp:TextBox ID="txtTitulo" runat="server" class="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <span class="msg-obg">* </span>
                                            <asp:Label ID="lblDataEvento" runat="server" Text="Data do evento:"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtDataNovo" onBlur="verificarCampos()" runat="server" TextMode="DateTimeLocal" class="form-control required"></asp:TextBox>
                                            <asp:TextBox ID="txtData" runat="server" TextMode="DateTimeLocal" class="form-control required"></asp:TextBox>

                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <span class="msg-obg">* </span>
                                            <asp:Label ID="Label20" runat="server" Text="Tipo do Evento:"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="cbxTipoEventoNovo" onBlur="verificarCampos()" runat="server" class="form-control required"></asp:DropDownList>
                                            <asp:DropDownList ID="cbxTipoEvento" runat="server" class="form-control required"></asp:DropDownList>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <span class="msg-obg">* </span>
                                            <asp:Label ID="Label7" runat="server" Text="Áreas do Evento:"></asp:Label>
                                            <br />
                                            <div id="EventoFocoNovo">
                                                <asp:ListBox ID="cbxEventoFocoNovo" onBlur="verificarCampos()" runat="server" class="form-group selectpicker required" SelectionMode="Multiple"></asp:ListBox>
                                            </div>
                                            <div id="EventoFoco">
                                                <asp:ListBox ID="cbxEventoFoco" runat="server" class="form-group selectpicker required" SelectionMode="Multiple"></asp:ListBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <span class="msg-obg">* </span>
                                            <asp:Label ID="lblDesc" runat="server" Text="Descrição: "></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtDescNovo" onBlur="verificarCampos()" TextMode="multiline" Columns="50" Rows="5" runat="server" class="form-control" Style="resize: none"></asp:TextBox>
                                            <asp:TextBox ID="txtDesc" TextMode="multiline" Columns="50" Rows="5" runat="server" class="form-control" Style="resize: none"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <br />
                                            <hr />
                                            <br />
                                            <h3 style="color: #000521">Local</h3>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <span class="msg-obg">* </span>
                                            <asp:Label ID="lblCEP" runat="server" Text="CEP:"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtCEPNovo" runat="server" class="form-control" OnBlur="consultaCepNovo(); verificarCampos()"></asp:TextBox>
                                            <asp:TextBox ID="txtCEP" runat="server" class="form-control" OnBlur="consultaCep()"></asp:TextBox>
                                        </div>

                                        <br />

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <span class="msg-obg">* </span>
                                            <asp:Label ID="lblLogradouro" runat="server" Text="Logradouro (Rua):"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtLogradouroNovo" onBlur="verificarCampos()" runat="server" class="form-control"></asp:TextBox>
                                            <asp:TextBox ID="txtLogradouro" runat="server" class="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <span class="msg-obg">* </span>
                                            <asp:Label ID="lblBairro" runat="server" Text="Bairro:"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtBairroNovo" onBlur="verificarCampos()" runat="server" class="form-control"></asp:TextBox>
                                            <asp:TextBox ID="txtBairro" runat="server" class="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <span class="msg-obg">* </span>
                                            <asp:Label ID="lblEstado" runat="server" Text="Estado:"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtEstadoNovo" onBlur="verificarCampos()" runat="server" class="form-control"></asp:TextBox>
                                            <asp:TextBox ID="txtEstado" runat="server" class="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <span class="msg-obg">* </span>
                                            <asp:Label ID="lblCidade" runat="server" Text="Cidade:"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtCidadeNovo" onBlur="verificarCampos()" runat="server" class="form-control"></asp:TextBox>
                                            <asp:TextBox ID="txtCidade" runat="server" class="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <span class="msg-obg">* </span>
                                            <asp:Label ID="lblNumero" runat="server" Text="Número:"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtNumeroNovo" onBlur="verificarCampos()" runat="server" class="form-control"></asp:TextBox>
                                            <asp:TextBox ID="txtNumero" runat="server" class="form-control"></asp:TextBox>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <asp:Label ID="lblComplemento" runat="server" Text="Complemento:"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtComplementoNovo" onBlur="verificarCampos()" runat="server" class="form-control"></asp:TextBox>
                                            <asp:TextBox ID="txtComplemento" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                            <br />
                                            <hr />
                                            <br />
                                            <asp:Button ID="btnCriarEvento" disabled="true" runat="server" Text="Criar evento" class="btn btn-primary" OnClick="btn_CriarEvento_Click" />
                                            <asp:Button ID="atualizarButton" runat="server" Text="Atualizar evento" class="btn btn-primary" OnClick="atualizarButton_Click" />
                                            <asp:Button ID="btnVoltar" runat="server" Text="Voltar" data-dismiss="modal" class="btn btn-secondary" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Modal Sucesso -->
    <div class="modal fade" id="modalDenunciar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="margin-top: 15%;">
            <div class="modal-content">
                <div class="modal-header">
                    Denunciar Publicação
                     <button type="button" class="close" data-dismiss="modal" aria-label="Fechar" onclick="limparModalDenuncia()">
                         <span aria-hidden="true">&times;</span>
                     </button>
                </div>
                <div class="modal-body">
                    <asp:TextBox ID="idPublicacaoLabel" class="form-control" runat="server" Style="width: 30%" hidden="true"></asp:TextBox><br />

                    <asp:Label ID="Label23" runat="server" Text="Tipo da Denuncia:"></asp:Label>
                    <asp:DropDownList ID="cbxTipoDenuncia" runat="server" class="form-control"></asp:DropDownList>
                    <br />
                    <asp:Label ID="Label24" runat="server" hidden="true" Text="Descrição:"></asp:Label>
                    <asp:TextBox placeholder="Descrição" hidden="true" CssClass="form-control" Style="position: relative; top: 10px; max-width: 100%; width: 100%; resize: none;" ID="txtDescricaoDenuncia" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>
                <br />
                <div class="modal-footer">
                    <asp:LinkButton ID="Button1" disabled="true" runat="server" Text="Denunciar" CssClass="btn btn-primary" OnClick="denunciarLinkButton_Click" CommandArgument='<%# Eval("Publicacao_ID") %>'> </asp:LinkButton>
                    <button type="button" class="btn btn-secondary" id="btnVoltarModal" data-dismiss="modal" onclick="limparModalDenuncia()">Voltar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal ERRO -->
    <div class="modal fade" id="modalErroDenunciar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="margin-top: 15%;">
            <div class="modal-content">
                <div class="modal-header">
                    <i style="color: yellow;" class="material-icons">report_problem</i>&nbsp Atenção
                     <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                         <span aria-hidden="true">&times;</span>
                     </button>
                </div>
                <div class="modal-body">
                    <center>
                        Erro Denunciar Publicação!!!
                    </center>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Sucesso -->
    <div class="modal fade" id="modalsucessodenunciar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="margin-top: 15%;">
            <div class="modal-content">
                <div class="modal-header">
                    <i class="material-icons" style="color: green">check_circle</i>&nbsp Sucesso
                     <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                         <span aria-hidden="true">&times;</span>
                     </button>
                </div>
                <div class="modal-body">
                    <center>
                        Obrigado pela denuncia, iremos verificar a denuncia!!!
                    </center>
                </div>
                <div class="modal-footer">
                    <button type="button" onclick="redirecionamentoLogin()" class="btn btn-primary" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>

    <!-- MODAL SUBMETER -->
    <div class="modal fade" id="modalSubmeter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Entrar em Contato
                    </h5>
                    <button type="button" onclick="limparModal()" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:TextBox ID="UsuarioID" class="form-control" runat="server" Style="width: 30%" hidden="true"></asp:TextBox><br />
                    <div class="alert alert-danger" id="alert-danger" role="alert" hidden>
                        <strong id="tamanho-arquivo" hidden>Verificar Arquivo:</strong>
                        <br />
                        <div class="row">
                            <li id="lbl_file" hidden>Tamanho do arquivo ultrapassou o valor de 4MB.</li>
                        </div>
                    </div>
                    <form>
                        <div class="form-group">
                            <asp:TextBox ID="txtAssunto" onBlur="verificarCampos()" runat="server" class="form-control" placeholder="*Assunto"></asp:TextBox>

                        </div>
                        <div class="form-group">
                            <div class="custom-file">
                                <asp:FileUpload CssClass="custom-file-input" ID="FileUpload1" onChange="getName(1)" onblur="VerificaTamanhoArquivo()" runat="server" />
                                <label class="custom-file-label" id="nameFile" for="FileUpload1">Escolha seu arquivo</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:TextBox placeholder="*Descrição" CssClass="form-control" Style="max-width: 100%; width: 100%; resize: none;" ID="txtdescricao" TextMode="MultiLine" runat="server"></asp:TextBox>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="LinkButton1" disabled="true" runat="server" Text="Enviar" CssClass="btn btn-primary" OnClick="gosteiLinkButtons"> </asp:LinkButton>

                    <button type="button" onclick="limparModal()" class="btn btn-secondary" data-dismiss="modal">Voltar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


