<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmAskAgregarEntidades.aspx.cs" Inherits="WebApplication1.frmAskAgregarEntidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style4 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Agregar Entidades</h2>
        <br />
        <table style="height: 200px">
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnDel" runat="server" Text="Agregar Propiedad" Width="208px" OnClick="btnPropiedad_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnDelPro" runat="server" Text="Agregar Propietario" Width="211px" OnClick="btnPropietario_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="Agregar Usuario" Width="208px" OnClick="btnUsuario_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button2" runat="server" Text="Agregar Propietario Juridico" Width="211px" OnClick="btnProJur_Click" /></td>
            </tr>
        </table>
</asp:Content>
