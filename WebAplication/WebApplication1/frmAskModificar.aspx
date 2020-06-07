<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmAskModificar.aspx.cs" Inherits="WebApplication1.AskModificar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        .auto-style4 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Eliminar Entidades</h2>
        <br />
        <table style="height: 110px">
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnModUser" runat="server" Text="Modificar Usuario" Width="208px" OnClick="btnModificarUsuario_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnModProp" runat="server" Text="Modificar Propiedad" Width="211px" OnClick="btnModificarPropiedad_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="Modificar Propietario" Width="208px" OnClick="btnModificarProp_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button2" runat="server" Text="Modificar Propietario Juridico" Width="211px" OnClick="btnModificarJuridico_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button3" runat="server" Text="Modificar unión entre ProxPro " Width="211px" OnClick="btnModificarProPro_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button4" runat="server" Text="Modificar unión entre ProxUser" Width="211px" OnClick="btnModificarUserPro_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button5" runat="server" Text="Modificar unión entre ProxPJuridico" Width="211px" OnClick="btnModificarPJurPro_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
