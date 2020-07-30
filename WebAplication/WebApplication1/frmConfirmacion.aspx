<%@ Page Title="" Language="C#" MasterPageFile="~/AnonimoUser.Master" AutoEventWireup="true" CodeBehind="frmConfirmacion.aspx.cs" Inherits="WebApplication1.frmConfirmacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:TextBox runat="server" BorderColor="White" BorderStyle="None">Recibos por pagar </asp:TextBox>
     <br />
    <asp:ListBox runat="server" ID="recibos" ValidateRequestMode="Enabled" Width="300px" ></asp:ListBox>
</asp:Content>
