using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmAskCrearUniones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPropxPro_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmUnirProPro.aspx");
        }

        protected void btnProxUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmUnirUserPro.aspx");
        }

        protected void btnProxProJur_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmUnirPJurxPro.aspx");
        }

        protected void btnProCConsumo_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmUnirProCC.aspx");
        }
    }
}