<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmUnirUserPro.aspx.cs" Inherits="WebApplication1.frmUnirUserPro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
     <h2>Unir usuario con una Propiedad</h2>
     <tr>
             <td>Numero de propiedad: </td>
             <td> <asp:TextBox ID="txtProp" runat="server" width="200px"></asp:TextBox></td>
     </tr>
     <tr>
            <td>Nombre de Usuario: </td>
            <td> <asp:TextBox ID="txtUsuario" runat="server" width="200px"></asp:TextBox></td>
    </tr>
    <tr>
           <td colspan="2"></td>
           <asp:Label ID="lblError" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>            
    </tr>
    <tr>
        <td colspan="2" align="center"><asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="170px" OnClick="btnGuardar_Click" /></td>
   </tr>
    </table>
</asp:Content>
