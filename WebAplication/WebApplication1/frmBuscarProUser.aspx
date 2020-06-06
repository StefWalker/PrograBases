<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmBuscarProUser.aspx.cs" Inherits="WebApplication1.frmBuscarProUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Buscar datos de una Propiedad de un Usuario</h2>
        <br />
        <table>
            <tr>
                <td>Nombre del usuario: </td>
                <td> <asp:TextBox ID="txtUser" runat="server" width="200px"></asp:TextBox></td>
            </tr>
             <tr>
                <td>Numero de la propiedad: </td>
                <td> <asp:TextBox ID="txtPropiedad" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <br />
            <table>
    <tr>
      <td colspan="2" align ="center"><asp:Button ID="btnBuscar" runat="server" Text="Buscar" width="150px" OnClick="btnBuscar_Click"/></td>
    </tr>
 
    <asp:Label ID="lblNumero" runat="server" Text="Numero de Propiedad:   " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Numero" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label ID="lblValor" runat="server" Text="Valor: " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Valor" runat="server" Font-Size="Medium" ></asp:Label>
    <br />
    <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion: " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Descripcion" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label ID="lblDireccion" runat="server" Text="Direccion: " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Direccion" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Usuario:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Nombre" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Password:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Password" runat="server" Font-Size="Medium" ></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Tipo de Usuario:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="TipoUsuario" runat="server" Font-Size="Medium"></asp:Label>
    <tr>
            <tr>
               <td colspan="2"></td>
                <asp:Label ID="lblerror" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>            
            </tr>
            
        </table>
    </div>
</asp:Content>
