<%@ Page Title="" Language="C#" MasterPageFile="~/AnonimoUser.Master" AutoEventWireup="true" CodeBehind="frmAskRecibos.aspx.cs" Inherits="WebApplication1.frmAskRecibos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Recibos</h2>
        <br />
        <table style="height: 110px">
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnNueva" runat="server" Text="Recibos pendientes" Width="208px" OnClick="btnPendientes_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnConPro" runat="server" Text="Recibos Pagos" Width="211px" OnClick="btnPagos_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnConUsu" runat="server" Text="Comprobantes de pago" Width="211px" OnClick="btnComprobantes_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
