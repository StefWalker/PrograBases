<%@ Page Title="" Language="C#" MasterPageFile="~/AnonimoUser.Master" AutoEventWireup="true" CodeBehind="frmVerComprobante.aspx.cs" Inherits="WebApplication1.frmVerComprobante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="abrigo_formulario"> 
      <h2>Detalles del comprobante </h2>
    
    <br />
    <asp:Label ID="Label1" runat="server" Text="Numero del comprobante:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="numero" runat="server" Font-Size="Medium"></asp:Label>
     <br />
    <asp:Label ID="Label5" runat="server" Text="Numero de propiedad:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="propiedad" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Fecha del comprobante:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Fecha" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Medio de pago:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="medio" runat="server" Font-Size="Medium" ></asp:Label>
     <br />
    <asp:Label ID="Label4" runat="server" Text="Monto:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="monto" runat="server" Font-Size="Medium" ></asp:Label>
    <br />
    <asp:Button runat="server" Text="Ver Detalle" />
    <br />
    <tr>
       <td colspan="2" align ="Center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
    </tr>
</asp:Content>
