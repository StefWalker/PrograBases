<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmAskPropiedad.aspx.cs" Inherits="WebApplication1.frmAskPropiedad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Nueva Propiedad</h2>
        <br />
        <table style="height: 110px">
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnNueva" runat="server" Text="Nueva" Width="208px" OnClick="btnNueva_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnConPro" runat="server" Text="Con Propietario Existente" Width="211px" OnClick="btnConPro_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnConUsu" runat="server" Text="Con Usuario Existente" Width="211px" OnClick="btnConUsu_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
