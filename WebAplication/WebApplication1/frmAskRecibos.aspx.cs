using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmAskRecibo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPagos_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmRecibosPagos.aspx?ID_Propiedad="+Request.QueryString["ID_Propiedad"]);
        }

        protected void btnPendientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmRecibosPendientes.aspx?ID_Propiedad=" + Request.QueryString["ID_Propiedad"]);
        }

        protected void btnComprbantes_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmComprobantes.aspx?ID_Propiedad=" + Request.QueryString["ID_Propiedad"]);
        }
    }
}