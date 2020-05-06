<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmAgregarUsuario.aspx.cs" Inherits="WebApplication1.frmAgregar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Nuevo Usuario</h2>
        <br />
        <table>
            <tr>
                <td>Nombre de Usuario : </td>
                <td> <asp:TextBox ID="txtNombre" runat="server" width="200px"></asp:TextBox></td>
            </tr>
             <tr>
                <td>Password: </td>
                <td> <asp:TextBox ID="txtPassword" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Tipo de Usuario: </td>
                <td> <asp:TextBox ID="txtUsuario" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
               <td colspan="2"></td>
                <asp:Label ID="lblerror" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>            
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnGuardar" runat="server" Text="Siguiente" Width="170px" OnClick="btnGuardar_Click" /></td>
            </tr>
        </table>
    </div>


</asp:Content>
