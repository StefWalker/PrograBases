using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AskModificar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnModificarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmModificarUsuario.aspx");
        }

        protected void btnModificarPropiedad_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmModificarPropiedad.aspx");
        }

        protected void btnModificarJuridico_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmModificarPropJuridico.aspx");
        }

        protected void btnModificarProPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmModificarProPro.aspx");
        }

        protected void btnModificarUserPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmModificarProUser.aspx");
        }

        protected void btnModificarProp_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmModificarPropietario.aspx");
        }

        protected void btnModificarPJurPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmModificarProProJuridico.aspx");
        }
    }
}