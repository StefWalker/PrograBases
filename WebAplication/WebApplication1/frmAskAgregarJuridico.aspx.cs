using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmAskAgregarJuridico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConPro_Click1(object sender, EventArgs e)
        {
            Response.Redirect("frmAgregarPropJuridico.aspx");
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPrincipal.aspx");
        }
    }
}