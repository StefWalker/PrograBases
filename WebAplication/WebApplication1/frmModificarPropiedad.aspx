<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmModificarPropiedad.aspx.cs" Inherits="WebApplication1.frmaModificarPropiedad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
        <h2>Modificar Propiedad</h2>
     <asp:Label ID="modificar" runat="server" Text="Numero de propiedad: "></asp:Label>
    <br />
    <tr>
        <td colspan="2" align ="left"> <asp:TextBox ID="txtNum" runat="server" Width="170px" ></asp:TextBox> </td>
    </tr>
    <br />
    <br />
        <table> 
            <tr> 
                <td> Nuevo Numero de propiedad:</td>
                <td><asp:textbox ID="txtNumero" runat="server" width="200px"></asp:textbox> </td>
            </tr>
            <tr> 
                <td> Nuevo valor de la propiedad:</td>
                <td><asp:textbox ID="txtValor" runat="server" width="200px"></asp:textbox> </td>
            </tr>
            <tr> 
                <td> Nueva descripcion:</td>
                <td><asp:textbox ID="txtDescripcion" runat="server" width="200px"></asp:textbox> </td>
            </tr>
            <tr> 
                <td> Nueva direccion:</td>
                <td><asp:textbox ID="txtDireccion" runat="server" width="200px"></asp:textbox> </td>
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
