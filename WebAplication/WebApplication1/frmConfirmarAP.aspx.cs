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
            int total = 0;
            GridView1.DataSource = negRecibos.ListarConfirmados();
            GridView1.DataBind();
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                int monto = Convert.ToInt32(GridView1.Rows[i].Cells[4].Text);
                total = total + monto;
            }
            recibos.Text = Convert.ToString(total);
            interes.Text = "10.0%";
            
        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            int ID_Propiedad = Convert.ToInt32(Request.QueryString["ID_Propiedad"]);
            if (Request.QueryString["ID_Propiedad"] != null)
            {
                negAP.ConfirmacionAP(Convert.ToInt32(recibos.Text), ID_Propiedad, Convert.ToInt32(CantidadMeses.Text));
                Response.Redirect("frmPrincipal.aspx");
            }
            else
            {
                lblError.Text = "No hay un propietario asignado";
                lblError.Visible = true; 
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            negComprobante.CancelarTrans();
            Response.Redirect("frmPrincipal.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text);
            int monto = Convert.ToInt32(GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text);
            GridView1.Rows[GridView1.SelectedIndex].Visible = false;
            if (negTemporal.DeleteTemp(id) == 1)
            {
                int total = Convert.ToInt32(recibos.Text);
                recibos.Text = Convert.ToString(total - monto);
                recibos.Visible = true;
            }
            else
            {
                lblError.Text = "Ocurrio un error al borrar el recibo";
                lblError.Visible = true;
            }
        }

        protected void btncuota_Click(object sender, EventArgs e)
        {
            if (CantidadMeses.Text != null)
            {
                int total = Convert.ToInt32(recibos.Text);
                int meses = Convert.ToInt32(CantidadMeses.Text);
                cuota.Text = Convert.ToString(total * ((0.10 * Math.Pow((1 + 0.10), 5)) / (Math.Pow((1 + 0.10), 5) - 1)));
                cuota.Visible = true;
            }
            else
            {
                lblError.Text = "Debes rellanar los espacios";
                lblError.Visible = true;
            }
        }
    }
}