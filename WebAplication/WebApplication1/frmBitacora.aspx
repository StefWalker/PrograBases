<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmBitacora.aspx.cs" Inherits="WebApplication1.frmBitacora" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="abrigo_formulario"> 
      <h2>Nueva Entrada</h2>
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
         <asp:GridView runat="server" AutoGenerateColumns="False">
             <Columns>
                 <asp:BoundField DataField="ID_Bitacora" HeaderText="ID_Bitacora" />
                 <asp:BoundField DataField="IdEntityType" HeaderText="IdEntityType" />
                 <asp:BoundField DataField="EntityId" HeaderText="EntityId" />
                 <asp:BoundField DataField="jsonDespues" HeaderText="jsonDespues" />
                 <asp:BoundField DataField="insertedAt" HeaderText="insertedAt" />
                 <asp:BoundField DataField="insertedby" HeaderText="insertedby" />
                 <asp:BoundField DataField="insertedIn" HeaderText="insertedIn" />
             </Columns>
         </asp:GridView>
</asp:Content>
