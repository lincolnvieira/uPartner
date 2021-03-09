<%@ Page Title="" Language="C#" MasterPageFile="~/Views/AppLayout/AppLayout.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="UI.Views.Adm.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script>

        window.onload = function () {
            $("#cadastroAtuacao").addClass('hidden');
            $("#publicacoesDenunciadas").addClass('hidden');
            $("#usuariosBloqueados").addClass('hidden');
            $("#cadastroAdministrador").addClass('hidden');
        };

        function activeLinkUsuDen() {
            $("#cadastroAtuacao").addClass('active');
            $("#cadastroAtuacao").addClass('show');
            $("#cadastroAtuacao").removeClass('hidden');

            $("#publicacoesDenunciadas").removeClass('active');
            $("#publicacoesDenunciadas").removeClass('show');
            $("#publicacoesDenunciadas").addClass('hidden');

            $("#usuariosBloqueados").removeClass('active');
            $("#usuariosBloqueados").removeClass('show');
            $("#usuariosBloqueados").addClass('hidden');

            $("#cadastroAdministrador").removeClass('active');
            $("#cadastroAdministrador").removeClass('show');
            $("#cadastroAdministrador").addClass('hidden');
        }

        function activeLinkPubDen() {
            $("#publicacoesDenunciadas").addClass('active');
            $("#publicacoesDenunciadas").addClass('show');
            $("#publicacoesDenunciadas").removeClass('hidden');

            $("#usuariosBloqueados").removeClass('active');
            $("#usuariosBloqueados").removeClass('show');
            $("#usuariosBloqueados").addClass('hidden');

            $("#cadastroAtuacao").removeClass('active');
            $("#cadastroAtuacao").removeClass('show');
            $("#cadastroAtuacao").addClass('hidden');

            $("#cadastroAdministrador").removeClass('active');
            $("#cadastroAdministrador").removeClass('show');
            $("#cadastroAdministrador").addClass('hidden');
        }

        function activeLinkUsuBlq() {
            $("#usuariosBloqueados").addClass('active');
            $("#usuariosBloqueados").addClass('show');
            $("#usuariosBloqueados").removeClass('hidden');

            $("#cadastroAtuacao").removeClass('active');
            $("#cadastroAtuacao").removeClass('show');
            $("#cadastroAtuacao").addClass('hidden');

            $("#publicacoesDenunciadas").removeClass('active');
            $("#publicacoesDenunciadas").removeClass('show');
            $("#publicacoesDenunciadas").addClass('hidden');

            $("#cadastroAdministrador").removeClass('active');
            $("#cadastroAdministrador").removeClass('show');
            $("#cadastroAdministrador").addClass('hidden');
        }

        function activeLinCadAdm() {
            $("#cadastroAdministrador").addClass('active');
            $("#cadastroAdministrador").addClass('show');
            $("#cadastroAdministrador").removeClass('hidden');

            $("#usuariosBloqueados").removeClass('active');
            $("#usuariosBloqueados").removeClass('show');
            $("#usuariosBloqueados").addClass('hidden');

            $("#cadastroAtuacao").removeClass('active');
            $("#cadastroAtuacao").removeClass('show');
            $("#cadastroAtuacao").addClass('hidden');

            $("#publicacoesDenunciadas").removeClass('active');
            $("#publicacoesDenunciadas").removeClass('show');
            $("#publicacoesDenunciadas").addClass('hidden');
        }


    </script>

    <div class="container-fluid gedf-wrapper">

        <br />
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <center>                   
                        <i class="material-icons" style="color: black; font-size:200px; border-radius: 100px">mood</i>
                        <%--<asp:Image ID="fotoPerfilImage" runat="server" Width="200px" Height="200px" Style="border-radius: 100px" />--%>

                        <hr />
                        <div class="h7">
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
                                <asp:Label ID="tipoContaLabel" runat="server" Text="Administrador"></asp:Label>
                            </div>
                        </li>

                        <ul class="list-group list-group-flush nav-stacked" style="position: relative; left: 7%;">
                            <a data-toggle="tab" href="#publicacoesDenunciadas" onclick="activeLinkPubDen()">Publicações Denunciadas</a>
                            <a data-toggle="tab" href="#usuariosBloqueados" onclick="activeLinkUsuBlq()">Usuários Bloqueados</a>
                            <a data-toggle="tab" href="#cadastroAtuacao" onclick="activeLinkUsuDen()">Solicitações de Cadastro</a>
                            <a data-toggle="tab" href="#cadastroAdministrador" onclick="activeLinCadAdm()">Cadastro Administrador</a>
                            <asp:LinkButton ID="logoutLinkButton" runat="server" OnClick="logoutLinkButton_Click">Logout</asp:LinkButton>
                        </ul>

                    </ul>
                    <button type="button" class="btn btn-link" style="padding-left: 0px;" id="teste" data-toggle="modal" data-target=".bd-example-modal-lg" onclick="novoEvento(2)" hidden="hidden">Alterar Evento</button><br />

                </div>
            </div>

            <div class="col-md-9 gedf-main">
                <div id="publicacoesDenunciadas" class="tab-pane fade">
                    <div class="container">
                        <br />
                        <h2>Publicações Denunciadas</h2>

                        <br />
                        <hr style="background-color: #000521" />
                        <br />

                        <asp:Repeater ID="publicacoesDenunciadasRepeater" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr style="text-align: center; background-color: #000521; color: #ffffff;">
                                            <th style="width: 5%">ID</th>
                                            <th style="width: 18%">Titulo</th>
                                            <th style="width: 5%">Descricao</th>
                                            <th style="width: 15%">Quantidade de Denuncias</th>
                                            <th style="width: 20%">Usuario</th>
                                            <th style="width: 16%">Ações</th>
                                        </tr>
                                    </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Usuario_ID") %>' />
                                <tbody>
                                    <tr style="text-align: center">
                                        <td>
                                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("Publicacao_ID") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="titulolabel" runat="server" Text='<%# Eval("Titulo") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="descricaoLabel" runat="server" Text='<%# Eval("Descricao") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="qdteLabel" runat="server" Text='<%# Eval("Quantidade_Denuncia") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="usNomeLabel" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
                                            &nbsp
                                            <asp:Label ID="usSobrenomeLabel" runat="server" Text='<%# Eval("Sobrenome") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <i class="material-icons" style="color: red">block</i><asp:LinkButton ID="bloquearLinkButton" runat="server" OnClick="bloquearLinkButton_Click" CommandArgument='<%# Eval("Usuario_ID") %>'>Bloquear Usuário</asp:LinkButton>
                                        </td>
                                    </tr>
                                </tbody>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <div id="usuariosBloqueados" class="tab-pane fade">
                    <div class="container">
                        <br />
                        <h2>Usuarios Bloqueados</h2>

                        <br />
                        <hr style="background-color: #000521" />
                        <br />

                        <asp:Repeater ID="usuariosBloqueadosRepeater" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr style="text-align: center; background-color: #000521; color: #ffffff;">
                                            <th style="width: 5%">ID</th>
                                            <th style="width: 5%">Nome</th>
                                            <th style="width: 15%">Data de Cadastro</th>
                                            <th style="width: 16%">Ações</th>
                                        </tr>
                                    </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tbody>
                                    <tr style="text-align: center">
                                        <td>
                                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("Usuario_ID") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="usNomeLabel" runat="server"   Text='<%# string.Concat(Eval("Nome"), " ", Eval("Sobrenome")) %> ' ></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="descricaoLabel" runat="server" Text='<%# Eval("DataCadastro") %>'></asp:Label>
                                        </td>

                                        <td>
                                            <i class="material-icons" style="color: green">done</i>
                                            &nbsp 
                                            <asp:LinkButton ID="desbloquearLinkButton" runat="server" OnClick="desbloquearLinkButton_Click" CommandArgument='<%# Eval("Usuario_ID") %>'>Desbloquear Usuário</asp:LinkButton>
                                        </td>
                                    </tr>
                                </tbody>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>


                 <div id="cadastroAtuacao" class="tab-pane fade">
                    <div class="container">
                        <br />
                        <h2>Solicitações de Cadastro
                        </h2>

                        <br />
                        <hr style="background-color: #000521" />
                        <br />

                        <asp:Repeater ID="solicitacoesRepeater" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr style="text-align: center; background-color: #000521; color: #ffffff;">
                                            <th style="width: 5%">SolicitaçãoID</th>
                                            <th style="width: 18%">UsuarioID</th>
                                            <th style="width: 5%">Nome</th>
                                            <th style="width: 15%">Área</th>
                                            <th style="width: 15%">Data de Solicitação</th>
                                            <th style="width: 16%">Ações</th>
                                        </tr>
                                    </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tbody>
                                    <tr style="text-align: center">
                                        <td>
                                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("CadastroAtuacao_ID") %>'></asp:Label>
                                        </td>
                                         <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Usuario_ID") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="usSobrenomeLabel" runat="server" Text='<%# string.Concat(Eval("Nome"), " ", Eval("Sobrenome")) %> '></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="titulolabel" runat="server" Text='<%# Eval("Area") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("DataSolicitacao") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <i class="material-icons" style="color: green">done</i>
                                            &nbsp 
                                            <asp:LinkButton ID="cadastrarLinkButton" runat="server" OnClick="cadastrarLinkButton_Click" CommandArgument='<%# Eval("CadastroAtuacao_ID") %>'>Cadastrar</asp:LinkButton>
                                            <br />
                                            <i class="material-icons" style="color: green">block</i>
                                            &nbsp 
                                            <asp:LinkButton ID="ignorarLinkButton" runat="server" OnClick="ignorarLinkButton_Click" CommandArgument='<%# Eval("CadastroAtuacao_ID") %>'>Já cadastrado</asp:LinkButton>
                                        </td>
                                    </tr>
                                </tbody>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>




                <div  id="cadastroAdministrador" class="tab-pane fade">

                    <div class="container">

                        <style>
                            .desabilitarLink {
                                pointer-events: none;
                            }

                            .preencherCampos {
                                color: #721c24 !important;
                            }

                            .preencherCamposText {
                                border-color: #721c24 !important;
                                background-color: #f8d7da !important;
                            }
                        </style>

                        <script>
                            function limpar() {
                                $("#ContentPlaceHolder1_nomeTextBox").val("");
                                $("#ContentPlaceHolder1_sobrenomeTextBox").val("");
                                $("#ContentPlaceHolder1_dataNascTextBox").val("");
                                $("#ContentPlaceHolder1_emailTextBox").val("");
                                $("#ContentPlaceHolder1_senhaTextBox").val("");
                                $("#ContentPlaceHolder1_repetirSenhaTextBox").val("");
                            }

                        </script>
                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

                        <div class="container h-100">
                            <div class="row align-items-center h-100">
                                <div class="col-12 mx-auto">
                                    <div class="jumbotron h-100" style="background: #ffffff; position: relative; top: 4px;">

                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                <h1 style="color: #000521">Cadastro da conta</h1>
                                            </div>
                                        </div>
                                        <br />
                                        <hr style="background-color: #000521" />
                                        <br />

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
                                        <div class="form-group" hidden id="Div1" runat="server">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                <div class="alert alert-danger">
                                                    <strong>Preencher os campos:</strong>
                                                    <br />
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                            <label id="lbl_Nome" hidden>* Nome</label>
                                                            <p style="margin-bottom: 1px !important"></p>
                                                            <label id="lbl_Sobrenome" hidden>* Sobrenome</label>
                                                            <p style="margin-bottom: 1px !important"></p>
                                                            <label id="lbl_dataNascimento" hidden>* Data de Nascimento</label>
                                                            <p style="margin-bottom: 1px !important"></p>
                                                            <label id="lbl_Email" hidden>* E-mail</label>
                                                            <p style="margin-bottom: 1px !important"></p>
                                                            <label id="lbl_Senha" hidden>* Senha</label>
                                                            <p style="margin-bottom: 1px !important"></p>
                                                            <label id="lbl_RSenha" hidden>* Repetir a Senha</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br />

                                        <h3 style="color: #000521">Dados Pessoais</h3>
                                        <br />
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="div_nome">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="Label2" runat="server" Text="Nome:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="nomeTextBox" runat="server" onBlur="barraProgresso()" class="form-control required"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="div_sobrenome">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="Label1" runat="server" Text="Sobrenome:"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="sobrenomeTextBox" runat="server" onBlur="barraProgresso()" class="form-control required"></asp:TextBox>
                                            </div>
                                        </div>
                                        <p></p>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="div_email">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="Label3" runat="server" Text="E-mail"></asp:Label>
                                                <asp:TextBox ID="emailTextBox" runat="server" onBlur="barraProgresso()" class="form-control required"></asp:TextBox>
                                                <asp:RegularExpressionValidator
                                                    ID="RegularExpressionValidator1"
                                                    runat="server"
                                                    ErrorMessage="E-mail inválido"
                                                    Display="Dynamic"
                                                    ControlToValidate="emailTextBox"
                                                    ValidationExpression="\w+([-+.']\w+)@\w+([-.]\w+)\.\w+([-.]\w+)*"
                                                    ForeColor="Red">
                                                </asp:RegularExpressionValidator>
                                            </div>

                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="div_dataNascimento">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="Label5" runat="server" Text="Data de Nascimento:"></asp:Label>
                                                <asp:TextBox ID="dataNascTextBox" runat="server" onBlur="barraProgresso()" class="form-control required" TextMode="Date"></asp:TextBox>
                                            </div>
                                        </div>
                                        <p></p>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="div_senha">
                                                <span class="msg-obg">* </span>
                                                <asp:Label ID="Label4" runat="server" Text="Senha:"></asp:Label>
                                                <asp:TextBox ID="senhaTextBox" runat="server" onBlur="barraProgresso()" class="form-control required" TextMode="Password"></asp:TextBox>
                                            </div>

                                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="div_rsenha">
                                                <asp:Label ID="Label6" runat="server" Text="Repetir Senha:"></asp:Label>
                                                <asp:TextBox ID="repetirSenhaTextBox" runat="server" onBlur="barraProgresso()" class="form-control required" TextMode="Password"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br />
                                        <hr style="background-color: #000521" />
                                        <br />
                                        <div class="row">
                                            <div class="panel-body">
                                                <asp:Button ID="btn_Salvar" class="btn btn-primary" runat="server" Text="Salvar" OnClick="btn_Salvar_Click" Style="background-color: #000521" />
                                                <input type="button" class="btn btn-secondary" value="Limpar" onclick="limpar()" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>


                </div>

            </div>
        </div>
    </div>


</asp:Content>
