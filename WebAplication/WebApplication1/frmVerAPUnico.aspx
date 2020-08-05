<%@ Page Title="" Language="C#" MasterPageFile="~/AnonimoUser.Master" AutoEventWireup="true" CodeBehind="frmVerAPUnico.aspx.cs" Inherits="WebApplication1.frmVerAP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <br />
         <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Movimiento" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ID_Movimiento" HeaderText="ID_Movimiento" InsertVisible="False" ReadOnly="True" SortExpression="ID_Movimiento" />
            <asp:BoundField DataField="ID_AP" HeaderText="ID_AP" SortExpression="ID_AP" />
            <asp:BoundField DataField="TipoMov" HeaderText="TipoMov" SortExpression="TipoMov" />
            <asp:BoundField DataField="InteresMes" HeaderText="InteresMes" SortExpression="InteresMes" />
            <asp:BoundField DataField="Amortizacion" HeaderText="Amortizacion" SortExpression="Amortizacion" />
            <asp:BoundField DataField="plazoResta" HeaderText="plazoResta" SortExpression="plazoResta" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
            <asp:BoundField DataField="ID_Recibo" HeaderText="ID_Recibo" SortExpression="ID_Recibo" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoBasesConnectionString2 %>" SelectCommand="SELECT * FROM [MovimientoAP] WHERE ([ID_AP] = @ID_AP)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID_AP" QueryStringField="ID_AP" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
