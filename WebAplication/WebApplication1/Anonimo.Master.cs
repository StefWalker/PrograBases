using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Anonimo : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            entUsuario obj = (entUsuario)Session["nombre"];
            if(obj != null)
            {
                NombreUsuario.Text = obj.Nombre;

            }
            else
            {
               // Response.Redirect("frmLogin.aspx");
            }
        }

        protected void lbtlogout_Click(object sender, EventArgs e)
        {
            Session.Remove("nombre");
            Response.Redirect("frmLogin.aspx");
        }

        protected void AgregarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAgregarUsuario.aspx");
        }
        protected void BuscarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscar.aspx");
        }

        protected void ModificarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmModificar.aspx");
        }

        protected void AgregarPropiedad_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskPropiedad.aspx");
        }

        protected void BuscarPropiedad_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarPropiedad.aspx");
        }

        protected void AgregarPropietario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskPropietario.aspx");
        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskDelete.aspx");
        }
    }
}