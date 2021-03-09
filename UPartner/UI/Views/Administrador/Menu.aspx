<%@ Page Title="" Language="C#" MasterPageFile="~/Views/AppLayout/AppLayout.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="UI.Views.Administrador.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script>

        window.onload = function () {
            $("#usuariosDenunciados").addClass('hidden');
            $("#publicacoesDenunciadas").addClass('hidden');
            $("#usuariosBloqueados").addClass('hidden');
        };

        function activeLinkUsuDen() {
            $("#usuariosDenunciados").addClass('active');
            $("#usuariosDenunciados").addClass('show');
            $("#usuariosDenunciados").removeClass('hidden');

            $("#publicacoesDenunciadas").removeClass('active');
            $("#publicacoesDenunciadas").removeClass('show');
            $("#publicacoesDenunciadas").addClass('hidden');

            $("#usuariosBloqueados").removeClass('active');
            $("#usuariosBloqueados").removeClass('show');
            $("#usuariosBloqueados").addClass('hidden');
        }

        function activeLinkPubDen() {
            $("#publicacoesDenunciadas").addClass('active');
            $("#publicacoesDenunciadas").addClass('show');
            $("#publicacoesDenunciadas").removeClass('hidden');

            $("#usuariosBloqueados").removeClass('active');
            $("#usuariosBloqueados").removeClass('show');
            $("#usuariosBloqueados").addClass('hidden');

            $("#usuariosDenunciados").removeClass('active');
            $("#usuariosDenunciados").removeClass('show');
            $("#usuariosDenunciados").addClass('hidden');
        }

        function activeLinkUsuBlq() {
            $("#usuariosBloqueados").addClass('active');
            $("#usuariosBloqueados").addClass('show');
            $("#usuariosBloqueados").removeClass('hidden');

            $("#usuariosDenunciados").removeClass('active');
            $("#usuariosDenunciados").removeClass('show');
            $("#usuariosDenunciados").addClass('hidden');

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
                            <asp:Label ID="nomeLabel" runat="server" Text="Gabriel"></asp:Label>
                            <asp:Label ID="sobrenomeLabel" runat="server" Text="Rodrigues"></asp:Label>
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
                            <a data-toggle="tab" href="#usuariosDenunciados" onclick="activeLinkUsuDen()">Usuários Denunciados</a>
                            <a data-toggle="tab" href="#publicacoesDenunciadas" onclick="activeLinkPubDen()">Publicações Denunciadas</a>
                            <a data-toggle="tab" href="#usuariosBloqueados" onclick="activeLinkUsuBlq()">Usuários Bloqueados</a>
                            <a data-toggle="tab" href="#Logout" onclick="activeLinkUsuBlq()">Logout</a>
                        </ul>
                    </ul>
                    <button type="button" class="btn btn-link" style="padding-left: 0px;" id="teste" data-toggle="modal" data-target=".bd-example-modal-lg" onclick="novoEvento(2)" hidden="hidden">Alterar Evento</button><br />

                </div>
            </div>

            <div class="col-md-9 gedf-main">
                <%--<div id="usuariosDenunciados" class="tab-pane fade show active">--%>
                <div id="usuariosDenunciados" class="tab-pane fade">
                    <div class="container">
                        <br />
                        <h2>Usuários Denunciados</h2>

                        <br />
                        <hr style="background-color: #000521" />
                        <br />

                        <table class="table table-bordered">
                            <thead>
                                <tr style="text-align: center; background-color: #000521; color: #ffffff;">
                                    <th style="width: 5%">ID</th>
                                    <th style="width: 18%">Nome</th>
                                    <th style="width: 5%">Qtd de Denuncias</th>
                                    <th style="width: 15%">Tipo de denuncia</th>
                                    <th style="width: 20%">Descrição</th>
                                    <th style="width: 10%">Data da Denuncia</th>
                                    <th style="width: 16%">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="text-align: center">
                                    <td>1</td>
                                    <td>Gabriel Rodrigues</td>
                                    <td>7</td>
                                    <td>Nome Falso</td>
                                    <td>Usuário possui o nome falso, o nome dele é João</td>
                                    <td>05/11/2019</td>
                                    <td><i class="material-icons" style="color: green">done</i>&nbsp<i class="material-icons" style="color: red">block</i></td>
                                </tr>
                                <tr style="text-align: center">
                                    <td>2</td>
                                    <td>Lincoln Vieira</td>
                                    <td>1</td>
                                    <td>Nome Ofensivo</td>
                                    <td>Usuário possui o nome ofensivo, não gostei do nome do usuário</td>
                                    <td>03/11/2019</td>
                                    <td><i class="material-icons" style="color: green">done</i>&nbsp<i class="material-icons" style="color: red">block</i></td>
                                </tr>
                                <tr style="text-align: center">
                                    <td>3</td>
                                    <td>Marcelo Gomez</td>
                                    <td>3</td>
                                    <td>Outros</td>
                                    <td>...</td>
                                    <td>03/11/2019</td>
                                    <td><i class="material-icons" style="color: green">done</i>&nbsp<i class="material-icons" style="color: red">block</i></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="publicacoesDenunciadas" class="tab-pane fade">
                    <div class="container">
                        <br />
                        <h2>Publicações Denunciadas</h2>

                        <br />
                        <hr style="background-color: #000521" />
                        <br />

                        <table class="table table-bordered">
                            <thead>
                                <tr style="text-align: center; background-color: #000521; color: #ffffff;">
                                    <th style="width: 5%">ID</th>
                                    <th style="width: 20%">Nome</th>
                                    <th style="width: 5%">Qtd de Denuncias</th>
                                    <th style="width: 15%">Tipo de denuncia</th>
                                    <th style="width: 20%">Descrição</th>
                                    <th style="width: 10%">Data da Denuncia</th>
                                    <th style="width: 10%">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="text-align: center">
                                    <td>1</td>
                                    <td>Gabriel Rodrigues</td>
                                    <td>15</td>
                                    <td>Publicação inapropriada</td>
                                    <td>Usuário publicou uma imagem de um rato comendo maça</td>
                                    <td>07/11/2019</td>
                                    <td><i class="material-icons" style="color: green">done</i>&nbsp<i class="material-icons" style="color: red">delete</i></td>
                                </tr>
                                <tr style="text-align: center">
                                    <td>2</td>
                                    <td>Marcelo Gomez</td>
                                    <td>32</td>
                                    <td>Publicação Preconceituosa</td>
                                    <td>Usuário publicou um texto racista</td>
                                    <td>01/11/2019</td>
                                    <td><i class="material-icons" style="color: green">done</i>&nbsp<i class="material-icons" style="color: red">delete</i></td>
                                </tr>
                                <tr style="text-align: center">
                                    <td>3</td>
                                    <td>Rafael Takeshi</td>
                                    <td>25</td>
                                    <td>Nudez</td>
                                    <td>Usuário publicou uma imagem de conteuno inapropriado</td>
                                    <td>08/11/2019</td>
                                    <td><i class="material-icons" style="color: green">done</i>&nbsp<i class="material-icons" style="color: red">delete</i></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="usuariosBloqueados" class="tab-pane fade">
                    <%--<div id="usuariosBloqueados" class="tab-pane fade">--%>
                    <div class="container">
                        <br />
                        <h2>Usuários Bloqueados</h2>

                        <br />
                        <hr style="background-color: #000521" />
                        <br />

                        <table class="table table-bordered">
                            <thead>
                                <tr style="text-align: center; background-color: #000521; color: #ffffff;">
                                    <th style="width: 5%">ID</th>
                                    <th style="width: 20%">Nome</th>
                                    <th style="width: 30%">Motivo do Bloqueio</th>
                                    <th style="width: 10%">Data de Cadastro</th>
                                    <th style="width: 10%">Data da Denuncia</th>
                                    <th style="width: 10%">Data do Bloqueio</th>
                                    <th style="width: 10%">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr style="text-align: center">
                                    <td>1</td>
                                    <td>Lincoln Vieira</td>
                                    <td>Usuário publicou uma imagem de um rato comendo queijo acompanhado de um texto inapropriado</td>
                                    <td>02/11/2019</td>
                                    <td>05/11/2019</td>
                                    <td>08/11/2019</td>
                                    <td><i class="material-icons" style="color: green">done</i></td>
                                </tr>
                                <tr style="text-align: center">
                                    <td>2</td>
                                    <td>Heitor Fernandes</td>
                                    <td>...</td>
                                    <td>04/11/2019</td>
                                    <td>07/11/2019</td>
                                    <td>09/11/2019</td>
                                    <td><i class="material-icons" style="color: green">done</i></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
