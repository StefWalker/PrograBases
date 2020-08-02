<%@ Page Title="" Language="C#" MasterPageFile="~/AnonimoUser.Master" AutoEventWireup="true" CodeBehind="frmConfirmacion.aspx.cs" Inherits="WebApplication1.frmConfirmacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <tr>
       <td colspan="2" align ="Center"><asp:Label ID="lblerror" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
    </tr>
    <div id="abrigo_formulario"> 
      <h2>Confirmacion de comprobante</h2>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ID_Recibo" HeaderText="ID_Recibo" />
                <asp:BoundField DataField="ID_Propiedad" HeaderText="ID_Propiedad" />
                <asp:BoundField DataField="ID_Concepto" HeaderText="ID_Concepto" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                <asp:BoundField DataField="Monto" HeaderText="Monto" />
            </Columns>
        </asp:GridView>
        <br />
    <asp:Label ID="lblNumero" runat="server" Text="Total a pagar:   " Font-Size="Medium"></asp:Label>
    <asp:Label ID="total" runat="server" Font-Size="Medium"></asp:Label>
    <br />
</asp:Content>
