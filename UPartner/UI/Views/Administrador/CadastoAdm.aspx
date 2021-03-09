<%@ Page Title="" Language="C#" MasterPageFile="~/Views/AppLayout/AppLayout.Master" AutoEventWireup="true" CodeBehind="CadastoAdm.aspx.cs" Inherits="UI.Views.Administrador.CadastoAdm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

                    <div class="container">
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated" id="barraProgresso" style="width: 14%"></div>
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
                            <asp:Label ID="nomeLabel" runat="server" Text="Nome:"></asp:Label>
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
                            <asp:Label ID="Label2" runat="server" Text="E-mail"></asp:Label>
                            <asp:TextBox ID="emailTextBox" runat="server" onBlur="barraProgresso()" class="form-control required"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1"
                                runat="server"
                                ErrorMessage="E-mail inválido"
                                Display="Dynamic"
                                ControlToValidate="emailTextBox"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
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
                            <asp:Label ID="Label3" runat="server" Text="Senha:"></asp:Label>
                            <asp:TextBox ID="senhaTextBox" runat="server" onBlur="barraProgresso()" class="form-control required" TextMode="Password"></asp:TextBox>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="div_rsenha">
                            <asp:Label ID="Label4" runat="server" Text="Repetir Senha:"></asp:Label>
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
                            <asp:Button ID="btn_Voltar" runat="server" Text="Voltar" class="btn btn-primary" Style="background-color: #000521; position: relative; left: 395%" OnClick="btn_Voltar_Click" />
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
