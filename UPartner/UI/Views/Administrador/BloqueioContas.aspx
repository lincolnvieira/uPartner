<%@ Page Title="" Language="C#" MasterPageFile="~/Views/AppLayout/AppLayout.Master" AutoEventWireup="true" CodeBehind="BloqueioContas.aspx.cs" Inherits="UI.Views.Administrador.BloqueioContas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:button id="denunciadosButton" runat="server" text="Denunciados" />
        <asp:button id="bloqueaddosButton" runat="server" text="Bloqueados" />
    </div>

    <asp:Repeater ID="denunciadosRepeater" runat="server">
        <ItemTemplate>
            <div>
                <img src='<%# "data:" + Eval("MimeType")+";base64," + Convert.ToBase64String((byte[]) Eval("FotoPerfil"))%>' width="400px" height="200px" /><br />
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Quantidade_Denuncia") %>'></asp:Label>
                <div style="float: right;">
                    <asp:LinkButton
                        ID="bloquearLinkButton"
                        runat="server"
                        OnClientClick="javascript:return confirm('Deseja realmente bloquear?')"
                        OnClick="bloquearLinkButton_Click"
                        ComamndArgument='<%# Eval("Usuario_ID") %>'>[BLOQUEAR]</asp:LinkButton>
                </div>
                <div style="float: right;">
                    <asp:LinkButton
                        ID="detalhesLinkButton"
                        runat="server"
                        OnClick="detalhesLinkButton_Click"
                        ComamndArgument='<%# Eval("Usuario_ID") %>'>[DETALHES]</asp:LinkButton>
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>

    <asp:Repeater ID="publicacoesdenunciadasRepeater" runat="server">
        <ItemTemplate>
            <div>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Descricao") %>'></asp:Label>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Data_Publicacao") %>'></asp:Label>
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Quantidade_Denuncia") %>'></asp:Label>
            </div>
        </ItemTemplate>
    </asp:Repeater>

        <asp:Repeater ID="bloqueadosRepeater" runat="server">
        <ItemTemplate>
            <div>
                <img src='<%# "data:" + Eval("MimeType")+";base64," + Convert.ToBase64String((byte[]) Eval("FotoPerfil"))%>' width="400px" height="200px" /><br />
                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>
                <div style="float: right;">
                    <asp:LinkButton
                        ID="desbloquearLinkButton"
                        runat="server"
                        OnClientClick="javascript:return confirm('Deseja realmente desbloquear?')"
                        OnClick="desbloquearLinkButton_Click"
                        ComamndArgument='<%# Eval("Usuario_ID") %>'>[DESBLOQUEAR]</asp:LinkButton>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
