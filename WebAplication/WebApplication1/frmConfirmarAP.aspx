<%@ Page Title="" Language="C#" MasterPageFile="~/Anonimo.Master" AutoEventWireup="true" CodeBehind="frmConfirmarAP.aspx.cs" Inherits="WebApplication1.frmConfirmarAP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="abrigo_formulario"> 
      <h2>Confirmacion de AP</h2>
    
    <br />
    <asp:Label ID="Label1" runat="server" Text="Suma de los recibos:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="recibos" runat="server" Font-Size="Medium"></asp:Label>
     <br />
    <asp:Label ID="Label5" runat="server" Text="Tasa de interes anual:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="interes" runat="server" Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Cantidad de meses:  " Font-Size="Medium"></asp:Label>
    <td> <asp:TextBox ID="CantidadMeses" runat="server" width="200px"></asp:TextBox></td>
    <br />
        <tr>
      <td colspan="2" align ="center"><asp:Button ID="Button1" runat="server"  Text="Generar Cuota" width="150px" OnClick="btncuota_Click"/></td>
     <br />
    <asp:Label ID="Label2" runat="server" Text="Cuota:  " Font-Size="Medium"></asp:Label>
    <asp:Label ID="cuota" runat="server" Font-Size="Medium" ></asp:Label>
     <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ID_Recibo" HeaderText="ID_Recibo" />
                <asp:BoundField DataField="ID_Propiedad" HeaderText="ID_Propiedad" />
                <asp:BoundField DataField="ID_Concepto" HeaderText="ID_Concepto" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                <asp:BoundField DataField="Monto" HeaderText="Monto" />
                  <asp:CommandField HeaderText="Eliminar" ShowSelectButton="True"  />
            </Columns>
        </asp:GridView>
    <br />
          <td colspan="2" align ="Center"><asp:Label ID="lblError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
    </tr>
        <br />
    <tr>
      <td colspan="2" align ="center"><asp:Button ID="Generar" runat="server"  Text="Generar AP" width="150px" OnClick="btnPagar_Click"/></td>
  
      <td colspan="2" align ="center"><asp:Button ID="Cancelar" runat="server" style="margin-left: 25px" Text="Cancelar AP" width="150px" OnClick="btnCancelar_Click"/></td>
    </tr>
        <br />
</asp:Content>
