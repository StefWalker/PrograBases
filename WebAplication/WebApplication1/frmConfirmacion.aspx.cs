using CapaEntidades;
using CapaNegocios;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
namespace WebApplication1
{
    public partial class frmConfirmacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            entTemporal obj = negTemporal.IniciarTrans();
            if(obj != null)
            {

            }
            else
            {
                lblerror.Text = "No se recibio id de comprobante";
                lblerror.Visible = true;
            }
          
        }
    }
}