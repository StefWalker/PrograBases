<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmBuscarPropJuridico.aspx.cs" Inherits="WebApplication1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <asp:Label ID="buscarPropJuridico" runat="server" Text="Ingrese el numero de identificacion del propietario juridico: "></asp:Label>
    <br />
    <tr>
        <td colspan="2" align ="left"> <asp:TextBox ID="txtID" runat="server" Width="170px" ></asp:TextBox> </td>
    </tr>
    <br />
    <tr>
      <td colspan="2" align ="center"><asp:Button ID="btnBuscar" runat="server" Text="Buscar" width="150px" OnClick="btnBuscar_Click"/></td>
    </tr>
    <br />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Identificacion Juridica:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="ID" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Tipo del documento:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Tipo" runat="server" Font-Size="Medium" ></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Nombre del propietario fisico:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="PropFisico" runat="server" Font-Size="Medium" ></asp:Label>
        <br />
    <asp:Label ID="Label5" runat="server" Text="Identificación del propietario:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="Label6" runat="server" Font-Size="Medium" ></asp:Label>
    <tr>
       <td colspan="2" align ="Center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
    </tr>
</asp:Content>
