<%@ Page Title="" Language="C#" MasterPageFile="~/Views/AppLayout/AppLayout.Master" AutoEventWireup="true" CodeBehind="EsqueceuSenha.aspx.cs" Inherits="UI.Views.Login.EsqueceuSenha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function erroEsqueceuSenha() {
            $("#modalerroesqueceusenha").modal({
                show: true
            });
        }

        function sucessoEsqueceuSenha() {
            var txtEmail = $("#ContentPlaceHolder1_emailTextBox").val();
            var labelEmail = $("#lblEmail").text(txtEmail);
            $("#modalsucessoesqueceusenha").modal({
                show: true
            }); 
        }

        function redirecionamentoLogin() {
            window.location.href = "Login.aspx";
        }
    </script>
    <div class="container h-100">
        <div class="row align-items-center h-100">
            <div class="col-6 mx-auto">
                <div class="jumbotron h-100" style="background: #ffffff; position: relative; top: 70px; border-radius: 50px">
                    <%--Título.--%>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <%--<center>--%>
                            <h1 style="color: #000521; font-size: 24px">Esqueceu sua senha?</h1>
                            <p>
                                <label style="color: #000521; font-size: 18px;">Não se preocupe! Enviaremos uma nova senha para o seu e-mail.</label>
                        </div>
                        <%--</center>--%>
                    </div>
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
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <asp:TextBox ID="emailTextBox" runat="server" class="form-control" placeholder="E-mail"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <asp:Button ID="btnVoltar" runat="server" Text="Voltar" style="background-color:#ffffff; border-color:#000521; color:#000521; width:30%;" class="btn btn-secondary" OnClick="voltarLinkButton_Click" />

                            <asp:Button ID="btnEnviar" runat="server" Text="Solicitar nova senha" Style="background-color: #000521; border-color: #000521" class="btn btn-primary" OnClick="enviarLinkButton_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Atenção -->
    <div class="modal fade" id="modalerroesqueceusenha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        Ocorreu um problema durante a operação!
                        <p style="margin-bottom: 0px !important"> Verifique se informou o E-mail corretamente.</p>
                        <p style="margin-bottom: 0px !important"> Caso E-mail informado for o correto, tente novamente!</p>
                    </center>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Sucesso -->
    <div class="modal fade" id="modalsucessoesqueceusenha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="margin-top:15%;">
            <div class="modal-content">
                <div class="modal-header">
                    <i class="material-icons" style="color:green">check_circle</i>&nbsp Sucesso
                     <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                         <span aria-hidden="true">&times;</span>
                     </button>
                </div>
                <div class="modal-body">
                    <center>
                        Um E-mail foi enviado para "<label id="lblEmail">E-mail</label>" com a sua Nova Senha!
                    </center>
                </div>
                <div class="modal-footer">
                    <button type="button" onclick="redirecionamentoLogin()" class="btn btn-primary" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
