<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmModificarUsuario.aspx.cs" Inherits="WebApplication1.frmModificar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
        <h2>Modificar Usuario</h2>
    <tr>
    <asp:Label ID="ModUsuario" runat="server" Text="Usuario que desea Modificar "></asp:Label>
    </tr>
    <br />
    <br />
    <tr>
        <td colspan="2" align ="left"> <asp:TextBox ID="TextBox1" runat="server" Width="170px" ></asp:TextBox> </td>
    </tr>
    <br />
        <table> 
            <tr> 
                <td> Nombre:</td>
                <td><asp:textbox ID="txtNombre" runat="server" width="200px"></asp:textbox> </td>
            </tr>
            <tr> 
                <td> Contraseña:</td>
                <td><asp:textbox ID="txtPassword" runat="server" width="200px"></asp:textbox> </td>
            </tr>
            <tr> 
                <td> Tipo de Usuario:</td>
                <td><asp:textbox ID="txtTipoUsuario" runat="server" width="200px"></asp:textbox> </td>
            </tr>
            <tr> 

                <td colspan="2"> <asp:label ID="lblerror" runat="server" text="" Visible="false" forecolor="Red"></asp:label>
                </td>
            </tr>
            <tr> 
                <td colspan="2" align="center"><asp:button Id= "btnModificar" runat="server" text="Modificar" Width="170px" OnClick="btnModificar_Click"/> </td>
            </tr>

        </table>

    </div>
</asp:Content>
