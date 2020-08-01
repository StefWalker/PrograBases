<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmGenerarAP.aspx.cs" Inherits="WebApplication1.frmGenerarAP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h2>Generar AP</h2>
     <br />
    <asp:Label ID="buscarUsuario" runat="server" Text="Ingrese el nombre de usuario: "></asp:Label>
    <br />
    <tr>
        <td colspan="2" align ="left"> <asp:TextBox ID="usuario" runat="server" Width="170px" ></asp:TextBox> </td>
    </tr>
    <br />
    <tr>
      <td colspan="2" align ="center"><asp:Button ID="btnBuscar" runat="server" Text="Buscar" width="150px" OnClick="btnBuscar_Click"/></td>
    </tr>
    <h2>Propiedades asociadas</h2>
      <asp:GridView ID="grvPropiedades" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width ="740px" OnSelectedIndexChanged="grvPropiedades_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ID_Propiedad" HeaderText="ID de la Propiedad" />
            <asp:BoundField DataField="NumPropiedad" HeaderText="Numero de Finca" />
            <asp:BoundField DataField="Direccion" HeaderText="Direccion " />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
            <asp:BoundField DataField="Valor" HeaderText="Valor" />
            <asp:BoundField DataField="M3Acumulados" HeaderText="M3Acumulados" />
            <asp:BoundField DataField="M3AcumuladosUltimoRecibo" HeaderText="M3 Ultimo Recibo" />
            <asp:CommandField HeaderText="Ver Recibos" ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />

    </asp:GridView>
    <tr>
       <td colspan="2" align ="Center"><asp:Label ID="lblerror" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
    </tr>
</asp:Content>
