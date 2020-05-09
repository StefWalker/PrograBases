<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmDeletePropietario.aspx.cs" Inherits="WebApplication1.frmDeletePropietario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Eliminar Propietario</h2>
        <br />
        <table>
            <tr>
                <td>Identificacion : </td>
                <td> <asp:TextBox ID="txtIdentificacion" runat="server" width="200px"></asp:TextBox></td>
            </tr>
             <tr>
                <td>Nombre del Propietario: </td>
                <td> <asp:TextBox ID="txtNombre" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
               <td colspan="2"></td>
                <asp:Label ID="lblerror" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>            
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Width="170px" OnClick="btnEliminar_Click" /></td>
            </tr>
        </table>
    </div>


</asp:Content>
