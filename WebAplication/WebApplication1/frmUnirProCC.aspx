<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmUnirProCC.aspx.cs" Inherits="WebApplication1.frmUnirProCC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Nuevo Propietario x Concepto Cobro</h2>
        <br />
        <table style="height: 110px">
            <tr>
                <td>Numero de Propiedad: </td>
                <td> <asp:TextBox ID="NumPropiedad" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Concepto Cobro: </td>
                <td> <asp:TextBox ID="TextBox1" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="auto-style4"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="lblError" runat="server" Text="Guardar" Width="170px" OnClick="btnGuardar_Click" /></td>
            </tr>
</asp:Content>
