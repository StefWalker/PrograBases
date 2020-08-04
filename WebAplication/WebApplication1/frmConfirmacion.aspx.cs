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
            int total = 0;
           GridView1.DataSource = negRecibos.ListarConfirmados();
           GridView1.DataBind();
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                int monto = Convert.ToInt32(GridView1.Rows[i].Cells[4].Text);
                total = total + monto;
            }
            pago.Text = Convert.ToString(total);


        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            negComprobante.IniciarTrans();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            negComprobante.IniciarTrans();
        }
    }
}