<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmAskAgregarJuridico.aspx.cs" Inherits="WebApplication1.frmAskAgregarJuridico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Nuevo Propietario</h2>
        <br />
        <table style="height: 110px">
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnNuevo" runat="server" Text="Nuevo" Width="208px" OnClick="btnNuevo_Click" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnConPro" runat="server" Text="Con Propiedad Existente" Width="211px" OnClick="btnConPro_Click1" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
