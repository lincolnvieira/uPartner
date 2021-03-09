<%@ Page Title="" Language="C#" MasterPageFile="~/Views/AppLayout/AppLayout.Master" AutoEventWireup="true" CodeBehind="CadastroUser.aspx.cs" Inherits="UI.Views.User.CadastroUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<script src="../../Scripts/jquery-3.4.1.min.js"></script>--%>
    <!-- PODE DEIXAR COMENTADO-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>

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

        .selectpicker {
            border: 1px solid #ced4da !important;
        }
    </style>

    <script type="text/javascript">

        function getName() {
            var fileName = $("#ContentPlaceHolder1_flpFoto").val().split("\\").pop();
            $("#ContentPlaceHolder1_flpFoto").siblings(".custom-file-label").addClass("selected").html(fileName);
        }

        function getName() {
            var fileName = $("#ContentPlaceHolder1_flpFoto").val().split("\\").pop();
            $("#ContentPlaceHolder1_flpFoto").siblings(".custom-file-label").addClass("selected").html(fileName);
        }

        $(document).ready(function () {

            $("#ContentPlaceHolder1_txtLogradouro").prop("readonly", true);
            $("#ContentPlaceHolder1_txtBairro").prop("readonly", true);
            $("#ContentPlaceHolder1_txtEstado").prop("readonly", true);
            $("#ContentPlaceHolder1_txtCidade").prop("readonly", true);
        });


        function erroCadastro() {
            $("#modalerroCadastro").modal({
                show: true
            });
        }

        function cadastrarAtuacao() {
            $("#modalAtuacao").modal({
                show: true
            });
        }

        function limparModal() {
            $("#ContentPlaceHolder1_areaTextBox").val("");
        }

        function PreencherArea() {
            $("#ContentPlaceHolder1_areaTextBox").val("Preencha o campo");
        }

        function verificaDadosPessoais() {

            var Nome = $("#ContentPlaceHolder1_txtNome").val();
            var Sobrenome = $("#ContentPlaceHolder1_txtSobrenome").val();
            var DtNascimento = $("#ContentPlaceHolder1_txtDataNascimento").val();
            var tipoConta = $("#ContentPlaceHolder1_cbxTipoConta").val();

            if (tipoConta == 2) {
                if (Nome == "" && Sobrenome == "" && DtNascimento == "") {
                    $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                    $("#div_nome").addClass("preencherCampos");
                    $("#div_sobrenome").addClass("preencherCampos");
                    $("#div_dataNascimento").addClass("preencherCampos");

                    $("#ContentPlaceHolder1_txtNome").addClass("preencherCamposText");
                    $("#ContentPlaceHolder1_txtSobrenome").addClass("preencherCamposText");
                    $("#ContentPlaceHolder1_txtDataNascimento").addClass("preencherCamposText");

                    $("#lbl_Nome").prop("hidden", false);
                    $("#lbl_dataNascimento").prop("hidden", false);
                    $("#lbl_Sobrenome").prop("hidden", false);

                } else if (Nome == "" && Sobrenome != "" && DtNascimento != "") {
                    $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                    $("#div_nome").addClass("preencherCampos");

                    $("#ContentPlaceHolder1_txtNome").addClass("preencherCamposText");

                    $("#lbl_Nome").prop("hidden", false);
                    $("#lbl_dataNascimento").prop("hidden", true);
                    $("#lbl_Sobrenome").prop("hidden", true);

                } else if (Nome == "" && Sobrenome == "" && DtNascimento != "") {
                    $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                    $("#div_nome").addClass("preencherCampos");
                    $("#div_sobrenome").addClass("preencherCampos");

                    $("#ContentPlaceHolder1_txtNome").addClass("preencherCamposText");
                    $("#ContentPlaceHolder1_txtSobrenome").addClass("preencherCamposText");

                    $("#lbl_Nome").prop("hidden", false);
                    $("#lbl_dataNascimento").prop("hidden", true);
                    $("#lbl_Sobrenome").prop("hidden", false);

                } else if (Nome == "" && Sobrenome != "" && DtNascimento == "") {
                    $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                    $("#div_nome").addClass("preencherCampos");
                    $("#div_dataNascimento").addClass("preencherCampos");

                    $("#ContentPlaceHolder1_txtNome").addClass("preencherCamposText");
                    $("#ContentPlaceHolder1_txtDataNascimento").addClass("preencherCamposText");

                    $("#lbl_Nome").prop("hidden", false);
                    $("#lbl_dataNascimento").prop("hidden", false);
                    $("#lbl_Sobrenome").prop("hidden", true);

                } else if (Nome != "" && Sobrenome == "" && DtNascimento == "") {
                    $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                    $("#div_sobrenome").addClass("preencherCampos");
                    $("#div_dataNascimento").addClass("preencherCampos");

                    $("#ContentPlaceHolder1_txtSobrenome").addClass("preencherCamposText");
                    $("#ContentPlaceHolder1_txtDataNascimento").addClass("preencherCamposText");

                    $("#lbl_Nome").prop("hidden", true);
                    $("#lbl_dataNascimento").prop("hidden", false);
                    $("#lbl_Sobrenome").prop("hidden", false);

                } else if (Nome != "" && Sobrenome == "" && DtNascimento != "") {
                    $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                    $("#div_sobrenome").addClass("preencherCampos");

                    $("#ContentPlaceHolder1_txtSobrenome").addClass("preencherCamposText");

                    $("#lbl_Nome").prop("hidden", true);
                    $("#lbl_dataNascimento").prop("hidden", true);
                    $("#lbl_Sobrenome").prop("hidden", false);

                } else if (Nome != "" && Sobrenome != "" && DtNascimento == "") {
                    $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                    $("#div_nome").addClass("preencherCampos");

                    $("#ContentPlaceHolder1_txtDataNascimento").addClass("preencherCamposText");

                    $("#lbl_Nome").prop("hidden", true);
                    $("#lbl_dataNascimento").prop("hidden", false);
                    $("#lbl_Sobrenome").prop("hidden", true);

                }

            } else {

                if (Nome == "" && DtNascimento == "") {
                    console.log("aqui");
                    $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                    $("#div_nome").addClass("preencherCampos");
                    $("#div_dataNascimento").addClass("preencherCampos");

                    $("#ContentPlaceHolder1_txtNome").addClass("preencherCamposText");
                    $("#ContentPlaceHolder1_txtDataNascimento").addClass("preencherCamposText");

                    $("#lbl_Nome_Empresa").prop("hidden", false);
                    $("#lbl_Data_Fundacao").prop("hidden", false);

                } else if (Nome == "" && DtNascimento != "") {
                    $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                    $("#div_nome").addClass("preencherCampos");

                    $("#ContentPlaceHolder1_txtNome").addClass("preencherCamposText");

                    $("#lbl_Nome_Empresa").prop("hidden", false);
                    $("#lbl_Data_Fundacao").prop("hidden", true);

                } else if (Nome != "" && DtNascimento == "") {
                    $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                    $("#div_dataNascimento").addClass("preencherCampos");

                    $("#ContentPlaceHolder1_txtDataNascimento").addClass("preencherCamposText");

                    $("#lbl_Nome_Empresa").prop("hidden", true);
                    $("#lbl_Data_Fundacao").prop("hidden", false);

                } else if (Nome != "" && DtNascimento != "") {
                    $("#ContentPlaceHolder1_Div1").prop("hidden", true);

                    $("#lbl_Nome_Empresa").prop("hidden", true);
                    $("#lbl_Data_Fundacao").prop("hidden", true);

                }
            }
        }

        function verificaDadosConta() {
            var Email = $("#ContentPlaceHolder1_txtEmail").val();
            var Senha = $("#ContentPlaceHolder1_txtSenha").val();
            var RSenha = $("#ContentPlaceHolder1_txtRepetirSenha").val();
            //var Foto = $("#ContentPlaceHolder1_flpFoto").val();

            if (Email == "" && Senha == "" && RSenha == "") {

                $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                $("#div_email").addClass("preencherCampos");
                $("#div_senha").addClass("preencherCampos");
                $("#div_rsenha").addClass("preencherCampos");
                //$("#div_foto").addClass("preencherCampos");

                $("#ContentPlaceHolder1_txtEmail").addClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtSenha").addClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtRepetirSenha").addClass("preencherCamposText");

                $("#lbl_Email").prop("hidden", false);
                $("#lbl_Senha").prop("hidden", false);
                $("#lbl_RSenha").prop("hidden", false);
                //$("#lbl_Foto").prop("hidden", false);

            } else if (Email == "" && Senha != "" && RSenha != "") {

                $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                $("#div_email").addClass("preencherCampos");

                $("#ContentPlaceHolder1_txtEmail").addClass("preencherCamposText");

                $("#lbl_Email").prop("hidden", false);
                $("#lbl_Senha").prop("hidden", true);
                $("#lbl_RSenha").prop("hidden", true);
                //$("#lbl_Foto").prop("hidden", true);

            } else if (Email == "" && Senha == "" && RSenha != "") {

                $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                $("#div_email").addClass("preencherCampos");
                $("#div_senha").addClass("preencherCampos");

                $("#ContentPlaceHolder1_txtEmail").addClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtSenha").addClass("preencherCamposText");

                $("#lbl_Email").prop("hidden", false);
                $("#lbl_Senha").prop("hidden", false);
                $("#lbl_RSenha").prop("hidden", true);
                //$("#lbl_Foto").prop("hidden", true);

            } else if (Email == "" && Senha == "" && RSenha == "") {

                $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                $("#div_email").addClass("preencherCampos");
                $("#div_senha").addClass("preencherCampos");
                $("#div_rsenha").addClass("preencherCampos");

                $("#ContentPlaceHolder1_txtEmail").addClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtSenha").addClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtRepetirSenha").addClass("preencherCamposText");

                $("#lbl_Email").prop("hidden", false);
                $("#lbl_Senha").prop("hidden", false);
                $("#lbl_RSenha").prop("hidden", false);
                //$("#lbl_Foto").prop("hidden", true);

            } else if (Email != "" && Senha == "" && RSenha != "") {

                $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                $("#div_senha").addClass("preencherCampos");

                $("#ContentPlaceHolder1_txtSenha").addClass("preencherCamposText");

                $("#lbl_Email").prop("hidden", true);
                $("#lbl_Senha").prop("hidden", false);
                $("#lbl_RSenha").prop("hidden", true);
                //$("#lbl_Foto").prop("hidden", true);

            } else if (Email != "" && Senha == "" && RSenha == "") {

                $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                $("#div_senha").addClass("preencherCampos");
                $("#div_rsenha").addClass("preencherCampos");

                $("#ContentPlaceHolder1_txtSenha").addClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtRepetirSenha").addClass("preencherCamposText");

                $("#lbl_Email").prop("hidden", true);
                $("#lbl_Senha").prop("hidden", false);
                $("#lbl_RSenha").prop("hidden", false);
                //$("#lbl_Foto").prop("hidden", true);

            } else if (Email != "" && Senha == "" && RSenha == "") {

                $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                $("#div_senha").addClass("preencherCampos");
                $("#div_rsenha").addClass("preencherCampos");
                //$("#div_foto").addClass("preencherCampos");

                $("#ContentPlaceHolder1_txtSenha").addClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtRepetirSenha").addClass("preencherCamposText");

                $("#lbl_Email").prop("hidden", true);
                $("#lbl_Senha").prop("hidden", false);
                $("#lbl_RSenha").prop("hidden", false);
                //$("#lbl_Foto").prop("hidden", false);

            } else if (Email != "" && Senha != "" && RSenha == "") {

                $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                $("#div_rsenha").addClass("preencherCampos");

                $("#ContentPlaceHolder1_txtRepetirSenha").addClass("preencherCamposText");

                $("#lbl_Email").prop("hidden", true);
                $("#lbl_Senha").prop("hidden", true);
                $("#lbl_RSenha").prop("hidden", false);
                //$("#lbl_Foto").prop("hidden", true);

            } else if (Email != "" && Senha != "" && RSenha == "") {

                $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                $("#div_rsenha").addClass("preencherCampos");
                //$("#div_foto").addClass("preencherCampos");

                $("#ContentPlaceHolder1_txtRepetirSenha").addClass("preencherCamposText");

                $("#lbl_Email").prop("hidden", true);
                $("#lbl_Senha").prop("hidden", true);
                $("#lbl_RSenha").prop("hidden", false);
                //$("#lbl_Foto").prop("hidden", false);

            } else if (Email != "" && Senha != "" && RSenha != "") {

                $("#ContentPlaceHolder1_Div1").prop("hidden", false);

                //$("#div_foto").addClass("preencherCampos");

                $("#lbl_Email").prop("hidden", true);
                $("#lbl_Senha").prop("hidden", true);
                $("#lbl_RSenha").prop("hidden", true);
                //$("#lbl_Foto").prop("hidden", false);

            }
        }

        function proximoCadastroPessoias() {
            var Nome = $("#ContentPlaceHolder1_txtNome").val();
            var Sobrenome = $("#ContentPlaceHolder1_txtSobrenome").val();
            var TpConta = $("#ContentPlaceHolder1_cbxTipoConta").val();
            var Atuacao = $("#ContentPlaceHolder1_cbxAtuacao").val();
            var DtNascimento = $("#ContentPlaceHolder1_txtDataNascimento").val();
            var tipoConta = $("#ContentPlaceHolder1_cbxTipoConta").val();

            if (tipoConta == 2) {
                if (Nome != "" && Sobrenome != "" && TpConta != "" && Atuacao != "" && DtNascimento != "") {
                    $("#dadosContaTab").addClass("active");
                    $("#dadosContaTab").removeClass("desabilitarLink");
                    $("#dadosConta").addClass("active");
                    $("#dadosPessoais").removeClass("active");

                    $("#ContentPlaceHolder1_Div1").prop("hidden", true);
                    $("#lbl_Nome").prop("hidden", true);
                    $("#lbl_dataNascimento").prop("hidden", true);
                    $("#lbl_Sobrenome").prop("hidden", true);

                    $("#btn_dados_pessoais").prop("hidden", true);
                    $("#btn_dados_conta").prop("hidden", false);

                } else {
                    verificaDadosPessoais();
                }
            } else {

                if (Nome != "" && TpConta != "" && Atuacao != "" && DtNascimento != "") {
                    $("#dadosContaTab").addClass("active");
                    $("#dadosContaTab").removeClass("desabilitarLink");
                    $("#dadosConta").addClass("active");
                    $("#dadosPessoais").removeClass("active");

                    $("#ContentPlaceHolder1_Div1").prop("hidden", true);
                    $("#lbl_Nome_Empresa").prop("hidden", true);
                    $("#lbl_Data_Fundacao").prop("hidden", true);
                    $("#lbl_Sobrenome").prop("hidden", true);

                    $("#btn_dados_pessoais").prop("hidden", true);
                    $("#btn_dados_conta").prop("hidden", false);

                } else {
                    verificaDadosPessoais();
                }
            }
        }

        function validaCamposPreenchidos() {
            var Nome = $("#ContentPlaceHolder1_txtNome").val();
            var Sobrenome = $("#ContentPlaceHolder1_txtSobrenome").val();
            var DtNascimento = $("#ContentPlaceHolder1_txtDataNascimento").val();
            var Email = $("#ContentPlaceHolder1_txtEmail").val();
            var Senha = $("#ContentPlaceHolder1_txtSenha").val();
            var RSenha = $("#ContentPlaceHolder1_txtRepetirSenha").val();
            var Foto = $("#ContentPlaceHolder1_flpFoto").val();
            var Cep = $("#ContentPlaceHolder1_txtCEP").val();
            var Logradouro = $("#ContentPlaceHolder1_txtLogradouro").val();
            var Bairro = $("#ContentPlaceHolder1_txtBairro").val();
            var Estado = $("#ContentPlaceHolder1_txtEstado").val();
            var Cidade = $("#ContentPlaceHolder1_txtCidade").val();
            var Numero = $("#ContentPlaceHolder1_txtNumero").val();

            if (Nome != "" && Sobrenome == "" && DtNascimento == "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_nome").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtNome").removeClass("preencherCamposText");

            } else if (Nome == "" && Sobrenome != "" && DtNascimento == "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_sobrenome").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtSobrenome").removeClass("preencherCamposText");

            } else if (Nome == "" && Sobrenome == "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_dataNascimento").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtDataNascimento").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento == "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_nome").removeClass("preencherCampos");
                $("#div_sobrenome").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtNome").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtSobrenome").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome == "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_nome").removeClass("preencherCampos");
                $("#div_dataNascimento").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtNome").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtDataNascimento").removeClass("preencherCamposText");

            } else if (Nome == "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_sobrenome").removeClass("preencherCampos");
                $("#div_dataNascimento").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtSobrenome").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtDataNascimento").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_nome").removeClass("preencherCampos");
                $("#div_sobrenome").removeClass("preencherCampos");
                $("#div_dataNascimento").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtNome").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtSobrenome").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtDataNascimento").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_email").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtEmail").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha != "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_senha").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtSenha").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_rsenha").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtRepetirSenha").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_email").removeClass("preencherCampos");
                $("#div_senha").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtEmail").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtSenha").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha == "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_email").removeClass("preencherCampos");
                $("#div_rsenha").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtEmail").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtRepetirSenha").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_email").removeClass("preencherCampos");


                $("#ContentPlaceHolder1_txtEmail").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha != "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_senha").removeClass("preencherCampos");
                $("#div_rsenha").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtSenha").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtRepetirSenha").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha != "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_senha").removeClass("preencherCampos");


                $("#ContentPlaceHolder1_txtSenha").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_rsenha").removeClass("preencherCampos");


                $("#ContentPlaceHolder1_txtRepetirSenha").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_email").removeClass("preencherCampos");
                $("#div_senha").removeClass("preencherCampos");
                $("#div_rsenha").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtEmail").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtSenha").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtRepetirSenha").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_email").removeClass("preencherCampos");
                $("#div_senha").removeClass("preencherCampos");


                $("#ContentPlaceHolder1_txtEmail").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtSenha").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha == "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_email").removeClass("preencherCampos");
                $("#div_rsenha").removeClass("preencherCampos");


                $("#ContentPlaceHolder1_txtEmail").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtRepetirSenha").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha != "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_senha").removeClass("preencherCampos");
                $("#div_rsenha").removeClass("preencherCampos");


                $("#ContentPlaceHolder1_txtSenha").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtRepetirSenha").removeClass("preencherCamposText");

            } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                $("#div_email").removeClass("preencherCampos");
                $("#div_senha").removeClass("preencherCampos");
                $("#div_rsenha").removeClass("preencherCampos");


                $("#ContentPlaceHolder1_txtEmail").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtSenha").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtRepetirSenha").removeClass("preencherCamposText");

            }
        }

        function proximoCadastroEndereco() {
            var Email = $("#ContentPlaceHolder1_txtEmail").val();
            var Senha = $("#ContentPlaceHolder1_txtSenha").val();
            var RSenha = $("#ContentPlaceHolder1_txtRepetirSenha").val();
            var Foto = $("#ContentPlaceHolder1_flpFoto").val();

            if (Email != "" && Senha != "" && RSenha != "") {
                $("#enderecoTab").addClass("active");
                $("#enderecoTab").removeClass("desabilitarLink");
                $("#endereco").addClass("active");
                $("#dadosPessoais").removeClass("active");
                $("#dadosConta").removeClass("active");

                //DEIXA HIDDEN A MENSAGEM DE PREENCHER TODOS OS CAMPOS
                $("#ContentPlaceHolder1_Div1").prop("hidden", true);
                $("#lbl_Email").prop("hidden", true);
                $("#lbl_dataNascimento").prop("hidden", true);
                $("#lbl_RSenha").prop("hidden", true);
                $("#lbl_Foto").prop("hidden", true);

                //DEIXA HIDDEN OS BOTÕES DO CADASTRO DE ENDEREÇO
                $("#btn_dados_pessoais").prop("hidden", true);
                $("#btn_dados_conta").prop("hidden", true);
                $("#btn_endereco").prop("hidden", false);

            } else {
                verificaDadosConta();
            }
        }

        function retornarCadastroPessoais() {

            $("#dadosContaTab").removeClass("active");
            $("#dadosContaTab").addClass("desabilitarLink");
            $("#dadosConta").removeClass("active");
            $("#dadosPessoais").addClass("active");

            $("#btn_dados_pessoais").prop("hidden", false);
            $("#btn_dados_conta").prop("hidden", true);
        }

        function limparEndereco() {

            $("#ContentPlaceHolder1_txtCEP").val("");
            $("#ContentPlaceHolder1_txtLogradouro").val("");
            $("#ContentPlaceHolder1_txtBairro").val("");
            $("#ContentPlaceHolder1_txtEstado").val("");
            $("#ContentPlaceHolder1_txtCidade").val("");
            $("#ContentPlaceHolder1_txtNumero").val("");
            $("#ContentPlaceHolder1_txtComplemento").val("");

        }

        function limparDadosConta() {

            $("#ContentPlaceHolder1_txtEmail").val("");
            $("#ContentPlaceHolder1_txtSenha").val("");
            $("#ContentPlaceHolder1_txtRepetirSenha").val("");
            $("#ContentPlaceHolder1_txtSobre").val("");
            $("#ContentPlaceHolder1_flpFoto").val("");

        }

        function limparDadosPessoais() {

            $("#ContentPlaceHolder1_txtNome").val("");
            $("#ContentPlaceHolder1_txtSobrenome").val("");
            $("#ContentPlaceHolder1_txtDataNascimento").val("");

        }

        function retornarCadastroConta() {

            $("#enderecoTab").removeClass("active");
            $("#enderecoTab").addClass("desabilitarLink");
            $("#endereco").removeClass("active");
            $("#dadosConta").addClass("active");

            $("#btn_dados_conta").prop("hidden", false);
            $("#btn_endereco").prop("hidden", true);
        }

        function consultaCep() {

            if ($("#ContentPlaceHolder1_txtCEP").val() && $("#ContentPlaceHolder1_txtCEP").val() != "") {

                $.ajax({
                    url: 'https://viacep.com.br/ws/' + $("#ContentPlaceHolder1_txtCEP").val() + '/json/unicode/',
                    dataType: "json",
                    cache: false,
                }).done(function (data) {
                    montarEndereco(data);

                }).fail(function (errorThrown) {

                    alert("CEP digitado não existe. " + errorThrown);
                    $("#ContentPlaceHolder1_txtCEP").val('');
                    $("#ContentPlaceHolder1_txtCEP").focus();
                });
            }
        }

        function trocaConta() {
            var tipoConta = $("#ContentPlaceHolder1_cbxTipoConta").val();

            console.log(tipoConta);

            if (tipoConta == 2) {
                $("#ContentPlaceHolder1_Div1").prop("hidden", true);
                $("#lbl_Nome_Empresa").prop("hidden", true);
                $("#lbl_Data_Fundacao").prop("hidden", true);
                $("#ContentPlaceHolder1_lblNome").prop("hidden", false);
                $("#ContentPlaceHolder1_lblDataNascimento").prop("hidden", false);

                $("#div_sobrenome").prop("hidden", false);
                $("#ContentPlaceHolder1_lblNomeEmpresa").prop("hidden", true);
                $("#ContentPlaceHolder1_lblDataFundacao").prop("hidden", true);

                $("#div_nome").removeClass("preencherCampos");
                $("#div_sobrenome").removeClass("preencherCampos");
                $("#div_dataNascimento").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtNome").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtSobrenome").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtDataNascimento").removeClass("preencherCamposText");
            } else {
                $("#ContentPlaceHolder1_Div1").prop("hidden", true);
                $("#lbl_Nome").prop("hidden", true);
                $("#lbl_dataNascimento").prop("hidden", true);
                $("#lbl_Sobrenome").prop("hidden", true);

                $("#ContentPlaceHolder1_lblNome").prop("hidden", true);
                $("#ContentPlaceHolder1_lblNomeEmpresa").prop("hidden", false);
                $("#ContentPlaceHolder1_lblDataNascimento").prop("hidden", true);
                $("#ContentPlaceHolder1_lblDataFundacao").prop("hidden", false);
                $("#div_sobrenome").prop("hidden", true);

                $("#div_nome").removeClass("preencherCampos");
                $("#div_dataNascimento").removeClass("preencherCampos");

                $("#ContentPlaceHolder1_txtNome").removeClass("preencherCamposText");
                $("#ContentPlaceHolder1_txtDataNascimento").removeClass("preencherCamposText");
            }
        }

        function barraProgresso() {
            var Nome = $("#ContentPlaceHolder1_txtNome").val();
            var Sobrenome = $("#ContentPlaceHolder1_txtSobrenome").val();
            var DtNascimento = $("#ContentPlaceHolder1_txtDataNascimento").val();
            var Email = $("#ContentPlaceHolder1_txtEmail").val();
            var Senha = $("#ContentPlaceHolder1_txtSenha").val();
            var RSenha = $("#ContentPlaceHolder1_txtRepetirSenha").val();
            var Cep = $("#ContentPlaceHolder1_txtCEP").val();
            var Logradouro = $("#ContentPlaceHolder1_txtLogradouro").val();
            var Bairro = $("#ContentPlaceHolder1_txtBairro").val();
            var Estado = $("#ContentPlaceHolder1_txtEstado").val();
            var Cidade = $("#ContentPlaceHolder1_txtCidade").val();
            var Numero = $("#ContentPlaceHolder1_txtNumero").val();
            var Foto = $("#ContentPlaceHolder1_flpFoto").val();
            var tipoConta = $("#ContentPlaceHolder1_cbxTipoConta").val();

            console.log(tipoConta);

            if (tipoConta == 2) {

                $("#ContentPlaceHolder1_lblNome").prop("hidden", false);
                $("#ContentPlaceHolder1_lblNomeEmpresa").prop("hidden", true);
                $("#div_sobrenome").prop("hidden", false);

                if (Nome != "" && Sobrenome == "" && DtNascimento == "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {
                    $("#barraProgresso").css("width", "21%");

                    validaCamposPreenchidos();

                } else if (Nome == "" && Sobrenome != "" && DtNascimento == "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {
                    $("#barraProgresso").css("width", "21%");

                    $("#div_sobrenome").removeClass("preencherCampos");

                    validaCamposPreenchidos();

                } else if (Nome == "" && Sobrenome == "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "21%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento == "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "28%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome == "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "28%");

                    validaCamposPreenchidos();

                } else if (Nome == "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "28%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "35%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "42%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha != "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "42%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "42%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "42%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "49%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha == "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "49%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "49%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha != "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "49%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha != "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "49%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "49%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "56%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "56%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha == "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "56%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email == "" && Senha != "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "56%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "63%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep != "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {
                    $("#barraProgresso").css("width", "70%");
                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep != "" && Logradouro != "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {
                    $("#barraProgresso").css("width", "77%");
                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep != "" && Logradouro != "" && Bairro != "" && Estado == "" && Cidade == "" && Numero == "") {
                    $("#barraProgresso").css("width", "84%");
                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep != "" && Logradouro != "" && Bairro != "" && Estado != "" && Cidade != "" && Numero == "") {
                    $("#barraProgresso").css("width", "91%");
                } else if (Nome != "" && Sobrenome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep != "" && Logradouro != "" && Bairro != "" && Estado != "" && Cidade != "" && Numero != "") {
                    $("#barraProgresso").css("width", "100%");
                } else {
                    $("#barraProgresso").css("width", "14%");
                }

            } else {

                if (Nome != "" && Sobrenome == "" && DtNascimento == "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {
                    $("#barraProgresso").css("width", "26%");

                    validaCamposPreenchidos();

                } else if (Nome == "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "26%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "35%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "42%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email == "" && Senha != "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "42%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "42%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "42%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "49%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha == "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "49%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha == "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "49%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email == "" && Senha != "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "49%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email == "" && Senha != "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "49%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email == "" && Senha == "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "49%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "56%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha == "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "56%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha == "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "56%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email == "" && Senha != "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "56%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep == "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {

                    $("#barraProgresso").css("width", "63%");

                    validaCamposPreenchidos();

                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep != "" && Logradouro == "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {
                    $("#barraProgresso").css("width", "70%");
                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep != "" && Logradouro != "" && Bairro == "" && Estado == "" && Cidade == "" && Numero == "") {
                    $("#barraProgresso").css("width", "77%");
                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep != "" && Logradouro != "" && Bairro != "" && Estado == "" && Cidade == "" && Numero == "") {
                    $("#barraProgresso").css("width", "84%");
                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep != "" && Logradouro != "" && Bairro != "" && Estado != "" && Cidade != "" && Numero == "") {
                    $("#barraProgresso").css("width", "91%");
                } else if (Nome != "" && DtNascimento != "" && Email != "" && Senha != "" && RSenha != "" && Cep != "" && Logradouro != "" && Bairro != "" && Estado != "" && Cidade != "" && Numero != "") {
                    $("#barraProgresso").css("width", "100%");
                } else {
                    $("#barraProgresso").css("width", "14%");
                }

            }

        }

        function montarEndereco(data) {

            if (data && !data.erro) {

                if (data.logradouro && data.logradouro != "")
                    $("#ContentPlaceHolder1_txtLogradouro").val(data.logradouro);
                $("#ContentPlaceHolder1_txtLogradouro").prop("readonly", true);

                if (data.bairro && data.bairro != "")
                    $("#ContentPlaceHolder1_txtBairro").val(data.bairro);
                $("#ContentPlaceHolder1_txtBairro").prop("readonly", true);

                if (data.uf && data.uf != "")
                    $("#ContentPlaceHolder1_txtEstado").val(data.uf);
                $("#ContentPlaceHolder1_txtEstado").prop("readonly", true);

                if (data.localidade && data.localidade != "")
                    $("#ContentPlaceHolder1_txtCidade").val(data.localidade);
                $("#ContentPlaceHolder1_txtCidade").prop("readonly", true);

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

                    <ul class="nav nav-tabs" role="tablist" hidden>
                        <li class="nav-item" aria-disabled="true">
                            <a class="nav-link active" id="dadosPessoaisTab" data-toggle="tab" href="#dadosPessoais" hidden>Dados Pessoais</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link desabilitarLink" id="dadosContaTab" data-toggle="tab" href="#dadosConta" hidden>Dados da Conta</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link desabilitarLink" id="enderecoTab" data-toggle="tab" href="#endereco" hidden>Endereço</a>
                        </li>
                    </ul>
                    <div class="container">
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated" id="barraProgresso" style="width: 14%"></div>
                        </div>
                    </div>
                    <br />
                    <hr style="background-color: #000521" />
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
                    <div class="form-group" hidden id="Div1" runat="server">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <div class="alert alert-danger">
                                <strong>Preencher os campos:</strong>
                                <br />
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <label id="lbl_Nome" hidden>* Nome</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_Nome_Empresa" hidden>* Nome da Empresa</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_Sobrenome" hidden>* Sobrenome</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_dataNascimento" hidden>* Data de Nascimento</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_Data_Fundacao" hidden>* Data de Fundação</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_Email" hidden>* E-mail</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_Senha" hidden>* Senha</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_RSenha" hidden>* Repetir a Senha</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_Foto" hidden>* Foto</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_Cep" hidden>* CEP</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_Logradouro" hidden>* Logradouro</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_Bairro" hidden>* Bairro</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_Estado" hidden>* Estado</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_Cidade" hidden>* Cidade</label>
                                        <p style="margin-bottom: 1px !important"></p>
                                        <label id="lbl_Numero" hidden>* Numero</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="tab-content">
                        <div id="dadosPessoais" class="container tab-pane active">

                            <h3 style="color: #000521">Dados Pessoais</h3>

                            <div class="row" style="color: #000521">
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="div_nome">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblNome" runat="server" Text="Nome:"></asp:Label>
                                    <asp:Label ID="lblNomeEmpresa" runat="server" Text="Nome da Empresa:" hidden></asp:Label>

                                    <br />
                                    <asp:TextBox ID="txtNome" runat="server" onBlur="barraProgresso()" class="form-control required"></asp:TextBox>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" hidden>
                                    <span class="msg-obg" hidden="hidden">* </span>
                                    <asp:Label ID="Label3" runat="server" Text="Nome da Empresa:" Visible="false"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="empresaTextBox" runat="server" onBlur="barraProgresso()" class="form-control required" Visible="false"></asp:TextBox>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="div_sobrenome">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="Label1" runat="server" Text="Sobrenome:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtSobrenome" runat="server" onBlur="barraProgresso()" class="form-control required"></asp:TextBox>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblTipoConta" runat="server" Text="Tipo de Conta:"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="cbxTipoConta" runat="server" onBlur="barraProgresso();" onChange="trocaConta()" class="form-control required" OnSelectedIndexChanged="cbxTipoConta_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblAtuacao" runat="server" Text="Tipo de Atuação:"></asp:Label>
                                    <br />
                                    <asp:ListBox ID="atuacaoListBox" runat="server" onBlur="barraProgresso()" multiple="multiple" class="form-control selectpicker required" SelectionMode="Multiple"></asp:ListBox>
                                    <br />
                                    <asp:LinkButton ID="cadastrarAtuacaoLinkButton" runat="server" OnClick="cadastrarAtuacaoLinkButton_Click">Não encontrou sua área de atuação?</asp:LinkButton>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 hidden" id="divCPF" hidden>
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblCPF" runat="server" Text="CPF:"></asp:Label>
                                    <asp:TextBox ID="txtCPF" runat="server" class="form-control hidden"></asp:TextBox>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 hidden" id="divCNPJ" hidden>
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblCNPJ" runat="server" Text="CNPJ:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtCNPJ" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="div_dataNascimento">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblDataNascimento" runat="server" Text="Data de Nascimento:"></asp:Label>
                                    <asp:Label ID="lblDataFundacao" runat="server" Text="Data de Fundação:" hidden></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtDataNascimento" runat="server" onBlur="barraProgresso()" TextMode="Date" class="form-control required"></asp:TextBox>
                                </div>
                            </div>
                            <br>
                            <br />
                            <hr style="background-color: #000521" />
                            <br />
                        </div>
                        <div id="dadosConta" class="container tab-pane ">

                            <h3 style="color: #000521">Dados da Conta</h3>

                            <div class="row" style="color: #000521">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="div_email">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblEmail" runat="server" Text="E-mail:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtEmail" runat="server" onBlur="barraProgresso()" class="form-control"></asp:TextBox>
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

                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="div_senha">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblSenha" runat="server" Text="Senha:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtSenha" runat="server" onBlur="barraProgresso()" class="form-control" TextMode="Password"></asp:TextBox>
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

                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" id="div_rsenha">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblRepetirSenha" runat="server" Text="Repetir Senha:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtRepetirSenha" TextMode="Password" onBlur="barraProgresso()" runat="server" class="form-control"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server"
                                        ControlToValidate="txtRepetirSenha"
                                        ForeColor="Red"
                                        ControlToCompare="txtSenha"
                                        ErrorMessage="Senhas divergentes"
                                        ToolTip="A senhas precisam ser iguais" />
                                </div>
                            </div>
                            <br />
                            <div class="row" style="color: #000521">
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                    <asp:Label ID="lblSobre" runat="server" Text="Sobre você:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtSobre" TextMode="multiline" Columns="50" Rows="5" runat="server" class="form-control" Style="resize: none"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="div_foto">
                                <%--<span class="msg-obg">* </span>--%>
                                <asp:Label ID="Label2" runat="server" Text="Foto de Perfil: "></asp:Label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="material-icons">camera_alt</i></span>
                                    </div>
                                    <div class="custom-file">
                                        <asp:FileUpload ID="flpFoto" CssClass="custom-file-input" onChange="getName()" runat="server" />

                                        <label class="custom-file-label" for="imagemUpload">Escolha seu arquivo</label>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <br />
                            <hr style="background-color: #000521" />
                            <br />
                        </div>
                        <div id="endereco" class="container tab-pane">
                            <h3 style="color: #000521">Endereço</h3>

                            <div class="row" style="color: #000521">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblCEP" runat="server" Text="CEP:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtCEP" runat="server" onBlur="barraProgresso(); consultaCep()" class="form-control" OnTextChanged="txtCEP_TextChanged"></asp:TextBox>
                                </div>
                            </div>

                            <br />
                            <div class="row" style="color: #000521">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblLogradouro" runat="server" Text="Logradouro (Rua):"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtLogradouro" onBlur="barraProgresso()" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblBairro" runat="server" Text="Bairro:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtBairro" onBlur="barraProgresso()" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblEstado" runat="server" Text="Estado:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtEstado" onBlur="barraProgresso()" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <br />
                            <div class="row" style="color: #000521">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblCidade" runat="server" Text="Cidade:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtCidade" onBlur="barraProgresso()" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <span class="msg-obg">* </span>
                                    <asp:Label ID="lblNumero" runat="server" Text="Número:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtNumero" onBlur="barraProgresso()" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <asp:Label ID="lblComplemento" runat="server" Text="Complemento:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtComplemento" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <hr style="background-color: #000521" />
                            <br />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="panel-body">
                                <div id="btn_dados_pessoais">
                                    <input type="button" class="btn btn-secondary" id="btnProximoPessoais" onclick="proximoCadastroPessoias()" value="Proximo">
                                    <input type="button" class="btn btn-secondary" value="Limpar" onclick="limparDadosPessoais()" />
                                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Cancelar" OnClick="btn_Cancelar_Click" Style="position: relative; left: 75%; background-color: #000521" />
                                </div>
                                <div id="btn_dados_conta" hidden="hidden">
                                    <input type="button" class="btn btn-secondary" id="btnProximoEndereco" onclick="proximoCadastroEndereco()" value="Proximo">
                                    <input type="button" class="btn btn-secondary" id="btnRetornarPessoais" onclick="retornarCadastroPessoais()" value="Retornar">
                                    <input type="button" class="btn btn-secondary" value="Limpar" onclick="limparDadosConta()" />
                                    <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Cancelar" OnClick="btn_Cancelar_Click" Style="position: relative; left: 65%; background-color: #000521" />
                                </div>
                                <div id="btn_endereco" hidden="hidden">
                                    <asp:Button ID="btn_Salvar" class="btn btn-primary" runat="server" Text="Salvar" OnClick="btn_Salvar_Click" Style="background-color: #000521" />
                                    <input type="button" class="btn btn-secondary" value="Limpar" onclick="limparEndereco()" />
                                    <input type="button" class="btn btn-secondary" id="btnRetornarConta" onclick="retornarCadastroConta()" value="Retornar">

                                    <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="Cancelar" OnClick="btn_Cancelar_Click" Style="position: relative; left: 68%; background-color: #000521" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- Modal Sucesso -->
    <div class="modal fade" id="modalerroCadastro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        E-mail já cadastrado !!!
                    </center>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>
            <!-- MODAL Solicitar Cadastro -->
            <div class="modal fade" id="modalAtuacao" tabindex="-1" onblur="limparModal()" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Solcitar cadastro de Atuação
                            </h5>
                            <button type="button" onclick="limparModal()" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <asp:TextBox ID="areaTextBox" onBlur="verificarCampos()" runat="server" class="form-control" placeholder="*Área"></asp:TextBox>

                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="cadastrarButton" runat="server" Text="Solicitar" class="btn btn-primary" OnClick="cadastrarButton_Click" />
                            <button type="button" onclick="limparModal()" class="btn btn-secondary" data-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
