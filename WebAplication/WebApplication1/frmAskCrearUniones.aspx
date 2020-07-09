<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmAskCrearUniones.aspx.cs" Inherits="WebApplication1.frmAskCrearUniones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style type="text/css">
        .auto-style4 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="abrigo_formulario"> 
      <h2>Crear uniones entre entidades</h2>
        <br />
        <table style="height: 200px">
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnDel" runat="server" Text="Crear unión Propiedad Propietario" Width="208px" OnClick="btnPropxPro_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnDelPro" runat="server" Text="Crear unión Propiedad Usuario" Width="211px" OnClick="btnProxUser_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="Crear unión Propiedad  Propietario Juridico" Width="208px" OnClick="btnProxProJur_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button2" runat="server" Text="Crear unión propiedad y Cconsumo" Width="211px" OnClick="btnProCConsumo_Click" /></td>
            </tr>
        </table>
</asp:Content>
