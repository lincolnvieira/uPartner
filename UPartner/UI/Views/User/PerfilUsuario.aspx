<%@ Page Title="" Language="C#" MasterPageFile="~/Views/AppLayout/AppLayout.Master" AutoEventWireup="true" CodeBehind="PerfilUsuario.aspx.cs" Inherits="UI.Views.User.PerfilUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/Index/Index.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-3.4.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
    <script>
        $("#ContentPlaceHolder1_editarDadosContaLinkButton").click(function () {
            alert("Handler for .click() called.");
            $("#divSenha").prop('hidden', false);
        });

        function clickAlterarImagem() {
            console.log("teste");
            document.getElementById("ContentPlaceHolder1_btnAlterarImagem").click();
        }


        function erroEmailValidacao() {
            $("#modalerroEmailValidacao").modal({
                show: true
            });
        }

        function getName() {
            var fileName = $("#ContentPlaceHolder1_imagemUploadtt").val().split("\\").pop();
            $("#ContentPlaceHolder1_imagemUploadtt").siblings(".custom-file-label").addClass("selected").html(fileName);
        }

        window.onload = function () {
            hideEvento();
            hideEventosCriados();
            //formataData();

            var tipoConta = $("#ContentPlaceHolder1_tipoContaLabel").text();

            if (tipoConta == "Empresa") {
                $("#ContentPlaceHolder1_LabelNomeSocial").prop("hidden", true);
                $("#ContentPlaceHolder1_LabelNomeEmpresa").prop("hidden", false);
                $("#ContentPlaceHolder1_Label2").prop("hidden", true);
                $("#ContentPlaceHolder1_sobrenomeLabel").prop("hidden", true);
                $("#ContentPlaceHolder1_lblDataNascimento").prop("hidden", true);
                $("#ContentPlaceHolder1_lblDataFundacao").prop("hidden", false);
                $("#div_sobrenome").prop("hidden", true);
                $("#ContentPlaceHolder1_lblDadosEmpresa").prop("hidden", false);
                $("#ContentPlaceHolder1_lblDadosPessoais").prop("hidden", true);
            } else {
                $("#ContentPlaceHolder1_LabelNomeSocial").prop("hidden", false);
                $("#ContentPlaceHolder1_LabelNomeEmpresa").prop("hidden", true);
                $("#ContentPlaceHolder1_Label2").prop("hidden", false);
                $("#ContentPlaceHolder1_sobrenomeLabel").prop("hidden", false);
                $("#ContentPlaceHolder1_lblDataNascimento").prop("hidden", false);
                $("#ContentPlaceHolder1_lblDataFundacao").prop("hidden", true);
                $("#div_sobrenome").prop("hidden", false);
                $("#ContentPlaceHolder1_lblDadosEmpresa").prop("hidden", true);
                $("#ContentPlaceHolder1_lblDadosPessoais").prop("hidden", false);
            }

            var variaveis = location.search.split("?");
            var quebra = variaveis[1].split("&");

            if (quebra[1] == "MeuPerfil=ok") {
                $("#alterarSenhaLinkButton").prop("hidden", false);
                $("#ContentPlaceHolder1_editarAreaDeAtuacaoLinkButton").prop("hidden", false);
            } else {
                $("#alterarSenhaLinkButton").prop("hidden", true);
                $("#ContentPlaceHolder1_editarAreaDeAtuacaoLinkButton").prop("hidden", true);
            }
        };

        function fecharModal() {
            $("#btnVoltarModal").click();
        }

        function erroCaracteresAlterarSenha() {
            $("#modalerrocaracteresalterarsenha").modal({
                show: true
            });
        }

        function sucessoAlterarSenha() {
            $("#modalsucessoalterarsenha").modal({
                show: true
            });
        }

        function erroAlterarSenha() {
            $("#modalerroalterarsenha").modal({
                show: true
            });
        }

        //function formataData() {
        //    var data = $("#ContentPlaceHolder1_dataNascimentoLabel").text();

        //    var dia = data.substring(8, 10);
        //    var mes = data.substring(5, 7);
        //    var ano = data.substring(0, 4);

        //    $("#ContentPlaceHolder1_dataNascimentoLabel").text(dia + "/" + mes + "/" + ano);
        //}

        function sucessoEnvioEmail() {
            $("#Div1").prop('hidden', false)
        }

        function submeterProjeto() {
            $("#modalSubmeter").modal({
                show: true
            });
        }

        function AlterarSenhaProjeto() {
            var UsuarioID = $("#ContentPlaceHolder1_idLabel").val();
            $("#modalAlterarSenha").modal({
                show: true
            });
            $("#ContentPlaceHolder1_UsuarioID").val(UsuarioID);
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

        function verificarCampos() {
            var Assunto = $("#ContentPlaceHolder1_txtAssunto").val();
            var Descricao = $("#ContentPlaceHolder1_txtdescricao").val();

            var flgBtnEnviar = false;

            if (Assunto != "" && Descricao != "") {
                flgBtnEnviar = true;
            }

            if (flgBtnEnviar) {
                $('#ContentPlaceHolder1_btnEnviar').prop('disabled', false);
            }

            VerificaTamanhoArquivo();

        }


        function DesabilitarBotaoSenha() {
            $("#ContentPlaceHolder1_txtdescricao").val("");
        }

        function limparModal() {
            $("#ContentPlaceHolder1_txtAssunto").val("");
            $("#ContentPlaceHolder1_txtdescricao").val("");
            $("#ContentPlaceHolder1_imagemUploadtt").replaceWith($("#ContentPlaceHolder1_imagemUploadtt").val('').clone(true));
            $('#ContentPlaceHolder1_btnEnviar').prop('disabled', true);
        }

        function refreshPage() {
            window.location.reload();
        }

        function menuTabHide() {
            $("#menu2").prop('hidden', true);
        }

        function menuTabShow() {
            $("#menu2").prop('hidden', false);
        }

        function activeLinkPerfil() {
            $("#menu1").addClass('active');
            $("#menu1").addClass('show');

            $("#menu2").removeClass('active');
            $("#menu2").removeClass('show');

            $("#menu3").removeClass('active');
            $("#menu3").removeClass('show');
        }

        function activeLinkEvento() {
            $("#menu2").addClass('active');
            $("#menu2").addClass('show');

            $("#menu3").removeClass('active');
            $("#menu3").removeClass('show');

            $("#menu1").removeClass('active');
            $("#menu1").removeClass('show');
        }

        function activeLinkPublicacao() {
            $("#menu3").addClass('active');
            $("#menu3").addClass('show');

            $("#menu1").removeClass('active');
            $("#menu1").removeClass('show');

            $("#menu2").removeClass('active');
            $("#menu2").removeClass('show');
        }

        function alterarURL() {
            var ID = $("#ContentPlaceHolder1_idLabel").val();
            window.history.pushState("Publicação", "UPartner", "PerfilUsuario.aspx?id=" + ID + "&MeuPerfil=ok");
        }

        function abrirModal() {
            var url_atual = window.location.href;
            console.log(url_atual);
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

                $("#EventoFocoNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtTituloNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtDataNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtDescNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_cbxTipoEventoNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtCEPNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtLogradouroNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtBairroNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtEstadoNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtCidadeNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtNumeroNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtComplementoNovo").prop("hidden", false);
                $("#ContentPlaceHolder1_btnCriarEvento").prop("hidden", false);

                alterarURL();
                abrirModal();

            } else {
                $("#ContentPlaceHolder1_txtTituloNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtDataNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtDescNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_cbxTipoEventoNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtCEPNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtLogradouroNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtBairroNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtEstadoNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtCidadeNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtNumeroNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_txtComplementoNovo").prop("hidden", true);
                $("#ContentPlaceHolder1_btnCriarEvento").prop("hidden", true);
                $("#EventoFocoNovo").prop("hidden", true);

                $("#EventoFoco").prop("hidden", false);
                $("#ContentPlaceHolder1_txtTitulo").prop("hidden", false);
                $("#ContentPlaceHolder1_txtData").prop("hidden", false);
                $("#ContentPlaceHolder1_txtDesc").prop("hidden", false);
                $("#ContentPlaceHolder1_cbxTipoEvento").prop("hidden", false);
                $("#ContentPlaceHolder1_atualizarButton").prop("hidden", false);
                $("#ContentPlaceHolder1_txtCEP").prop("hidden", false);
                $("#ContentPlaceHolder1_txtLogradouro").prop("hidden", false);
                $("#ContentPlaceHolder1_txtBairro").prop("hidden", false);
                $("#ContentPlaceHolder1_txtEstado").prop("hidden", false);
                $("#ContentPlaceHolder1_txtCidade").prop("hidden", false);
                $("#ContentPlaceHolder1_txtNumero").prop("hidden", false);
                $("#ContentPlaceHolder1_txtComplemento").prop("hidden", false);
                $("#ContentPlaceHolder1_btnCriarEvento").prop("hidden", true);

                alterarURL();
                abrirModal();

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

        function hideEvento() {
            $("#participando").prop('hidden', true);
        }

        function showEvento() {
            $("#participando").prop('hidden', false);
        }

        function hideEventosCriados() {
            $("#eventos-card").prop('hidden', true);
        }

        function showEventosCriados() {
            $("#eventos-card").prop('hidden', false);
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid gedf-wrapper">
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <asp:LinkButton ID="btnAlterarImagem" runat="server" OnClick="alterarImagem_click" hidden="true"></asp:LinkButton>
                    <div class="card-body">
                        <asp:FileUpload CssClass="custom-file-input" Style="position: relative; top: 100px; left: 100px" Width="100px" Height="100px" ID="FileUpload3" onChange="clickAlterarImagem();" onblur="VerificaTamanhoArquivo();" runat="server" />
                        <center>                   
                        <asp:Image ID="fotoPerfilImage" runat="server" Width="200px" Height="200px" Style="border-radius: 100px; position:relative; bottom:70px;" />

                        <hr />
                        <div class="h5">
                            <asp:TextBox ID="idLabel" class="form-control" runat="server" Style="width: 30%" Enabled="false" hidden="true"></asp:TextBox><br />
                            <asp:Label ID="Labelnome" runat="server" Text=""></asp:Label>
                            <asp:Label ID="Labelsobrenome" runat="server" Text=""></asp:Label>
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
                            <asp:LinkButton ID="voltarLinkButton" runat="server" OnClick="voltarLinkButton_Click">Voltar</asp:LinkButton>
                            <asp:Button ID="submeterButton" runat="server" Text="Enviar projeto" class="btn btn-primary" OnClick="modalLinkButton_Click" />
                            <%--<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#modalSubmeter" data-whatever="@getbootstrap" role="button" aria-pressed="true" hidden>Enviar projeto</a>--%>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-md-9 gedf-main">

                <div class="card gedf-card">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" onclick="activeLinkPerfil(); menuTabHide(); hideEvento(); hideEventosCriados();" id="sugestoes-tab" data-toggle="tab" href="#menu1" role="tab" aria-controls="sugestoes" aria-selected="true">Perfil</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" onclick="activeLinkEvento(); menuTabShow(); showEvento()" id="participando-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#menu2">Eventos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" onclick="activeLinkPublicacao(); menuTabHide(); hideEvento(); hideEventosCriados();" id="criados-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#menu3">Publicações</a>
                            </li>
                        </ul>
                    </div>

                    <div class="card-body">
                        <div class="tab-content" id="myTabContent1">
                            <div class="tab-pane fade" id="menu3" role="tabpanel" aria-labelledby="sugestoes-tab">
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
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Sobrenome") %>'></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <%--                                                        <div class="dropdown">
                                                            <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="fa fa-ellipsis-h"></i>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                                                <div class="h6 dropdown-header">Configuration</div>
                                                                <a class="dropdown-item" href="#">Save</a>
                                                                <a class="dropdown-item" href="#">Hide</a>
                                                                <a class="dropdown-item" href="#">Report</a>
                                                            </div>
                                                        </div>--%>
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
                                                <%--                                                <asp:LinkButton
                                                    CssClass="card-link"
                                                    ID="gosteiLinkButton"
                                                    runat="server"
                                                    OnClick="gosteiLinkButton_Click"
                                                    ComamndArgument='<%# Eval("Publicacao_ID") %>'>
									Gostei
                                    <i class="fa fa-comment"></i>
                                                </asp:LinkButton>--%>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="tab-pane fade show active" id="menu1" role="tabpanel" aria-labelledby="sugestoes-tab">
                                <div class="form-group" hidden id="Div1" runat="server">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                        <div class="alert alert-success">
                                            <strong>Sucesso</strong>
                                            <br />
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    E-mail Enviado com sucesso!!!
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card gedf-card">
                                    <div class="card-header">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="ml-2">
                                                    <div class="h5 m-0">
                                                        <asp:Label ID="lblDadosPessoais" runat="server" Text="Dados Pessoais"></asp:Label>
                                                        <asp:Label ID="lblDadosEmpresa" runat="server" Text="Dados da Empresa" hidden="true"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <asp:LinkButton ID="editarDadosPessoaisLinkButton" CssClass="btn btn-primary" runat="server" OnClick="editarDadosPessoaisLinkButton_Click">Editar</asp:LinkButton>
                                                <asp:LinkButton ID="salvarDadosPessoaisLinkButton" CssClass="btn btn-success" runat="server" OnClick="salvarDadosPessoaisLinkButton_Click" Enabled="false" Visible="false">Salvar </asp:LinkButton>
                                                <asp:LinkButton ID="cancelarDadosPessoaisLinkButton" CssClass="btn btn-danger" runat="server" OnClick="cancelarDadosPessoaisLinkButton_Click" Enabled="false" Visible="false">Cancelar</asp:LinkButton>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="card-body">
                                        <div class="form-group row">
                                            <asp:Label ID="LabelNomeSocial" class="col-sm-2 col-form-label" runat="server" Text="Nome: "></asp:Label>
                                            <asp:Label ID="LabelNomeEmpresa" class="col-sm-3 col-form-label" runat="server" Text="Nome da Empresa: " hidden="true"></asp:Label>
                                            <asp:Label ID="nomeLabel" runat="server" Text="Lincoln" CssClass="text-muted col-form-label"></asp:Label>
                                            <asp:TextBox ID="nomeTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Text="Teste" Visible="false"></asp:TextBox><br />
                                            <br />
                                        </div>
                                        <div class="form-group row" id="div_sobrenome">
                                            <asp:Label ID="Label2" runat="server" class="col-sm-2 col-form-label" Text="Sobrenome: "></asp:Label>
                                            <asp:Label ID="sobrenomeLabel" runat="server" Text="Vieira" CssClass="text-muted col-form-label"></asp:Label><br />
                                            <asp:TextBox ID="sobrenomeTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Visible="false"></asp:TextBox><br />
                                        </div>
                                        <div class="form-group row">
                                            <asp:Label ID="lblDataNascimento" runat="server" class="col-sm-3 col-form-label" Text="Data de Nascimento:"></asp:Label>
                                            <asp:Label ID="lblDataFundacao" runat="server" class="col-sm-3 col-form-label" Text="Data de fundação:" hidden="true"></asp:Label>
                                            <asp:Label ID="dataNascimentoLabel" runat="server" Text="22/04/1997" CssClass="text-muted col-form-label"></asp:Label><br />
                                            <asp:TextBox ID="dataNascimentoTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Visible="false" TextMode="Date"></asp:TextBox><br />
                                        </div>
                                    </div>
                                </div>

                                <div class="card gedf-card">
                                    <div class="card-header">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="ml-2">
                                                    <div class="h5 m-0">
                                                        <asp:Label ID="Label4" runat="server" Text="Dados da Conta"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <asp:LinkButton ID="editarDadosContaLinkButton" CssClass="btn btn-primary" runat="server" OnClick="editarDadosContaLinkButton_Click">Editar</asp:LinkButton>
                                                <button type="button" id="alterarSenhaLinkButton" class="btn btn-info" onclick="AlterarSenhaProjeto()">Alterar Senha</button>
                                                <asp:LinkButton ID="salvarDadosContaLinkButton" CssClass="btn btn-success" runat="server" OnClick="salvarDadosContaLinkButton_Click" Enabled="false" Visible="false">Salvar </asp:LinkButton>
                                                <asp:LinkButton ID="cancelarDadosContaLinkButton" CssClass="btn btn-danger" runat="server" OnClick="cancelarDadosContaLinkButton_Click" Enabled="false" Visible="false">Cancelar</asp:LinkButton>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="card-body">
                                        <div class="form-group row">
                                            <asp:Label ID="Label5" runat="server" class="col-sm-2 col-form-label" Text="Email: "></asp:Label>
                                            <asp:Label ID="emailLabel" runat="server" Text="Lincoln" CssClass="text-muted col-form-label"></asp:Label><br />
                                            <asp:TextBox ID="emailTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Text="Teste" Visible="false"></asp:TextBox><br />
                                        </div>

                                        <%--                                        <div class="form-group row" id="divSenha" hidden>
                                            <asp:Label ID="Label7" runat="server" class="col-sm-2 col-form-label" Text="Senha: "></asp:Label>
                                            <asp:Label ID="senhaLabel" runat="server" Text="" CssClass="text-muted col-form-label" TextMode="Password"></asp:Label><br />
                                            <asp:TextBox ID="senhaTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Visible="false" TextMode="Password"></asp:TextBox><br />
                                        </div>--%>

                                        <%--                                        <div class="form-group row">
                                            <asp:Label ID="repetirLabel" runat="server" class="col-sm-2 col-form-label" Text="Repetir:" Enabled="false" Visible="false"></asp:Label>
                                            <asp:TextBox ID="repetirTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Visible="false"></asp:TextBox>
                                        </div>--%>

                                        <div class="form-group row">
                                            <asp:Label ID="Label20" runat="server" class="col-sm-2 col-form-label" Text="Sobre:"></asp:Label>
                                            <asp:Label ID="sobreLabel" runat="server" Text="" CssClass="text-muted col-form-label"></asp:Label><br />
                                            <asp:TextBox TextMode="multiline" ID="sobreTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Visible="false"></asp:TextBox><br />
                                        </div>

                                    </div>
                                </div>

                                <div class="card gedf-card">
                                    <div class="card-header">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="ml-2">
                                                    <div class="h5 m-0">
                                                        <asp:Label ID="Label25" runat="server" Text="Área de Atuação"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <asp:LinkButton ID="editarAreaDeAtuacaoLinkButton" CssClass="btn btn-primary" runat="server" OnClick="editarAreaDeAtuacaoLinkButton_Click">Editar</asp:LinkButton>
                                                <asp:LinkButton ID="salvarAreaDeAtuacaoLinkButton" CssClass="btn btn-success" runat="server" OnClick="salvarAreaDeAtuacaoLinkButton_Click" Enabled="false" Visible="false">Salvar</asp:LinkButton>
                                                <asp:LinkButton ID="cancelarAreaDeAtuacaoLinkButton" CssClass="btn btn-danger" runat="server" OnClick="cancelarAreaDeAtuacaoLinkButton_Click" Enabled="false" Visible="false">Cancelar</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group row">
                                            <asp:Label ID="Label26" runat="server" class="col-sm-2 col-form-label" Text="Área de Atuação: " Visible="false"></asp:Label>
                                            <asp:ListBox ID="cbxAreaAtuacao" runat="server" class="form-group selectpicker required" SelectionMode="Multiple" Visible="false" Enabled="false"></asp:ListBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="card gedf-card">
                                    <div class="card-header">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="ml-2">
                                                    <div class="h5 m-0">

                                                        <asp:Label ID="Label11" runat="server" Text="Endereço"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <asp:LinkButton ID="editarEnderecoLinkButton" CssClass="btn btn-primary" runat="server" OnClick="editarEnderecoLinkButton_Click">Editar</asp:LinkButton>
                                                <asp:LinkButton ID="salvarEnderecoLinkButton" CssClass="btn btn-success" runat="server" OnClick="salvarEnderecoLinkButton_Click" Enabled="false" Visible="false">Salvar </asp:LinkButton>
                                                <asp:LinkButton ID="cancelarEnderecoLinkButton" CssClass="btn btn-danger" runat="server" OnClick="cancelarEnderecoLinkButton_Click" Enabled="false" Visible="false">Cancelar</asp:LinkButton>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="card-body">
                                        <div class="form-group row">
                                            <asp:Label ID="Label12" runat="server" class="col-sm-2 col-form-label" Text="CEP: "></asp:Label>
                                            <asp:Label ID="cepLabel" runat="server" Text="" CssClass="text-muted col-form-label"></asp:Label><br />
                                            <asp:TextBox ID="cepTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Text="Teste" Visible="false"></asp:TextBox><br />
                                        </div>

                                        <div class="form-group row">
                                            <asp:Label ID="Label19" runat="server" class="col-sm-2 col-form-label" Text="Cidade:"></asp:Label>
                                            <asp:Label ID="cidadeLabel" runat="server" Text="" CssClass="text-muted col-form-label"></asp:Label><br />
                                            <asp:TextBox ID="cidadeTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Visible="false"></asp:TextBox><br />
                                        </div>

                                        <div class="form-group row">
                                            <asp:Label ID="Label16" runat="server" class="col-sm-2 col-form-label" Text="Bairro:"></asp:Label>
                                            <asp:Label ID="bairroLabel" runat="server" Text="" CssClass="text-muted col-form-label"></asp:Label><br />
                                            <asp:TextBox ID="bairroTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Visible="false"></asp:TextBox><br />
                                        </div>

                                        <div class="form-group row">
                                            <asp:Label ID="Label15" runat="server" class="col-sm-2 col-form-label" Text="Estado:"></asp:Label>
                                            <asp:Label ID="estadoLabel" runat="server" Text="" CssClass="text-muted col-form-label"></asp:Label><br />
                                            <asp:TextBox ID="estadoTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Visible="false"></asp:TextBox><br />
                                        </div>

                                        <div class="form-group row">
                                            <asp:Label ID="Label14" runat="server" class="col-sm-2 col-form-label" Text="Logradouro: "></asp:Label>
                                            <asp:Label ID="logradouroLabel" runat="server" Text="" CssClass="text-muted col-form-label"></asp:Label><br />
                                            <asp:TextBox ID="logradouroTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Visible="false"></asp:TextBox><br />
                                        </div>

                                        <div class="form-group row">
                                            <asp:Label ID="Label22" runat="server" class="col-sm-2 col-form-label" Text="Numero:"></asp:Label>
                                            <asp:Label ID="numeroLabel" runat="server" Text="" CssClass="text-muted col-form-label"></asp:Label><br />
                                            <asp:TextBox ID="numeroTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Visible="false"></asp:TextBox><br />
                                        </div>

                                        <div class="form-group row">
                                            <asp:Label ID="Label23" runat="server" class="col-sm-2 col-form-label" Text="Complemento:"></asp:Label>
                                            <asp:Label ID="complementoLabel" runat="server" Text="" CssClass="text-muted col-form-label"></asp:Label><br />
                                            <asp:TextBox ID="complementoTextBox" class="form-control" runat="server" Style="width: 30%" Enabled="false" Visible="false"></asp:TextBox><br />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="menu2" role="tabpanel" aria-labelledby="participando-tab">
                            <div class="card gedf-card">
                                <div class="card-header">
                                    <ul class="nav nav-tabs card-header-tabs" id="myTab2" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="participandoEvento-tab" onclick="showEvento(); hideEventosCriados()" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#participando">Participando</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="criadosEvento-tab" onclick="hideEvento(); showEventosCriados()" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#meuseventos">Meus Eventos</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-body">
                                    <div class="tab-pane fade show active" id="participando" role="tabpanel" aria-labelledby="participandoEvento-tab">

                                        <asp:Repeater ID="eventosParticipandoRepeater" runat="server">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Evento_ID") %>' />
                                                <div class="card gedf-card" id="participando-card">

                                                    <div class="card-header">
                                                        <h5 class="card-title">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Titulo") %>'></asp:Label></h5>
                                                        <h6 class="card-subtitle mb-2 text-muted">
                                                            <asp:Label ID="Label19" runat="server" Text='<%# Eval("TipoEvento") %>'></asp:Label></h6>
                                                    </div>
                                                    <div class="card-body">
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
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>

                                    <div class="tab-pane fade" id="meuseventos" role="tabpanel" aria-labelledby="criadosEvento-tab">
                                        <asp:Repeater ID="eventosCriadoRepeater" runat="server">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Evento_ID") %>' />
                                                <div class="card gedf-card" id="eventos-card">

                                                    <div class="card-header">
                                                        <h5 class="card-title">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Titulo") %>'></asp:Label></h5>
                                                        <h6 class="card-subtitle mb-2 text-muted">
                                                            <asp:Label ID="Label19" runat="server" Text='<%# Eval("TipoEvento") %>'></asp:Label></h6>
                                                    </div>
                                                    <div class="card-body">
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
                                                        <asp:LinkButton
                                                            CssClass="card-link"
                                                            ID="editarLinkButton"
                                                            runat="server"
                                                            OnClick="editarLinkButton_Click"
                                                            CommandArgument='<%# Eval("Evento_ID") %>'>Editar evento
                                                        </asp:LinkButton>
                                                        <asp:LinkButton
                                                            CssClass="card-link"
                                                            ID="participarLinkButton"
                                                            runat="server"
                                                            OnClick="participarLinkButton_Click"
                                                            CommandArgument='<%# Eval("Evento_ID") %>'>Participar
                                                        </asp:LinkButton>
                                                        <hr />
                                                    </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
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
                                <button type="button" class="close" onclick="refreshPage()" data-dismiss="modal" aria-label="Fechar">
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
                                                <asp:TextBox ID="txtTitulo" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="lblDataEvento" runat="server" Text="Data do evento:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtData" runat="server" TextMode="DateTimeLocal" class="form-control required"></asp:TextBox>

                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="Label6" runat="server" Text="Tipo do Evento:"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="cbxTipoEvento" runat="server" class="form-control required"></asp:DropDownList>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="Label21" runat="server" Text="Áreas do Evento:"></asp:Label>
                                                <br />
                                                <div id="EventoFocoNovo">
                                                    <asp:ListBox ID="cbxEventoFocoNovo" runat="server" class="form-group selectpicker required" SelectionMode="Multiple"></asp:ListBox>
                                                </div>
                                                <div id="EventoFoco">
                                                    <asp:ListBox ID="cbxEventoFoco" runat="server" class="form-group selectpicker required" SelectionMode="Multiple"></asp:ListBox>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="lblDesc" runat="server" Text="Descrição: "></asp:Label>
                                                <br />
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
                                                <asp:TextBox ID="txtCEP" runat="server" class="form-control" OnBlur="consultaCep()"></asp:TextBox>
                                            </div>

                                            <br />

                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="lblLogradouro" runat="server" Text="Logradouro (Rua):"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtLogradouro" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="lblBairro" runat="server" Text="Bairro:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtBairro" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="lblEstado" runat="server" Text="Estado:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtEstado" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="lblCidade" runat="server" Text="Cidade:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtCidade" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="lblNumero" runat="server" Text="Número:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtNumero" runat="server" class="form-control"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                <asp:Label ID="lblComplemento" runat="server" Text="Complemento:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtComplemento" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                <br />
                                                <hr />
                                                <br />
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

        <!-- MODAL SUBMETER -->
        <div class="modal fade" id="modalSubmeter" tabindex="-1" onblur="limparModal()" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Enviar Projeto
                        </h5>
                        <button type="button" onclick="limparModal()" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
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
                                    <asp:FileUpload CssClass="custom-file-input" ID="imagemUploadtt" onChange="getName()" onblur="VerificaTamanhoArquivo()" runat="server" />
                                    <label class="custom-file-label" for="imagemUploadtt">Escolha seu arquivo</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:TextBox placeholder="*Descrição" onBlur="verificarCampos()" CssClass="form-control" Style="max-width: 100%; width: 100%; resize: none;" ID="txtdescricao" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnEnviar" disabled="true" runat="server" Text="Enviar" class="btn btn-primary" OnClick="fazerContatoButton_Click" />
                        <button type="button" onclick="limparModal()" class="btn btn-secondary" data-dismiss="modal">Voltar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL ALTERAR SENHA -->
        <div class="modal fade" id="modalAlterarSenha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="AlterarSenhaModalLabel">Alterar Senha
                        </h5>
                        <button type="button" onclick="limparModal()" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group row" id="divSenha">
                            <asp:TextBox ID="UsuarioID" class="form-control" runat="server" Style="width: 30%" hidden="true"></asp:TextBox><br />
                            <asp:Label ID="Label24" runat="server" class="col-sm-2 col-form-label" Text="Senha: "></asp:Label>
                            <asp:TextBox ID="senhaTextBox" class="form-control" runat="server" Style="width: 60%" TextMode="Password" MaxLength="8"></asp:TextBox><br />
                        </div>
                        <div class="form-group row">
                            <asp:Label ID="Label7" runat="server" class="col-sm-2 col-form-label" Text="Repetir: "></asp:Label>
                            <asp:TextBox ID="repetirTextBox" class="form-control" runat="server" Style="width: 60%" TextMode="Password" MaxLength="8"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="LinkButton1" runat="server" Text="Alterar" CssClass="btn btn-primary" OnClick="alterarSenhaLinkButton_Click"> </asp:LinkButton>
                        <button type="button" id="btnVoltarModal" onclick="limparModal()" class="btn btn-secondary" data-dismiss="modal">Voltar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Sucesso -->
        <div class="modal fade" id="modalsucessoalterarsenha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        Senha Alterada com sucesso!!!
                    </center>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal ERRO -->
        <div class="modal fade" id="modalerroalterarsenha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        Senhas não são iguais !!!
                    </center>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal ERRO -->
        <div class="modal fade" id="modalerrocaracteresalterarsenha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        Senha não possui 8 caracteres!!!
                    </center>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal ERRO -->
        <div class="modal fade" id="modalerroEmailValidacao" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        E-mail já cadastrado no sistema!
                    </center>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
