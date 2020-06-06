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
    public partial class frmModificar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            
            entUsuario obj = new entUsuario();
            obj.Nombre = txtNombre.Text;
            obj.Password = txtPassword.Text;
            obj.TipoUsuario = txtTipoUsuario.Text;
            if (negUsuario.ModificarUsuario(obj, txtNom.Text, password.Text) == 1 )
            {
                Response.Redirect("frmPrincipal.aspx");
            }
            else
            {
                lblerror.Text = "No se pudo modificar el usuario";
                lblerror.Visible = true;
            }
        }
    }
}