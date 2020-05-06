<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmBuscarPropiedad.aspx.cs" Inherits="WebApplication1.BuscarPropiedad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:Label ID="buscarUsuario" runat="server" Text="Inserte el numero de la propiedad:"></asp:Label>
    <br />
    <tr>
        <td colspan="2" align ="left"> <asp:TextBox ID="txtNumero" runat="server" Width="170px" ></asp:TextBox> </td>
    </tr>
    <br />
    <tr>
      <td colspan="2" align ="center"><asp:Button ID="btnBuscar" runat="server" Text="Buscar" width="150px" OnClick="btnBuscar_Click"/></td>
    </tr>
    <br />
    <br />
    <br />
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
    <asp:Label ID="lblFecha" runat="server" Text="Fecha de inscripcion: " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Fecha" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <tr>
       <td colspan="2" align ="Center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
    </tr>
</asp:Content>
