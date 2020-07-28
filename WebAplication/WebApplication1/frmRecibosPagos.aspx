<%@ Page Title="" Language="C#" MasterPageFile="~/AnonimoUser.Master" AutoEventWireup="true" CodeBehind="frmRecibosPagos.aspx.cs" Inherits="WebApplication1.frmRecibosPagos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <br />
      <tr>
           <td colspan="2"></td>
           <asp:Label ID="lblerror" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>            
    </tr>
     <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ID_Recibo" HeaderText="ID_Recibo" />
            <asp:BoundField DataField="ID_Propiedad" HeaderText="ID_Propiedad" />
            <asp:BoundField DataField="ID_Concepto" HeaderText="ID_Concepto" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
            <asp:BoundField DataField="Monto" HeaderText="Monto" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
       </asp:GridView>

</asp:Content>
