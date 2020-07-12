<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmBitacora.aspx.cs" Inherits="WebApplication1.frmBitacora" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <tr>
                <td>Tipo de Entidad:&nbsp; </td>
                <td> <asp:DropDownList ID="lista" runat="server" width="200px">
                    <asp:ListItem Value="1">Propiedad</asp:ListItem>
                    <asp:ListItem Value="2">Propietario</asp:ListItem>
                    <asp:ListItem Value="3">Usuario</asp:ListItem>
                    <asp:ListItem Value="4">Propiedad vs Propietario</asp:ListItem>
                    <asp:ListItem Value="5">Propiedad vs Usuario</asp:ListItem>
                    <asp:ListItem Value="6">Propietario Juridico</asp:ListItem>
                    <asp:ListItem Value="7">Concepto de cobro</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
    <br />
    <asp:Label ID="buscarUsuario" runat="server" Text="Ingrese la fecha inicial: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"></asp:Label>
     <asp:Label ID="Label1" runat="server" Text="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspIngrese la fecha final: "></asp:Label>
    <br />
    <tr>
        <td colspan="2" align ="left"> <asp:TextBox ID="txtUser" runat="server" Width="170px" ></asp:TextBox> </td>
        <td colspan="2" align ="left"> <asp:TextBox ID="TextBox1" runat="server" Width="170px" ></asp:TextBox> </td>
    </tr> 
    <tr>
       <td colspan="2" align ="Center"><asp:Label ID="lblerror" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
    </tr>
     <br />
    <tr>
      <td colspan="2" align ="center"><asp:Button ID="btnBuscar" runat="server" Text="Buscar" width="150px" OnClick="btnBuscar_Click"/></td>
    </tr>
     <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  CellPadding="4" ForeColor="#333333" GridLines="None" Width ="740px" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ID_Bitacora" HeaderText="ID" />
            <asp:BoundField DataField="IdEntityType" HeaderText="Tipo de entidad" />
            <asp:BoundField DataField="EntityId" HeaderText="Id de la entidad" />
            <asp:BoundField DataField="jsonAntes" HeaderText="JSON anterior" />
            <asp:BoundField DataField="jsonDespues" HeaderText="JSON Actual" />
            <asp:BoundField DataField="insertedAt" HeaderText="Fecha" />
            <asp:BoundField DataField="insertedby" HeaderText="Usuario " />
            <asp:BoundField DataField="insertedIn" HeaderText="Dirección IP " />
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
   
</asp:Content>
