<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmDeleteUsuario.aspx.cs" Inherits="WebApplication1.frmDeleteUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Eliminar Usuario</h2>
        <br />
        <table>
            <tr>
                <td>Nombre de Usuario: </td>
                <td> <asp:TextBox ID="txtNombre" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Contraseña: </td>
                <td> <asp:TextBox ID="password" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
               <td colspan="2"></td>
                <asp:Label ID="lblerror" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>            
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Width="170px" OnClick="btnEliminar_Click" /></td>
            </tr>
        </table>
</asp:Content>
