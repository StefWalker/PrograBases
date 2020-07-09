using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmAskDelete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmDeletePropiedad.aspx");
        }

        protected void btnDelPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmDeletePropietario.aspx");
        }

        protected void btnDelUsu_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmDeleteUsuario.aspx");
        }

        protected void btnDelJur_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmDeletePropJuridico.aspx");
        }

        protected void btnUserPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmDeleteUserPro.aspx");
        }

        protected void btnProPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmDeleteProPro.aspx");
        }

        protected void btnPJurPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmDeleteProJuridicoPro.aspx");
        }

        protected void btnProCconsumo_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmDeleteProCC.aspx");
        }
    }
}