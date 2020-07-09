using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class AskBuscar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPropiedad_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarPropiedad.aspx");
        }

        protected void btnUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarUsuario.aspx");
        }

        protected void btnProPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarProPro.aspx");
        }

        protected void btnPropietario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarPropietario.aspx");
        }

        protected void btnProJur_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarPropJuridico.aspx");
        }

        protected void btnUserPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarProUser.aspx");
        }

        protected void btnProProJur_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarProProJur.aspx");
        }

        protected void btnProCConsumo_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmBuscarProCC.aspx");
        }
    }
}