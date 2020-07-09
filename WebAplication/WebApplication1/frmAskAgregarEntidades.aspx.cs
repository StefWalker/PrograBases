using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmAskAgregarEntidades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPropiedad_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskPropiedad.aspx");
        }

        protected void btnPropietario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskPropietario.aspx");
        }

        protected void btnUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAgregarUsuario.aspx");
        }

        protected void btnProJur_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAskAgregarJuridico.aspx");
        }
    }
}