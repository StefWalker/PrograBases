<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmUnirProPro.aspx.cs" Inherits="WebApplication1.frmUnirProPro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
     <h2>Unir Propiedad existente con usuario existente</h2>
     <tr>
             <td>Numero de propiedad: </td>
             <td> <asp:TextBox ID="txtProp" runat="server" width="200px"></asp:TextBox></td>
     </tr>
     <tr>
            <td>Identificación del usuario: </td>
            <td> <asp:TextBox ID="txtID" runat="server" width="200px"></asp:TextBox></td>
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
