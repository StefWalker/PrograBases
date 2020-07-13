<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmBitacora.aspx.cs" Inherits="WebApplication1.frmBitacora" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="abrigo_formulario"> 
      <h2>Bitacora</h2>
         <br />
    <asp:Label ID="buscarFecha" runat="server" Text="Fecha de inicio:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp "></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Fecha final: "></asp:Label>
    <br />
    <tr>
        <td colspan="2" align ="left"> <asp:TextBox ID="txtInicio" runat="server" Width="170px" ></asp:TextBox> </td>
    </tr>
    <tr>
        <td colspan="2" align ="left"> <asp:TextBox ID="txtFinal" runat="server" Width="170px" ></asp:TextBox> </td>
    </tr>
    <br />
        <br />
    <tr>
                <td>Tipo Entidad:&nbsp; </td>
                <td> <asp:DropDownList ID="lista" runat="server" width="200px">
                    <asp:ListItem Value="1">Propiedad</asp:ListItem>
                    <asp:ListItem Value="2">Propietario</asp:ListItem>
                    <asp:ListItem Value="3">Usuario</asp:ListItem>
                    <asp:ListItem Value="4">Propiedad vs Propietario</asp:ListItem>
                    <asp:ListItem Value="5">Propiedad vs Usuario</asp:ListItem>
                    <asp:ListItem Value="6">Propiedad Juridico</asp:ListItem>
                    <asp:ListItem Value="7">ConceptoCobro</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
         <br />
          <tr>
      <td colspan="2" align ="center"><asp:Button ID="btnBuscar" runat="server" Text="Buscar" width="150px" OnClick="btnBuscar_Click"/></td>
    </tr>
          
 <br />
         <asp:GridView  ID="Bitacora" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width ="740px">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
                 <asp:BoundField DataField="ID_Bitacora" HeaderText="ID_Bitacora" />
                 <asp:BoundField DataField="IdEntityType" HeaderText="IdEntityType" />
                 <asp:BoundField DataField="EntityId" HeaderText="EntityId" />
                 <asp:BoundField DataField="jsonDespues" HeaderText="jsonDespues" />
                 <asp:BoundField DataField="insertedAt" HeaderText="insertedAt" />
                 <asp:BoundField DataField="insertedby" HeaderText="insertedby" />
                 <asp:BoundField DataField="insertedIn" HeaderText="insertedIn" />
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
       <td colspan="2" align ="Center"><asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
    </tr>
</asp:Content>
