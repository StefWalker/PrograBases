<%@ Page Title="" Language="C#" MasterPageFile="~/AnonimoUser.Master" AutoEventWireup="true" CodeBehind="frmVerAP.aspx.cs" Inherits="WebApplication1.VerAP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <br />
         <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_AP" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="ID_AP" HeaderText="ID_AP" InsertVisible="False" ReadOnly="True" SortExpression="ID_AP" />
        <asp:BoundField DataField="ID_Propiedad" HeaderText="ID_Propiedad" SortExpression="ID_Propiedad" />
        <asp:BoundField DataField="ID_Comprobante" HeaderText="ID_Comprobante" SortExpression="ID_Comprobante" />
        <asp:BoundField DataField="MontoInicial" HeaderText="MontoInicial" SortExpression="MontoInicial" />
        <asp:BoundField DataField="Saldo" HeaderText="Saldo" SortExpression="Saldo" />
        <asp:BoundField DataField="TasaInteres" HeaderText="TasaInteres" SortExpression="TasaInteres" />
        <asp:BoundField DataField="PlazoInicial" HeaderText="PlazoInicial" SortExpression="PlazoInicial" />
        <asp:BoundField DataField="Cuota" HeaderText="Cuota" SortExpression="Cuota" />
        <asp:BoundField DataField="FechaCreacion" HeaderText="FechaCreacion" SortExpression="FechaCreacion" />
        <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
        <asp:CommandField HeaderText="Ver Movimientos " ShowHeader="True" ShowSelectButton="True" />
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoBasesConnectionString3 %>" SelectCommand="SELECT * FROM [AP] WHERE ([ID_Propiedad] = @ID_Propiedad)">
    <SelectParameters>
        <asp:QueryStringParameter Name="ID_Propiedad" QueryStringField="ID_Propiedad" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
