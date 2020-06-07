<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmBuscarProCC.aspx.cs" Inherits="WebApplication1.frmBuscarProCC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Buscar datos de un Concepto Cobro de una Propiedad</h2>
        <br />
        <table>
            <tr>
                <td>ID Concepto Cobro: </td>
                <td> <asp:TextBox ID="txtId" runat="server" width="200px"></asp:TextBox></td>
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
    <asp:Label ID="lblDireccion" runat="server" Text="Direccion: " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Direccion" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label ID="lblTipo" runat="server" Text="Tipo CC:   " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Tipo" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label ID="lblConcepto" runat="server" Text="Concepto: " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Concepto" runat="server" Font-Size="Medium" ></asp:Label>
    <br />
    <asp:Label ID="lblVencimiento" runat="server" Text="FechaVencimiento: " Font-Size="Medium"></asp:Label>
    <asp:Label ID="FechaVencimiento" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label ID="lblFecha" runat="server" Text="Fecha:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Fecha" runat="server" Font-Size="Medium"></asp:Label>
    <tr>
            <tr>
               <td colspan="2"></td>
                <asp:Label ID="lblerror" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>            
            </tr>
            
        </table>
    </div>
</asp:Content>
