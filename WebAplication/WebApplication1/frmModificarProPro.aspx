<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmModificarProPro.aspx.cs" Inherits="WebApplication1.frmModificarProPro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
        <h2>Modificar union de Propietario y Propiedad</h2>
     <asp:Label ID="modificar" runat="server" Text="Identificacion del propietario: "></asp:Label>
    <br />
    <tr>
        <td colspan="2" align ="left"> <asp:TextBox ID="txtID" runat="server" Width="170px" ></asp:TextBox> </td>
    </tr>
    <br />
        <asp:Label ID="Label1" runat="server" Text="Numero de propiedad : "></asp:Label>
    <br />
    <tr>
        <td colspan="2" align ="left"> <asp:TextBox ID="txtPropiedad" runat="server" Width="170px" ></asp:TextBox> </td>
    </tr>
    <br />
    <br />
        <table> 
            <tr> 
                <td> Nueva identificacion:</td>
                <td><asp:textbox ID="txtIdentificacion" runat="server" width="200px"></asp:textbox> </td>
            </tr>
            <tr> 
                <td> Nuevo Numero de Propiedad:</td>
                <td><asp:textbox ID="txtNumeroProp" runat="server" width="200px"></asp:textbox> </td>
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
