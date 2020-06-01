<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmBuscarUsuario.aspx.cs" Inherits="WebApplication1.frmBuscar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:Label ID="buscarUsuario" runat="server" Text="Buscar Usuario"></asp:Label>
    <br />
    <tr>
        <td colspan="2" align ="left"> <asp:TextBox ID="txtNombre" runat="server" Width="170px" ></asp:TextBox> </td>
    </tr>
    <br />
    <tr>
      <td colspan="2" align ="center"><asp:Button ID="btnBuscar" runat="server" Text="Buscar" width="150px" OnClick="btnBuscar_Click"/></td>
    </tr>
    <br />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Usuario:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Nombre" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Password:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Password" runat="server" Font-Size="Medium" ></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Tipo de Usuario:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="TipoUsuario" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <tr>
       <td colspan="2" align ="Center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
    </tr>
    
</asp:Content>
