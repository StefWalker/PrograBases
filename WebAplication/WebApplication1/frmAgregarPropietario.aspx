<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmAgregarPropietario.aspx.cs" Inherits="WebApplication1.frmAgregarPropietario" %>
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
                <td>Numero de Propiedad: </td>
                <td> <asp:TextBox ID="TextBox1" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="auto-style4"></td>
            </tr>
            <tr>
                <td>Identificacion: </td>
                <td> <asp:TextBox ID="txtIdentificacion" runat="server" width="200px"></asp:TextBox></td>
            </tr>
             <tr>
                <td>Nombre de Propietario:&nbsp; </td>
                <td> <asp:TextBox ID="txtNombre" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="auto-style4"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="lblerror" runat="server" Text="Guardar" Width="170px" OnClick="btnGuardar_Click2" /></td>
            </tr>
        </table>
    </div>



</asp:Content>