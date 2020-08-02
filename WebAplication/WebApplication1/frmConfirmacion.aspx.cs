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

                GridView1.DataSource = negRecibos.ListarConfirmados(obj.idRecibo);
                GridView1.DataBind();
                entComprobante comprobante = negComprobante.BuscarComprobante(obj.idRecibo);
                total.Text = Convert.ToString(comprobante.MontoPagado); //Corregir lo de comprobantes con la nueva tabla

            }
            else
            {
                lblerror.Text = "No se recibio id de comprobante";
                lblerror.Visible = true;
            }
          
        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            int indicador = negTemporal.FinalTrans(0);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            int indicador = negTemporal.FinalTrans(1);
        }
    }
}