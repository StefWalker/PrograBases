using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmAskRecibos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPendientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmRecibosPendientes.aspx");
        }

        protected void btnPagos_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmRecibosPagos.aspx");
        }

        protected void btnComprobantes_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmComprobantes.aspx");
        }
    }
}