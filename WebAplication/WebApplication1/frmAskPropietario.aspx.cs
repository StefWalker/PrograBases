using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAgregarPropietarioCompleto.aspx");
        }
        protected void btnConPro_Click1(object sender, EventArgs e)
        {
            Response.Redirect("frmAgregarPropietario.aspx");
        }
    }
}