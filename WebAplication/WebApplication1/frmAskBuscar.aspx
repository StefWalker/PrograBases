<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmAskBuscar.aspx.cs" Inherits="WebApplication1.AskBuscar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Buscar Entidades</h2>
        <br />
        <table style="height: 200px">
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnDel" runat="server" Text="Buscar Propiedad" Width="208px" OnClick="btnPropiedad_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnDelPro" runat="server" Text="Buscar Propietario" Width="211px" OnClick="btnPropietario_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="Buscar Usuario" Width="208px" OnClick="btnUsuario_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button2" runat="server" Text="Buscar Propietario Juridico" Width="211px" OnClick="btnProJur_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button3" runat="server" Text="Buscar ProxPro" Width="211px" OnClick="btnProPro_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button4" runat="server" Text="Buscar ProxUser" Width="211px" OnClick="btnUserPro_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button5" runat="server" Text="Buscar ProxProJuridico" Width="211px" OnClick="btnProProJur_Click" /></td>
            </tr>
             <tr>
                <td colspan="2" align="center"><asp:Button ID="Button6" runat="server" Text="Buscar ProxCConsumo" Width="211px" OnClick="btnProCConsumo_Click" /></td>
            </tr>
            
        </table>
</asp:Content>
