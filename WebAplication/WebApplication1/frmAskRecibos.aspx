<%@ Page Title="" Language="C#" MasterPageFile="~/AnonimoUser.Master" AutoEventWireup="true" CodeBehind="frmAskRecibos.aspx.cs" Inherits="WebApplication1.frmAskRecibo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="abrigo_formulario"> 
      <h2>Recibos</h2>
        <br />
        <table style="height: 110px">
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnPagos" runat="server" Text="Recibos Pagos" Width="208px" OnClick="btnPagos_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnPendientes" runat="server" Text="Recibos pendientes" Width="211px" OnClick="btnPendientes_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="Comprobantes" runat="server" Text="Comprobantes" Width="208px" OnClick="btnComprbantes_Click" /></td>
            </tr>
          
</asp:Content>
