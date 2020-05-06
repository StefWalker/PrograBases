<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="estilos1.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 216px;
        }
        .auto-style2 {
            height: 45px;
        }
        .auto-style3 {
            width: 1468px;
            height: 826px;
        }
        .auto-style4 {
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id ="abrigo_general" align= "center" class="auto-style3">
        <div id="content _Login">

            <table class="auto-style4">
                <tr>
                    <td>
                        <asp:Image ID="imagLogin" runat="server" ImageUrl="~/Imagenes/descarga.png" Width="90px" Height="73px" />

                    </td>
                    <td align="left" class="auto-style1">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        Inicio de sesion 
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align ="left">Nombre Usuario: </td>
                </tr>
                <tr>
                    <td colspan="2" align ="left"> <asp:TextBox ID="txtUsuario" runat="server" Width="170px" ></asp:TextBox> </td>
                </tr>
                <tr>
                    <td colspan="2" align ="left">Password: </td>
                </tr>
                <tr>
                    <td colspan="2" align ="left" class="auto-style2"> <asp:TextBox ID="txtpass" runat="server" Width="170px" TextMode="Password"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td colspan="2" align ="Center"><asp:Label ID="lbError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" align ="center"><asp:Button ID="btnAceptar" runat="server" Text="Aceptar" width="150px" OnClick="btnAceptar_Click"/></td>
                </tr>
            </table>
       
        </div>

    </div>
    </form>
</body>
</html>
