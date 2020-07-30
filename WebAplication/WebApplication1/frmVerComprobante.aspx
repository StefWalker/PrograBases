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
    <asp:Label ID="Label2" runat="server" Text="Medio de pago:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="medio" runat="server" Font-Size="Medium" ></asp:Label>
     <br />
    <asp:Label ID="Label4" runat="server" Text="Monto:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="monto" runat="server" Font-Size="Medium" ></asp:Label>
       
    <br />
    <asp:Label ID="Label6" runat="server" Text="Detalle:  " Font-Size="Medium"></asp:Label>
    <tr>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ID_Recibo" HeaderText="Numero de Recibo" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha del recibo" />
                <asp:BoundField DataField="ID_Concepto" HeaderText="ID Concepto" />
                <asp:BoundField HeaderText="Concepto de cobro" />
                <asp:BoundField HeaderText="Dia Vencimiento" />
                <asp:BoundField DataField="Monto" HeaderText="Monto" />
            </Columns>
       </asp:GridView>
       <td colspan="2" align ="Center"><asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
    </tr>
</asp:Content>
