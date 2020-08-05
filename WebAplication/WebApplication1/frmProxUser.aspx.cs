using CapaEntidades;
using CapaNegocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmProxUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ID_Propiedad = Convert.ToInt32(Request.QueryString["ID_Propiedad"]);

            if (Request.QueryString["ID_Propiedad"] != null)
            {
                GridView1.DataSource = negRecibos.ListarRecibos(ID_Propiedad);
                GridView1.DataBind();
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    int id = Convert.ToInt32(GridView1.Rows[i].Cells[2].Text);
                    entConceptoCobro tipo = negConceptoCobro.BuscarConcepto(id);
                    if (tipo != null)
                    {
                        GridView1.Rows[0].Cells[3].Text = tipo.Concepto;
                    }
                    else
                    {
                        lblerror.Text = "No se encontro un concepto de cobro asociado.";
                        lblerror.Visible = true;
                    }
                }
             }
            else
            {
                    lblerror.Text = "No se encuentra  el ID de la propiedad";
                    lblerror.Visible = true;
            }
         }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            List<string> selectedValues = CheckBoxList1.Items.Cast<ListItem>().Where(li => li.Selected).Select(li => li.Value).ToList();
            for (int i = 0; i < selectedValues.Count; i++)
            {
                int id = Convert.ToInt32(selectedValues[i]);
                negTemporal.AgregarTemporal(id);

            }
            negRecibos.GenerarMoratorios();
            Response.Redirect("frmConfirmarAP.aspx?ID_Propiedad=" + GridView1.Rows[0].Cells[1].Text);

        }
    }
           
    
}
