<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmAskDelete.aspx.cs" Inherits="WebApplication1.frmAskDelete" %>
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
                <td colspan="2" align="center"><asp:Button ID="btnDel" runat="server" Text="Eliminar Propiedad" Width="208px" OnClick="btnDel_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnDelPro" runat="server" Text="Eliminar Propietario" Width="211px" OnClick="btnDelPro_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="Eliminar Usuario" Width="208px" OnClick="btnDelUsu_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button2" runat="server" Text="Eliminar Propietario Juridico" Width="211px" OnClick="btnDelJur_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button3" runat="server" Text="Eliminar la union de un Propietario y una Propiedad" Width="211px" OnClick="btnProPro_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button4" runat="server" Text="Eliminar la union de un Usuario y una Propiedad" Width="211px" OnClick="btnUserPro_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Button5" runat="server" Text="Eliminar la union de un propietario juridico y una Propiedad" Width="211px" OnClick="btnPJurPro_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
