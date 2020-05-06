using CapaEntidades;
using CapaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmAgregar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if(txtNombre.Text!= "" && txtPassword.Text != "" && txtUsuario.Text != "" )
            {
                entUsuario obj = new entUsuario();
                obj.Nombre = txtNombre.Text;
                obj.Password = txtPassword.Text;
                obj.TipoUsuario = txtUsuario.Text;

                if (negUsuario.AgregarUsuario(obj) == 1)
                {
                    Response.Redirect("frmUnirUserPro.aspx");
                }
                else
                {
                    lblerror.Text = "No se pudo agregar el usuario";
                    lblerror.Visible = true;
                }
            }
            else
            {
                lblerror.Text = "Faltan ingresar campos";
                lblerror.Visible = true;
            }
        }
    }
}