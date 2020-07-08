using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AnonimoUser : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            entUsuario obj = (entUsuario)Session["nombre"];
            if (obj != null)
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

        protected void VerPropiedades_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmVerPropiedades.aspx");
        }

        protected void VerRecibos_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmVerPropiedades.aspx");
        }
    }
}