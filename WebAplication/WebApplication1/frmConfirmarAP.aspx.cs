using CapaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmConfirmarAP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPrincipal.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            negComprobante.CancelarTrans();
            Response.Redirect("frmPrincipal.aspx");
        }
    }
}