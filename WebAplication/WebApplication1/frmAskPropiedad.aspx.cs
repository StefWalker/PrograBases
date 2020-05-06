using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmAskPropiedad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnNueva_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAgregarPropietarioCompleto.aspx");
        }
        protected void btnConPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAgregarPropiedad.aspx");
        }

    }
}