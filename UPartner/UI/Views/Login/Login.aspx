<%@ Page Title="" Language="C#" MasterPageFile="~/Views/AppLayout/AppLayout.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UI.Views.Login.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function erroLogin(flgErro) {

            if (flgErro == 1) {
                $('#textoErroModal').text("Sua conta foi bloqueada!");
            }
            else if (flgErro == 2) {
                $('#textoErroModal').text("Email ou Senha inválidos!");
            }

            $("#modalErroLogin").modal({
                show: true
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container h-100">
        <div class="row align-items-center h-100">
            <div class="col-6 mx-auto">
                <%--<center>--%>
                <div class="jumbotron h-100" style="background: #ffffff; position: relative; top: 20px; border-radius: 50px;">
                    <%--Título.--%>
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                        <center style="color: #000521"><h1 style="font-size:24px">Olá, Seja Bem-Vindo</h1></center>
                        <p>
                            <label style="font-style: italic;">"Oportunidades não surgem. É você que as cria" - Chris Grosser</label>
                    </div>
                    <br>
                    <%--Mensagem de validação de campos.--%>
                    <div class="form-group" style="display: none;" id="mensagemErro" runat="server">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <div class="alert alert-danger">
                                <strong>Preencher os campos:</strong>
                                <br />
                                <asp:Label ID="errorEmail" runat="server" Text="* E-mail"></asp:Label>
                                <br />
                                <asp:Label ID="errorSenha" runat="server" Text="* Senha"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <%--Mensagem de Aviso para o usuário.--%>
                    <div class="form-group" style="display: none;" id="mensagemAviso" runat="server">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <div id="tipoDiv" runat="server">
                                <p id="modalMensagem" runat="server"></p>
                            </div>
                        </div>
                    </div>
                    <%--Formulário.--%>
                    <div class="row" style="color: #ffffff">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="E-mail"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1"
                                runat="server"
                                ErrorMessage="E-mail inválido"
                                Display="Dynamic"
                                ControlToValidate="txtEmail"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <br />
                    <div class="row" style="color: #ffffff">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <asp:TextBox ID="txtSenha" TextMode="Password" runat="server" class="form-control" placeholder="Senha"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator2"
                                runat="server"
                                ErrorMessage="Senha inválida"
                                Display="Dynamic"
                                ControlToValidate="txtSenha"
                                ValidationExpression="^.*(?=.{8,})(?=.*[\d])(?=.*[\W]).*$"
                                ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <asp:Label ID="respostaLabel" runat="server" Text="" CssClass="alert-danger"></asp:Label>
                    <br />
                    <br />
                    <center>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <asp:LinkButton ID="esqueceuSenhaLinkButton" Style="color: #0073b1" runat="server" OnClick="recuperarSenhaLinkButton_Click">Esqueceu a senha?</asp:LinkButton>
                        </div>
                    </div>
                    <p>
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                <label style="color: #000000">Novo no UPartner?</label>&nbsp&nbsp<asp:LinkButton ID="cadastrarLinkButton" Style="color: #0073b1" runat="server" OnClick="cadastrarLinkButton_Click">Cadastre-se</asp:LinkButton>
                            </div>
                        </div>
                        </center>
                    <br />
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <center>
                                    <asp:Button style="width:30%; background:#000521; border-color:#000521" ID="btnLogin" runat="server" Text="Entrar" class="btn btn-primary" OnClick="btn_Login_Click" />
                                </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal ERRO -->
    <div class="modal fade" id="modalErroLogin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="margin-top:15%;">
            <div class="modal-content">
                <div class="modal-header">
                    <i style="color:yellow;" class="material-icons">report_problem</i>&nbsp Atenção
                     <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                         <span aria-hidden="true">&times;</span>
                     </button>
                </div>
                <div class="modal-body">
                    <center>
                        <p id="textoErroModal"></p>
                    </center>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
