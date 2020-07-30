<%@ Page Title="" Language="C#" MasterPageFile="~/AnonimoUser.Master" AutoEventWireup="true" CodeBehind="frmPendientes.aspx.cs" Inherits="WebApplication1.frmPendientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />
   

     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width ="740px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ID_Recibo" HeaderText="ID Recibo" />
            <asp:BoundField DataField="ID_Propiedad" HeaderText="ID_Propiedad" />
            <asp:BoundField DataField="ID_Concepto" HeaderText="ID_Concepto" />
            <asp:BoundField HeaderText="Concepto" />
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
         <br />
      <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ID_Recibo" DataValueField="ID_Recibo" Width="728px">
      </asp:CheckBoxList>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoBasesConnectionString %>" SelectCommand="SELECT DISTINCT [ID_Recibo], [ID_Concepto], [Fecha], [Monto], [Estado] FROM [Recibos] WHERE (([Estado] = @Estado) AND ([ID_Propiedad] = @ID_Propiedad)) ORDER BY [Fecha] DESC">
          <SelectParameters>
              <asp:Parameter DefaultValue="0" Name="Estado" Type="Int32" />
              <asp:QueryStringParameter Name="ID_Propiedad" QueryStringField="ID_Propiedad" Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>
    
     <br />
    <br />
     <tr>
       <td colspan="2" align ="Center"><asp:Label ID="Label1" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
      <br />
    
    <tr>
      <td colspan="2" align ="center"><asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" width="150px" OnClick="btnConfirmar_Click"/></td>
    </tr>
    <br />
     <tr>
       <td colspan="2" align ="Center"><asp:Label ID="lblerror" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
     
</asp:Content>
