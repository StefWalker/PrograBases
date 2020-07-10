<%@ Page Title="" Language="C#" MasterPageFile="~/AnonimoUser.Master" AutoEventWireup="true" CodeBehind="frmComprobantes.aspx.cs" Inherits="WebApplication1.frmComprobantes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:Label ID="buscarFinca" runat="server" Text="Ingrese el numero de finca: "></asp:Label>
    <br />
    <tr>
        <td colspan="2" align ="left"> <asp:TextBox ID="txtFinca" runat="server" Width="170px" ></asp:TextBox> </td>
    </tr>
    <tr>
       <td colspan="2" align ="Center"><asp:Label ID="lblerror" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
    </tr>
     <br />
    <tr>
      <td colspan="2" align ="center"><asp:Button ID="btnBuscar" runat="server" Text="Buscar" width="150px" OnClick="btnBuscar_Click"/></td>
    </tr>
     <br />
</asp:Content>
