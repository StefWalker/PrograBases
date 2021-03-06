﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmAgregarPropietarioCompleto.aspx.cs" Inherits="WebApplication1.frmAgregarPropietarioCompleto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Nueva Entrada</h2>
        <br />
        <table>
            <tr>
                <td>Identificacion: </td>
                <td> <asp:TextBox ID="IdProp" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Tipo Documento:&nbsp; </td>
                <td> <asp:DropDownList ID="lista" runat="server" width="200px">
                    <asp:ListItem Value="1">Cedula Nacional</asp:ListItem>
                    <asp:ListItem Value="2">Cedula Residente</asp:ListItem>
                    <asp:ListItem Value="3">Pasaporte</asp:ListItem>
                    <asp:ListItem Value="4">Cedula Juridica</asp:ListItem>
                    <asp:ListItem Value="5">Registro Civil</asp:ListItem>
                    <asp:ListItem Value="6">Cedula Extranjero</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
             <tr>
                <td>Nombre de Propietario:&nbsp; </td>
                <td> <asp:TextBox ID="NomProp" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="auto-style4"></td>
            </tr>
            <tr>
                <td>Numero de Propiedad: </td>
                <td> <asp:TextBox ID="txtNumeroPropiedad" runat="server" width="200px"></asp:TextBox></td>
            </tr>
             <tr>
                <td>Valor de la propiedad: </td>
                <td> <asp:TextBox ID="txtValor" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Direccion: </td>
                <td> <asp:TextBox ID="txtDireccion" runat="server" width="200px"></asp:TextBox></td>
            </tr>
            <tr>
               <td colspan="2" class="auto-style4"></td>
                <asp:Label ID="lblerror" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>            
            </tr>
            <tr>
                <td colspan="2" align="center"><asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="170px" OnClick="btnGuardar_Click" /></td>
            </tr>
        </table>
    </div>



</asp:Content>
